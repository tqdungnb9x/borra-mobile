// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'like_content_model.g.dart';

@JsonSerializable()
class LikeContent extends Equatable {
  final int id;
  final String name;
  final String? summary;
  final String? thumbnail;
  final int price;
  @JsonKey(name: "discount_price")
  final int? discountPrice;
  @JsonKey(name: "is_discount")
  final bool isDiscount;
  @JsonKey(name: "is_new")
  final int isNew;
  @JsonKey(name: "is_hot")
  final int isHot;
  @JsonKey(name: "view_count")
  final int viewCount;
  @JsonKey(name: "like_count")
  final int likeCount;
  const LikeContent({
    required this.id,
    required this.name,
    required this.summary,
    required this.thumbnail,
    required this.price,
    required this.discountPrice,
    required this.isDiscount,
    required this.isNew,
    required this.isHot,
    required this.viewCount,
    required this.likeCount,
  });

  LikeContent copyWith({
    int? id,
    String? name,
    String? summary,
    String? thumbnail,
    int? price,
    int? discountPrice,
    bool? isDiscount,
    int? isNew,
    int? isHot,
    int? viewCount,
    int? likeCount,
  }) {
    return LikeContent(
      id: id ?? this.id,
      name: name ?? this.name,
      summary: summary ?? this.summary,
      thumbnail: thumbnail ?? this.thumbnail,
      price: price ?? this.price,
      discountPrice: discountPrice ?? this.discountPrice,
      isDiscount: isDiscount ?? this.isDiscount,
      isNew: isNew ?? this.isNew,
      isHot: isHot ?? this.isHot,
      viewCount: viewCount ?? this.viewCount,
      likeCount: likeCount ?? this.likeCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'summary': summary,
      'thumbnail': thumbnail,
      'price': price,
      'discountPrice': discountPrice,
      'isDiscount': isDiscount,
      'isNew': isNew,
      'isHot': isHot,
      'viewCount': viewCount,
      'likeCount': likeCount,
    };
  }

  factory LikeContent.fromMap(Map<String, dynamic> map) {
    return LikeContent(
      id: map['id'] as int,
      name: map['name'] as String,
      summary: map['summary'] != null ? map['summary'] as String : null,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
      price: map['price'] as int,
      discountPrice:
          map['discountPrice'] != null ? map['discountPrice'] as int : null,
      isDiscount: map['isDiscount'] as bool,
      isNew: map['isNew'] as int,
      isHot: map['isHot'] as int,
      viewCount: map['viewCount'] as int,
      likeCount: map['likeCount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory LikeContent.fromJson(Map<String, dynamic> source) =>
      _$LikeContentFromJson(source);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      summary,
      thumbnail,
      price,
      discountPrice,
      isDiscount,
      isNew,
      isHot,
      viewCount,
      likeCount,
    ];
  }
}
