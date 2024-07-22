// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotContent _$HotContentFromJson(Map<String, dynamic> json) => HotContent(
      id: json['id'] as int,
      name: json['name'] as String,
      summary: json['summary'] as String,
      isNew: json['is_new'] as int,
      isHot: json['is_hot'] as int,
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$HotContentToJson(HotContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'summary': instance.summary,
      'is_new': instance.isNew,
      'is_hot': instance.isHot,
      'thumbnail': instance.thumbnail,
    };
