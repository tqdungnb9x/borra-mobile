// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_main_content.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class AppMainContent extends Equatable {
  final int id;
  final String name;
  @JsonKey(name: "content_id")
  final int? contentId;
  @JsonKey(name: "view_count")
  final int viewCount;
  final String? thumbnail;
  bool? isLiked;
  AppMainContent({
    required this.id,
    required this.name,
    this.contentId,
    required this.viewCount,
    required this.thumbnail,
    this.isLiked,
  });

  AppMainContent copyWith({
    int? id,
    String? name,
    int? contentId,
    int? viewCount,
    String? thumbnail,
    bool? isLiked,
  }) {
    return AppMainContent(
      id: id ?? this.id,
      name: name ?? this.name,
      contentId: contentId ?? this.contentId,
      viewCount: viewCount ?? this.viewCount,
      thumbnail: thumbnail ?? this.thumbnail,
      isLiked: isLiked ?? this.isLiked,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'contentId': contentId,
      'viewCount': viewCount,
      'thumbnail': thumbnail,
      'isLiked': isLiked,
    };
  }

  factory AppMainContent.fromMap(Map<String, dynamic> map) {
    return AppMainContent(
      id: map['id'] as int,
      name: map['name'] as String,
      contentId: map['contentId'] != null ? map['contentId'] as int : null,
      viewCount: map['viewCount'] as int,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
      isLiked: map['isLiked'] != null ? map['isLiked'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppMainContent.fromJson(Map<String, dynamic> source) =>
      _$AppMainContentFromJson(source);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      contentId,
      viewCount,
      thumbnail,
      isLiked,
    ];
  }
}
