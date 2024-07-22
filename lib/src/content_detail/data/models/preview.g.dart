// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentPreview _$ContentPreviewFromJson(Map<String, dynamic> json) =>
    ContentPreview(
      id: json['id'] as int,
      parentId: json['parent_id'] as int,
      sign: json['sign'] as String?,
      name: json['name'] as String?,
      order: json['order'] as int?,
      count: json['count'] as int?,
    );

Map<String, dynamic> _$ContentPreviewToJson(ContentPreview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parent_id': instance.parentId,
      'sign': instance.sign,
      'name': instance.name,
      'order': instance.order,
      'count': instance.count,
    };
