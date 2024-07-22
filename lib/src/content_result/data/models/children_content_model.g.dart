// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'children_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChildrenContent _$ChildrenContentFromJson(Map<String, dynamic> json) =>
    ChildrenContent(
      id: json['id'] as int,
      category: json['category_id'] as int,
      type: ContentType.fromJson(json['type'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => AppTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      thumbnail: json['thumbnail_id'] as int,
      banner: json['banner'],
      site: json['site'] as String?,
      name: json['name'] as String?,
      summary: json['summary'] as String?,
      contents: json['contents'] as String?,
      likeCount: json['like_count'] as int,
      shareCount: json['share_count'] as int,
      price: json['price'] as int,
      isFirstFree: json['is_first_free'] as int,
      waitFreeTime: json['wait_free_time'] as int,
    );

Map<String, dynamic> _$ChildrenContentToJson(ChildrenContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.category,
      'type': instance.type,
      'tags': instance.tags,
      'thumbnail_id': instance.thumbnail,
      'banner': instance.banner,
      'site': instance.site,
      'name': instance.name,
      'summary': instance.summary,
      'contents': instance.contents,
      'like_count': instance.likeCount,
      'share_count': instance.shareCount,
      'price': instance.price,
      'is_first_free': instance.isFirstFree,
      'wait_free_time': instance.waitFreeTime,
    };
