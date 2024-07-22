// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_main_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppMainContent _$AppMainContentFromJson(Map<String, dynamic> json) =>
    AppMainContent(
      id: json['id'] as int,
      name: json['name'] as String,
      contentId: json['content_id'] as int?,
      viewCount: json['view_count'] as int,
      thumbnail: json['thumbnail'] as String?,
      isLiked: json['isLiked'] as bool?,
    );

Map<String, dynamic> _$AppMainContentToJson(AppMainContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'content_id': instance.contentId,
      'view_count': instance.viewCount,
      'thumbnail': instance.thumbnail,
      'isLiked': instance.isLiked,
    };
