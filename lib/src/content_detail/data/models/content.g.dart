// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppContent _$AppContentFromJson(Map<String, dynamic> json) => AppContent(
      id: json['id'] as int,
      category: json['category'] as String,
      type: ContentType.fromJson(json['type'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => AppTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      thumbnail: json['thumbnail'] as String?,
      banner: json['banner'] as String?,
      site: json['site'] as String,
      name: json['name'] as String,
      summary: json['summary'] as String,
      contents: json['contents'] as String,
      likeCount: json['like_count'] as int,
      shareCount: json['share_count'] as int,
      price: json['price'] as int,
      discountPrice: json['discount_price'] as int,
      isDiscount: json['is_discount'] as bool,
      isFirstFree: json['is_first_free'] as int,
      waitFreeTime: json['wait_free_time'] as int,
      isFirstFreeUsed: json['is_first_free_used'] as bool,
      userWaitFreeTime: json['user_wait_free_time'] as String?,
      purchasesFlat: (json['purchases_flat'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isSkip: json['is_skip'] as int,
      isPartner: json['is_partner'] as bool,
      isSurvey: json['is_survey'] as bool,
      tarot: (json['tarot'] as List<dynamic>)
          .map((e) => ContentTarot.fromJson(e as Map<String, dynamic>))
          .toList(),
      tarotCount: json['tarot_count'] as int,
    );

Map<String, dynamic> _$AppContentToJson(AppContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'type': instance.type,
      'tags': instance.tags,
      'thumbnail': instance.thumbnail,
      'banner': instance.banner,
      'site': instance.site,
      'name': instance.name,
      'summary': instance.summary,
      'contents': instance.contents,
      'like_count': instance.likeCount,
      'share_count': instance.shareCount,
      'price': instance.price,
      'discount_price': instance.discountPrice,
      'is_discount': instance.isDiscount,
      'is_first_free': instance.isFirstFree,
      'wait_free_time': instance.waitFreeTime,
      'is_first_free_used': instance.isFirstFreeUsed,
      'user_wait_free_time': instance.userWaitFreeTime,
      'purchases_flat': instance.purchasesFlat,
      'is_skip': instance.isSkip,
      'is_partner': instance.isPartner,
      'is_survey': instance.isSurvey,
      'tarot': instance.tarot,
      'tarot_count': instance.tarotCount,
    };
