// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentType _$ContentTypeFromJson(Map<String, dynamic> json) => ContentType(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      isSkip: json['is_skip'] as int,
    );

Map<String, dynamic> _$ContentTypeToJson(ContentType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'is_skip': instance.isSkip,
    };
