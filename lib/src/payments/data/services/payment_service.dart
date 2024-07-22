import 'dart:io';

import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/src/payments/data/models/app_payment.dart';
import 'package:borra_app/src/payments/data/models/payment_item.dart';
import 'package:borra_app/src/payments/data/models/purchase_item.dart';

class PaymentService extends Api {
  Future<BaseResponse<AppPayment>> getAccountPayment() async {
    final res = await get('payments');

    if (res.success) {
      AppPayment appPayment = AppPayment.fromJson(res.data);
      return BaseResponse.success(appPayment);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<Map<String, dynamic>>> getPaymentList(
      {required int page}) async {
    final res = await get('accounts/histories/payments', query: {'page': page});

    if (res.success) {
      var list = (res.data['list'] as List<dynamic>).map((e) {
        if (e != null) {
          return PaymentItem.fromJson(e);
        } else {
          return null;
        }
      }).toList();

      Map<String, dynamic> result = {
        'list': list,
        'lastPage': res.data['last_page']
      };
      return BaseResponse.success(result);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<Map<String, dynamic>>> getPurchaseList(
      {required int page}) async {
    final res =
        await get('accounts/histories/purchases', query: {'page': page});

    if (res.success) {
      var list = (res.data['list'] as List<dynamic>)
          .map((e) => PurchaseItem.fromJson(e))
          .toList();
      Map<String, dynamic> result = {
        'list': list,
        'lastPage': res.data['last_page']
      };
      return BaseResponse.success(result);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<int>> updateUserCoin({
    required int productId,
    required String purchaseId,
    required String appProductId,
    required int price,
    required String unit,
    String? failedReason,
  }) async {
    final res = await post('payments/app', data: {
      'platform': Platform.isIOS ? 'ios' : 'aos',
      'product_id': productId,
      'app_purchase_id': purchaseId,
      'app_product_id': appProductId,
      'price': price,
      'unit': unit,
      'failed_reason': failedReason,
    });

    if (res.success) {
      return BaseResponse.success(res.data);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<int>> updatePayment({
    required int productId,
    required String purchaseId,
    required String appProductId,
    required String paymentToken,
    String? failedReason,
  }) async {
    final res = await post(
      Platform.isIOS ? 'payments/app/apple' : 'payments/app/google',
      data: {
        'product_id': productId,
        'app_purchase_id': purchaseId,
        'app_product_id':
            appProductId == "coin_50_new" ? "coin_50" : appProductId,
        "app_purchase_token": paymentToken,
        'failed_reason': failedReason,
      },
    );

    if (res.success) {
      return BaseResponse.success(1);
    }
    return BaseResponse.error(res.message);
  }
}
