// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:borra_app/src/payments/data/models/payment_method.dart';
import 'package:borra_app/src/payments/data/models/payment_product.dart';

part 'app_payment.g.dart';

@JsonSerializable()
class AppPayment extends Equatable {
  @JsonKey(name: 'products')
  final List<PaymentProduct> paymentProduct;
  @JsonKey(name: 'method')
  final List<PaymentMethod> paymentMethod;
  AppPayment({
    required this.paymentProduct,
    required this.paymentMethod,
  });

  AppPayment copyWith({
    List<PaymentProduct>? paymentProduct,
    List<PaymentMethod>? paymentMethod,
  }) {
    return AppPayment(
      paymentProduct: paymentProduct ?? this.paymentProduct,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'paymentProduct': paymentProduct.map((x) => x.toMap()).toList(),
      'paymentMethod': paymentMethod.map((x) => x.toMap()).toList(),
    };
  }

  factory AppPayment.fromMap(Map<String, dynamic> map) {
    return AppPayment(
      paymentProduct: List<PaymentProduct>.from(
        (map['paymentProduct'] as List<int>).map<PaymentProduct>(
          (x) => PaymentProduct.fromMap(x as Map<String, dynamic>),
        ),
      ),
      paymentMethod: List<PaymentMethod>.from(
        (map['paymentMethod'] as List<int>).map<PaymentMethod>(
          (x) => PaymentMethod.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory AppPayment.fromJson(Map<String, dynamic> source) =>
      _$AppPaymentFromJson(source);

  @override
  String toString() =>
      'AppPayment(paymentProduct: $paymentProduct, paymentMethod: $paymentMethod)';

  @override
  bool operator ==(covariant AppPayment other) {
    if (identical(this, other)) return true;

    return listEquals(other.paymentProduct, paymentProduct) &&
        listEquals(other.paymentMethod, paymentMethod);
  }

  @override
  int get hashCode => paymentProduct.hashCode ^ paymentMethod.hashCode;

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [paymentProduct, paymentMethod];
}
