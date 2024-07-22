// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class ContentCategory extends Equatable {
  final int id;
  final String? name;
  final String? icon;
  final String? link;
  const ContentCategory({
    required this.id,
    this.name,
    this.icon,
    this.link,
  });

  ContentCategory copyWith({
    int? id,
    String? name,
    String? icon,
    String? link,
  }) {
    return ContentCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      link: link ?? this.link,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'icon': icon,
      'link': link,
    };
  }

  factory ContentCategory.fromMap(Map<String, dynamic> map) {
    return ContentCategory(
      id: map['id'] as int,
      name: map['name'] != null ? map['name'] as String : null,
      icon: map['icon'] != null ? map['icon'] as String : null,
      link: map['link'] != null ? map['link'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContentCategory.fromJson(Map<String, dynamic> source) =>
      _$ContentCategoryFromJson(source);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, icon, link];
}
