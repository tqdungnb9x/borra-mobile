part of '../rest_api.dart';

class BaseResponse<T> {
  final bool success;
  final int code;
  final String? message;
  final T? data;

  const BaseResponse(
    this.success,
    this.code,
    this.message,
    this.data,
  );

  factory BaseResponse.success(T data) {
    return BaseResponse(true, 200, null, data);
  }

  factory BaseResponse.successMore(T data, T moreData) {
    return BaseResponse(true, 200, null, data);
  }

  factory BaseResponse.error(
    error, {
    int code = 404,
  }) {
    return BaseResponse(
        false, code, errorMessageByCode(error.toString()), null);
  }

  factory BaseResponse.fromJson(Map<String, dynamic> source,
      {String dataKey = 'data',
      String errorKey = 'message',
      int codeSuccess = 200}) {
    return BaseResponse(
      // source['statusCode'] == codeSuccess,
      codeSuccess == 200 || codeSuccess == 201 ? true : false,
      source['code'] ?? 200,
      source[errorKey] ?? "ABC",
      source[dataKey] ?? source['url'] ?? source['id'],
    );
  }

  BaseResponse<T> copyWith(T newData) {
    return BaseResponse<T>(
      success,
      code,
      message,
      newData,
    );
  }

  static errorMessageByCode(String code) {
    switch (code) {
      case "USER_NAME_DUPLICATED":
        return "USER_NAME_DUPLICATED";
      case "EMAIL_DUPLICATED":
        return 'EMAIL_DUPLICATED';
      case "MOBILE_DUPLICATED":
        return 'MOBILE_DUPLICATED';
      case "OLD_PASSWORD_NOT_MATCHING":
        return '현재 비밀번호가 아닙니다.';
      case "FAIL_ADD_AMOUNT_TO_LEDGER":
        return 'FAIL_ADD_AMOUNT_TO_LEDGER';
      case "END_DATE_TIME_INVALID":
        return '시간 설정이 올바르지 않습니다.\n종료 시간을 확인해 주세요.';
      case "NOT_SUFFICIENT_BALANCE":
        return 'NOT_SUFFICIENT_BALANCE';
      case "CAN_NOT_UPLOAD_DOCUMENT":
        return 'CAN_NOT_UPLOAD_DOCUMENT';
      case "CAN_NOT_VERIFY_TRANSACTION_FROM_VENDOR":
        return 'CAN_NOT_VERIFY_TRANSACTION_FROM_VENDOR';
      case "TRANSACTION_FAIL":
        return 'TRANSACTION_FAIL';
      case "COMMISSION_RATE_VENDOR_NOT_FOUND":
        return 'COMMISSION_RATE_VENDOR_NOT_FOUND';
      case "TRANSACTION_NOT_FOUND":
        return 'TRANSACTION_NOT_FOUND';
      case "DATA_NOT_FOUND":
        return 'DATA_NOT_FOUND';
      case "VENDOR_CODE_NOT_FOUND":
        return 'VENDOR_CODE_NOT_FOUND';
      case "REQUEST_DATA_NOT_FOUND":
        return 'REQUEST_DATA_NOT_FOUND';
      case "RATE_PAYMENT_NOT_FOUND":
        return 'RATE_PAYMENT_NOT_FOUND';
      case "RESERVATION_NOT_FOUND":
        return 'RESERVATION_NOT_FOUND';
      case "USER_NOT_FOUND":
        return 'USER_NOT_FOUND';
      case "CUSTOMER_NOT_FOUND":
        return 'CUSTOMER_NOT_FOUND';

      default:
        return code;
    }
  }

  static messDioErrorType(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return "문제가 발생했습니다. 다시 시도해 주세요.";

      default:
        return error.message;
    }
  }
}
