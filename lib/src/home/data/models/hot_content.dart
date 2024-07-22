// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hot_content.g.dart';

@JsonSerializable()
class HotContent extends Equatable {
  final int id;
  final String name;
  final String summary;
  @JsonKey(name: "is_new")
  final int isNew;
  @JsonKey(name: "is_hot")
  final int isHot;
  final String? thumbnail;
  const HotContent({
    required this.id,
    required this.name,
    required this.summary,
    required this.isNew,
    required this.isHot,
    required this.thumbnail,
  });

  HotContent copyWith({
    int? id,
    String? name,
    String? summary,
    int? isNew,
    int? isHot,
    String? thumbnail,
  }) {
    return HotContent(
      id: id ?? this.id,
      name: name ?? this.name,
      summary: summary ?? this.summary,
      isNew: isNew ?? this.isNew,
      isHot: isHot ?? this.isHot,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'summary': summary,
      'isNew': isNew,
      'isHot': isHot,
      'thumbnail': thumbnail,
    };
  }

  factory HotContent.fromMap(Map<String, dynamic> map) {
    return HotContent(
      id: map['id'] as int,
      name: map['name'] as String,
      summary: map['summary'] as String,
      isNew: map['isNew'] as int,
      isHot: map['isHot'] as int,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HotContent.fromJson(Map<String, dynamic> json) =>
      _$HotContentFromJson(json);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      summary,
      isNew,
      isHot,
      thumbnail,
    ];
  }
}
