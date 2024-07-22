// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_purchase_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentPurchase _$ContentPurchaseFromJson(Map<String, dynamic> json) =>
    ContentPurchase(
      id: json['id'] as int,
      name: json['name'] as String?,
      gender: json['gender'],
      marital: json['marital'] as String?,
      birthedAt: json['birthed_at'] as String?,
      isBirtheTime: json['is_birthed_time'],
      calendar: json['calendar'] as String?,
      value: json['value'] as String?,
      surveyValue: json['survey_value'],
      price: json['price'] as int,
      gwae: json['gwae'],
      partner: json['partner'] == null
          ? null
          : Partner.fromJson(json['partner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContentPurchaseToJson(ContentPurchase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': instance.gender,
      'marital': instance.marital,
      'birthed_at': instance.birthedAt,
      'is_birthed_time': instance.isBirtheTime,
      'calendar': instance.calendar,
      'value': instance.value,
      'survey_value': instance.surveyValue,
      'price': instance.price,
      'gwae': instance.gwae,
      'partner': instance.partner,
    };

Partner _$PartnerFromJson(Map<String, dynamic> json) => Partner(
      id: json['id'] as int,
      name: json['name'] as String,
      gender: json['gender'],
      marital: json['marital'] as String,
      birthedAt: json['birthed_at'] as String,
      isBirthedTime: json['is_birthed_time'] as int,
      calendar: json['calendar'] as String,
    );

Map<String, dynamic> _$PartnerToJson(Partner instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': instance.gender,
      'marital': instance.marital,
      'birthed_at': instance.birthedAt,
      'is_birthed_time': instance.isBirthedTime,
      'calendar': instance.calendar,
    };
