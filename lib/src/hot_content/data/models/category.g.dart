// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentCategory _$ContentCategoryFromJson(Map<String, dynamic> json) =>
    ContentCategory(
      id: json['id'] as int,
      name: json['name'] as String?,
      icon: json['icon'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$ContentCategoryToJson(ContentCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'link': instance.link,
    };
