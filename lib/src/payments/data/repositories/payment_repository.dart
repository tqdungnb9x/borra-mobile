import 'package:borra_app/src/payments/data/models/app_payment.dart';
import 'package:borra_app/src/payments/data/services/payment_service.dart';

import '../../../../app_base/services/rest_api/rest_api.dart';

class PaymentRepository {
  final PaymentService _service = PaymentService();
  Future<BaseResponse<AppPayment>> getAccountPayment() async {
    final result = await _service.getAccountPayment();
    return result;
  }

  Future<BaseResponse<Map<String, dynamic>>> getPaymentList(
      {required int page}) async {
    return await _service.getPaymentList(page: page);
  }

  Future<BaseResponse<Map<String, dynamic>>> getPurchaseList(
      {required int page}) async {
    return await _service.getPurchaseList(page: page);
  }

  Future<BaseResponse<int>> updateUserCoin({
    required int productId,
    required String purchaseId,
    required String appProductId,
    required int price,
    required String unit,
    String? failedReason,
  }) async {
    return await _service.updateUserCoin(
      productId: productId,
      purchaseId: purchaseId,
      appProductId: appProductId,
      price: price,
      unit: unit,
    );
  }

  Future<BaseResponse<int>> updatePayment({
    required int productId,
    required String purchaseId,
    required String appProductId,
    required String paymentToken,
    String? failedReason,
  }) async {
    return await _service.updatePayment(
      productId: productId,
      purchaseId: purchaseId,
      appProductId: appProductId,
      paymentToken: paymentToken,
      failedReason: failedReason,
    );
  }
}
