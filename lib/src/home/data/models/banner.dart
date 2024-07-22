// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';

@JsonSerializable()
class AppBanner extends Equatable {
  final int id;
  final String name;
  final String link;
  final String thumbnail;
  const AppBanner({
    required this.id,
    required this.name,
    required this.link,
    required this.thumbnail,
  });

  AppBanner copyWith({
    int? id,
    String? name,
    String? link,
    String? thumbnail,
  }) {
    return AppBanner(
      id: id ?? this.id,
      name: name ?? this.name,
      link: link ?? this.link,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'link': link,
      'thumbnail': thumbnail,
    };
  }

  factory AppBanner.fromMap(Map<String, dynamic> map) {
    return AppBanner(
      id: map['id'] as int,
      name: map['name'] as String,
      link: map['link'] as String,
      thumbnail: map['thumbnail'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name, link, thumbnail];

  factory AppBanner.fromJson(Map<String, dynamic> json) =>
      _$AppBannerFromJson(json);
}
