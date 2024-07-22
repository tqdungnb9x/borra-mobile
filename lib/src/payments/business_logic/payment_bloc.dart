import 'dart:async';
import 'dart:io';

import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/src/payments/data/models/app_payment.dart';
import 'package:borra_app/src/payments/data/models/payment_item.dart';
import 'package:borra_app/src/payments/data/models/purchasable_product.dart';
import 'package:borra_app/src/payments/data/models/purchase_item.dart';
import 'package:borra_app/src/payments/data/models/payment_method.dart';
import 'package:borra_app/src/payments/data/models/payment_product.dart';
import 'package:borra_app/src/payments/data/models/store_state.dart';
import 'package:borra_app/src/payments/data/services/iap_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../../../app_base/models/status.dart';
import '../data/repositories/payment_repository.dart';

part 'payment_state.dart';
part 'payment_event.dart';
part 'payment_bloc.freezed.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> with ApiError {
  final PaymentRepository repo = PaymentRepository();
  final IAPService iapService = IAPService();
  PaymentBloc() : super(PaymentState.initial()) {
    on<_Initial>(_onInitial);
    on<_LoadMore>(_onLoadMore);
    on<_ChangeTabIndex>(_onChangeTabIndex);
    on<_LoadPaymentList>(_onLoadPaymentList);
    on<_LoadPurchaseList>(_onLoadPurchaseList);
    on<_PurchaseBought>(_onPurchaseBought);
    on<_StatusBuyChanged>(_onStatusBuyChanged);
    on<_UpdateUserCoin>(_onUpdateUserCoin);
  }

  FutureOr<void> _onInitial(_Initial event, Emitter<PaymentState> emit) async {
    await apiCallSafety<AppPayment>(
      () async {
        return repo.getAccountPayment();
      },
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
          status: Status.success(data: res),
          appPayment: res!,
        ));
      },
      onCompleted: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
    );

    await apiCallSafety<List<PurchasableProduct>?>(() async {
      return iapService.loadPurchases(state.appPayment?.paymentProduct ?? []);
    }, onStart: () async {
      emit(state.copyWith(storeState: StoreState.loading));
    }, onCompleted: () async {
      emit(state.copyWith(storeState: StoreState.idle));
    }, onSuccess: (res) async {
      emit(state.copyWith(
        products: res?.toList() ?? [],
        storeState: StoreState.available,
      ));
    }, onError: (err) async {
      emit(state.copyWith(storeState: StoreState.notAvailable));
    }, onFinally: () async {
      emit(state.copyWith(storeState: StoreState.idle));
    });
  }

  initial() {
    add(const _Initial());
  }

  loadMore() {
    add(const _LoadMore());
  }

  loadPaymentList(page) {
    add(_LoadPaymentList(page));
  }

  loadPurchaseList(page) {
    add(_LoadPurchaseList(page));
  }

  validateInput(bool selectd) {}
  buy(PaymentProduct product) {
    add(_PurchaseBought(product));
  }

  FutureOr<void> _onLoadMore(
      _LoadMore event, Emitter<PaymentState> emit) async {}

  FutureOr<void> _onLoadPaymentList(
      _LoadPaymentList event, Emitter<PaymentState> emit) async {
    await apiCallSafety<Map<String, dynamic>>(
      () async {
        return repo.getPaymentList(page: event.page);
      },
      onStart: () async =>
          {emit(state.copyWith(statusLoadPaymentList: const Status.loading()))},
      onError: (error) async {
        addError(error);
        emit(state.copyWith(
            statusLoadPaymentList: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
            statusLoadPaymentList: Status.success(data: res),
            listPayment: res!['list'],
            totalPaymentPage: res['lastPage']));
      },
      onCompleted: () async {
        emit(state.copyWith(statusLoadPaymentList: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(statusLoadPaymentList: const Status.idle()));
      },
    );
  }

  FutureOr<void> _onLoadPurchaseList(
      _LoadPurchaseList event, Emitter<PaymentState> emit) async {
    await apiCallSafety<Map<String, dynamic>>(
      () async {
        return repo.getPurchaseList(page: event.page);
      },
      onStart: () async =>
          emit(state.copyWith(statusLoadPurchaseList: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(
            statusLoadPurchaseList: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
            statusLoadPurchaseList: Status.success(data: res),
            listPurchase: res!['list'],
            totalPurchasePage: res['lastPage']));
      },
      onCompleted: () async {
        emit(state.copyWith(statusLoadPurchaseList: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(statusLoadPurchaseList: const Status.idle()));
      },
    );
  }

  FutureOr<void> _onChangeTabIndex(
      _ChangeTabIndex event, Emitter<PaymentState> emit) {
    emit(state.copyWith(tabIndex: event.index));
    if (event.index == 1) {
      loadPaymentList(1);
    }
    if (event.index == 2) {
      loadPurchaseList(1);
    }
  }

  changeTabIndex(int index) {
    add(_ChangeTabIndex(index));
  }

  FutureOr<void> _onPurchaseBought(
      _PurchaseBought event, Emitter<PaymentState> emit) async {
    var item = state.products.firstWhere((element) =>
        element.id ==
        ((event.product.code == "coin_50" && Platform.isIOS)
            ? "coin_50_new"
            : event.product.code));
    emit(state.copyWith(selectedProduct: event.product));
    var result = await iapService.buy(item);
    if (result) {
      print("result${result}");
    } else {
      print("noresult");
    }
  }

  changeStatusBuy(Status status) {
    add(_StatusBuyChanged(status));
    if (state.selectedProduct != null) {
      status.whenOrNull(
        success: (data) {
          PurchaseDetails details = data as PurchaseDetails;
          add(
            _UpdateUserCoin(
                productId: state.selectedProduct!.id,
                purchaseId: details.purchaseID!,
                appProductId: details.productID,
                paymentToken: details.verificationData.serverVerificationData,
                failedReason:
                    details.error == null ? null : details.error!.message),
          );
        },
      );
    }
  }

  FutureOr<void> _onStatusBuyChanged(
      _StatusBuyChanged event, Emitter<PaymentState> emit) {
    emit(state.copyWith(
        statusBuy: event.status, successPurchaseInfo: event.purchaseDetails));
  }

  FutureOr<void> _onUpdateUserCoin(
      _UpdateUserCoin event, Emitter<PaymentState> emit) async {
    await apiCallSafety<int>(
      () async {
        // return repo.updateUserCoin(
        //   productId: event.productId,
        //   purchaseId: event.purchaseId,
        //   appProductId: event.appProductId,
        //   price: event.price,
        //   unit: event.unit,
        //   failedReason: event.failedReason,
        // );
        return repo.updatePayment(
          productId: event.productId,
          purchaseId: event.purchaseId,
          appProductId: event.appProductId,
          paymentToken: event.paymentToken,
          failedReason: event.failedReason,
        );
      },
      onStart: () async =>
          emit(state.copyWith(statusUpdateCoin: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(statusUpdateCoin: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
          statusUpdateCoin: Status.success(data: res),
        ));
      },
      onCompleted: () async {
        emit(state.copyWith(statusUpdateCoin: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(statusUpdateCoin: const Status.idle()));
      },
    );
  }
}
