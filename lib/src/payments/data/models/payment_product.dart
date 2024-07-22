// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_product.g.dart';

@JsonSerializable()
class PaymentProduct extends Equatable {
  final int id;
  final String name;
  final String content;
  final double price;
  @JsonKey(name: 'price_ios')
  final double priceIos;
  @JsonKey(name: 'price_aos')
  final double priceAos;
  @JsonKey(name: 'is_open')
  final dynamic isOpen;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  final String code;
  const PaymentProduct({
    required this.id,
    required this.name,
    required this.content,
    required this.price,
    required this.priceIos,
    required this.priceAos,
    required this.isOpen,
    required this.createdAt,
    required this.updatedAt,
    required this.code,
  });

  PaymentProduct copyWith({
    int? id,
    String? name,
    String? content,
    double? price,
    double? priceIos,
    double? priceAos,
    dynamic isOpen,
    String? createdAt,
    String? updatedAt,
    String? code,
  }) {
    return PaymentProduct(
      id: id ?? this.id,
      name: name ?? this.name,
      content: content ?? this.content,
      price: price ?? this.price,
      priceIos: priceIos ?? this.priceIos,
      priceAos: priceAos ?? this.priceAos,
      isOpen: isOpen ?? this.isOpen,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'content': content,
      'price': price,
      'priceIos': priceIos,
      'priceAos': priceAos,
      'isOpen': isOpen,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'code': code,
    };
  }

  factory PaymentProduct.fromMap(Map<String, dynamic> map) {
    return PaymentProduct(
      id: map['id'] as int,
      name: map['name'] as String,
      content: map['content'] as String,
      price: map['price'] as double,
      priceIos: map['priceIos'] as double,
      priceAos: map['priceAos'] as double,
      isOpen: map['isOpen'] as dynamic,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
      code: map['code'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentProduct.fromJson(Map<String, dynamic> source) =>
      _$PaymentProductFromJson(source);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      content,
      price,
      priceIos,
      priceAos,
      isOpen,
      createdAt,
      updatedAt,
      code,
    ];
  }
}
