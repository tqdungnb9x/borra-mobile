// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentProduct _$PaymentProductFromJson(Map<String, dynamic> json) =>
    PaymentProduct(
      id: json['id'] as int,
      name: json['name'] as String,
      content: json['content'] as String,
      price: (json['price'] as num).toDouble(),
      priceIos: (json['price_ios'] as num).toDouble(),
      priceAos: (json['price_aos'] as num).toDouble(),
      isOpen: json['is_open'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      code: json['code'] as String,
    );

Map<String, dynamic> _$PaymentProductToJson(PaymentProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'content': instance.content,
      'price': instance.price,
      'price_ios': instance.priceIos,
      'price_aos': instance.priceAos,
      'is_open': instance.isOpen,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'code': instance.code,
    };
