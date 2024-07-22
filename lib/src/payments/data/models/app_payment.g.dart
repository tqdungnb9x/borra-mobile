// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppPayment _$AppPaymentFromJson(Map<String, dynamic> json) => AppPayment(
      paymentProduct: (json['products'] as List<dynamic>)
          .map((e) => PaymentProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      paymentMethod: (json['method'] as List<dynamic>)
          .map((e) => PaymentMethod.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppPaymentToJson(AppPayment instance) =>
    <String, dynamic>{
      'products': instance.paymentProduct,
      'method': instance.paymentMethod,
    };
