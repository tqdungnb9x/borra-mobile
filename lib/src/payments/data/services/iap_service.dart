import 'dart:async';
import 'dart:io';

import 'package:borra_app/app_base/models/status.dart';
import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/app_base/utils/app_utils.dart';
import 'package:borra_app/common/main_bloc.dart';
import 'package:borra_app/src/payments/data/models/payment_product.dart';
import 'package:borra_app/src/payments/data/models/purchasable_product.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';

class IAPService {
  IAPService() {
    final purchaseUpdated = iapConnection.purchaseStream;
    _subscription = purchaseUpdated.listen(
      _onPurchaseUpdate,
      onDone: _updateStreamOnDone,
      onError: _updateStreamOnError,
    );
  }

  final iapConnection = IAPConnection.instance;
  late StreamSubscription<List<PurchaseDetails>> _subscription;

  bool get beautifiedDash => _beautifiedDashUpgrade;
  final bool _beautifiedDashUpgrade = false;

  void _updateStreamOnDone() {
    _subscription.cancel();
  }

  void _updateStreamOnError(dynamic error) {
    LoggerUtils.log(error);
  }

  Future _onPurchaseUpdate(List<PurchaseDetails> purchaseDetailsList) async {
    for (var purchaseDetails in purchaseDetailsList) {
      await _handlePurchase(purchaseDetails);
    }
  }

  Future<PurchaseDetails?> _handlePurchase(
      PurchaseDetails purchaseDetails) async {
    switch (purchaseDetails.status) {
      case PurchaseStatus.pending:
        MainBloc.paymentBloc.changeStatusBuy(const Status.loading());
        break;
      case PurchaseStatus.purchased:
        final bool valid = await _verifyPurchase(purchaseDetails);
        if (valid) {
          MainBloc.paymentBloc.changeStatusBuy(
            Status.success(data: purchaseDetails),
          );
        } else {
          MainBloc.paymentBloc
              .changeStatusBuy(const Status.failure(error: "Validate error"));
        }
        break;
      case PurchaseStatus.canceled:
        MainBloc.paymentBloc
            .changeStatusBuy(const Status.failure(error: "Canceled"));
        break;
      case PurchaseStatus.error:
        MainBloc.paymentBloc.changeStatusBuy(
            Status.failure(error: purchaseDetails.error!.message));
        break;
      default:
        MainBloc.paymentBloc.changeStatusBuy(const Status.idle());
        break;
    }
    if (purchaseDetails.pendingCompletePurchase) {
      await iapConnection.completePurchase(purchaseDetails);
    }
    return null;
  }

  Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) async {
    return true;
  }

  Future<BaseResponse<List<PurchasableProduct>?>> loadPurchases(
      List<PaymentProduct> data) async {
    final available = await iapConnection.isAvailable();
    if (!available || data.isEmpty) {
      return BaseResponse.error("");
    }
    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition =
          iapConnection
              .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iosPlatformAddition.setDelegate(PaymentQueueDelegate());
    }

    var ids = <String>{};
    ids = data.map((e) => e.code).toSet();
    if (Platform.isIOS) {
      ids.add("coin_50_new");
    }
    final response = await iapConnection.queryProductDetails(ids);

    if (response.productDetails.isEmpty) {
      return BaseResponse.error("");
    }
    final products = response.productDetails.map((e) {
      return PurchasableProduct(e);
    }).toList();

    return BaseResponse.success(products);
  }

  Future<bool> buy(PurchasableProduct product) async {
    try {
      MainBloc.paymentBloc.changeStatusBuy(const Status.loading());
      final purchaseParam =
          PurchaseParam(productDetails: product.productDetails);
      bool isRequestSentToStore =
          await iapConnection.buyConsumable(purchaseParam: purchaseParam);
      return isRequestSentToStore;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

class IAPConnection {
  static InAppPurchase? _instance;

  static set instance(InAppPurchase value) {
    _instance = value;
  }

  static InAppPurchase get instance {
    _instance ??= InAppPurchase.instance;
    return _instance!;
  }
}

class PaymentQueueDelegate implements SKPaymentQueueDelegateWrapper {
  @override
  bool shouldContinueTransaction(
      SKPaymentTransactionWrapper transaction, SKStorefrontWrapper storefront) {
    return true;
  }

  @override
  bool shouldShowPriceConsent() {
    return false;
  }
}
