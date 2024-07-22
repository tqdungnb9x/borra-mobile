// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LikeContent _$LikeContentFromJson(Map<String, dynamic> json) => LikeContent(
      id: json['id'] as int,
      name: json['name'] as String,
      summary: json['summary'] as String?,
      thumbnail: json['thumbnail'] as String?,
      price: json['price'] as int,
      discountPrice: json['discount_price'] as int?,
      isDiscount: json['is_discount'] as bool,
      isNew: json['is_new'] as int,
      isHot: json['is_hot'] as int,
      viewCount: json['view_count'] as int,
      likeCount: json['like_count'] as int,
    );

Map<String, dynamic> _$LikeContentToJson(LikeContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'summary': instance.summary,
      'thumbnail': instance.thumbnail,
      'price': instance.price,
      'discount_price': instance.discountPrice,
      'is_discount': instance.isDiscount,
      'is_new': instance.isNew,
      'is_hot': instance.isHot,
      'view_count': instance.viewCount,
      'like_count': instance.likeCount,
    };
