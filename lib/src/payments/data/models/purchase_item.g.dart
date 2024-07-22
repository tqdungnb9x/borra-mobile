// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseItem _$PurchaseItemFromJson(Map<String, dynamic> json) => PurchaseItem(
      id: json['id'] as int,
      purchaseId: json['purchase_id'] as int,
      title: json['title'] as String,
      price: json['price'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$PurchaseItemToJson(PurchaseItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'purchase_id': instance.purchaseId,
      'title': instance.title,
      'price': instance.price,
      'created_at': instance.createdAt,
    };
