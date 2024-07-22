// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_content.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class UserContent extends Equatable {
  final int id;
  @JsonKey(name: "content_id")
  final int contentId;
  final String name;
  final String? thumbnail;
  @JsonKey(name: "view_count")
  final int viewCount;
  bool? isLike;
  UserContent({
    required this.id,
    required this.contentId,
    required this.name,
    required this.thumbnail,
    required this.viewCount,
    this.isLike,
  });

  UserContent copyWith({
    int? id,
    int? contentId,
    String? name,
    String? thumbnail,
    int? viewCount,
    bool? isLiked,
  }) {
    return UserContent(
      id: id ?? this.id,
      contentId: contentId ?? this.contentId,
      name: name ?? this.name,
      thumbnail: thumbnail ?? this.thumbnail,
      viewCount: viewCount ?? this.viewCount,
      isLike: isLike,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'contentId': contentId,
      'name': name,
      'thumbnail': thumbnail,
      'viewCount': viewCount,
    };
  }

  factory UserContent.fromMap(Map<String, dynamic> map) {
    return UserContent(
      id: map['id'] as int,
      contentId: map['contentId'] as int,
      name: map['name'] as String,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
      viewCount: map['viewCount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserContent.fromJson(Map<String, dynamic> source) =>
      _$UserContentFromJson(source);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      contentId,
      name,
      thumbnail ?? "",
      viewCount,
    ];
  }
}
