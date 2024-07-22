// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppNotice _$AppNoticeFromJson(Map<String, dynamic> json) => AppNotice(
      id: json['id'] as int,
      category: json['category'] as String?,
      name: json['name'] as String,
      contents: json['contents'] as String,
      type: json['type'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$AppNoticeToJson(AppNotice instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'name': instance.name,
      'contents': instance.contents,
      'type': instance.type,
      'created_at': instance.createdAt,
    };
