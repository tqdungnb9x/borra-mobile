// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_liked_content_model.g.dart';

@JsonSerializable()
class UserLikedContent extends Equatable {
  final int id;
  @JsonKey(name: "content_id")
  final int contentId;
  final String name;
  final String summary;
  final String thumbnail;
  final int price;
  @JsonKey(name: "is_new")
  final int isNew;
  @JsonKey(name: "is_hot")
  final int isHot;
  @JsonKey(name: "view_count")
  final int viewCount;
  @JsonKey(name: "like_count")
  final int likeCount;
  final bool? isLiked;
  const UserLikedContent({
    required this.id,
    required this.contentId,
    required this.name,
    required this.summary,
    required this.thumbnail,
    required this.price,
    required this.isNew,
    required this.isHot,
    required this.viewCount,
    required this.likeCount,
    this.isLiked,
  });

  UserLikedContent copyWith({
    int? id,
    int? contentId,
    String? name,
    String? summary,
    String? thumbnail,
    int? price,
    int? isNew,
    int? isHot,
    int? viewCount,
    int? likeCount,
    bool? isLike,
  }) {
    return UserLikedContent(
      id: id ?? this.id,
      contentId: contentId ?? this.contentId,
      name: name ?? this.name,
      summary: summary ?? this.summary,
      thumbnail: thumbnail ?? this.thumbnail,
      price: price ?? this.price,
      isNew: isNew ?? this.isNew,
      isHot: isHot ?? this.isHot,
      viewCount: viewCount ?? this.viewCount,
      likeCount: likeCount ?? this.likeCount,
      isLiked: isLiked ?? isLiked,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'contentId': contentId,
      'name': name,
      'summary': summary,
      'thumbnail': thumbnail,
      'price': price,
      'isNew': isNew,
      'isHot': isHot,
      'viewCount': viewCount,
      'likeCount': likeCount,
    };
  }

  factory UserLikedContent.fromMap(Map<String, dynamic> map) {
    return UserLikedContent(
      id: map['id'] as int,
      contentId: map['contentId'] as int,
      name: map['name'] as String,
      summary: map['summary'] as String,
      thumbnail: map['thumbnail'] as String,
      price: map['price'] as int,
      isNew: map['isNew'] as int,
      isHot: map['isHot'] as int,
      viewCount: map['viewCount'] as int,
      likeCount: map['likeCount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLikedContent.fromJson(Map<String, dynamic> source) =>
      _$UserLikedContentFromJson(source);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      contentId,
      name,
      summary,
      thumbnail,
      price,
      isNew,
      isHot,
      viewCount,
      likeCount,
    ];
  }
}
