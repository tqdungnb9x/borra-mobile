// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserContent _$UserContentFromJson(Map<String, dynamic> json) => UserContent(
      id: json['id'] as int,
      contentId: json['content_id'] as int,
      name: json['name'] as String,
      thumbnail: json['thumbnail'] as String?,
      viewCount: json['view_count'] as int,
      isLike: json['isLike'] as bool?,
    );

Map<String, dynamic> _$UserContentToJson(UserContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content_id': instance.contentId,
      'name': instance.name,
      'thumbnail': instance.thumbnail,
      'view_count': instance.viewCount,
      'isLike': instance.isLike,
    };
