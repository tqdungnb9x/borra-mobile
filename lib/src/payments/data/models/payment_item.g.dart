// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentItem _$PaymentItemFromJson(Map<String, dynamic> json) => PaymentItem(
      id: json['id'] as int,
      title: json['title'] as String,
      platform: json['platform'] as String?,
      platformName: json['platform_name'] as String?,
      price: json['price'],
      method: json['method'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$PaymentItemToJson(PaymentItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'platform': instance.platform,
      'platform_name': instance.platformName,
      'price': instance.price,
      'method': instance.method,
      'created_at': instance.createdAt,
    };
