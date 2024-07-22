// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_children_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentChildren _$ContentChildrenFromJson(Map<String, dynamic> json) =>
    ContentChildren(
      id: json['id'] as int,
      parentId: json['parent_id'] as int,
      name: json['name'] as String?,
      sign: json['sign'] as String?,
      count: json['count'] as int,
      order: json['order'] as int,
    );

Map<String, dynamic> _$ContentChildrenToJson(ContentChildren instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parent_id': instance.parentId,
      'name': instance.name,
      'sign': instance.sign,
      'count': instance.count,
      'order': instance.order,
    };
