// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_liked_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLikedContent _$UserLikedContentFromJson(Map<String, dynamic> json) =>
    UserLikedContent(
      id: json['id'] as int,
      contentId: json['content_id'] as int,
      name: json['name'] as String,
      summary: json['summary'] as String,
      thumbnail: json['thumbnail'] as String,
      price: json['price'] as int,
      isNew: json['is_new'] as int,
      isHot: json['is_hot'] as int,
      viewCount: json['view_count'] as int,
      likeCount: json['like_count'] as int,
      isLiked: json['isLiked'] as bool?,
    );

Map<String, dynamic> _$UserLikedContentToJson(UserLikedContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content_id': instance.contentId,
      'name': instance.name,
      'summary': instance.summary,
      'thumbnail': instance.thumbnail,
      'price': instance.price,
      'is_new': instance.isNew,
      'is_hot': instance.isHot,
      'view_count': instance.viewCount,
      'like_count': instance.likeCount,
      'isLiked': instance.isLiked,
    };
