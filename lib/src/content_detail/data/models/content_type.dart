// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'content_type.g.dart';

@JsonSerializable()
class ContentType extends Equatable {
  final int id;
  final String name;
  final String description;
  @JsonKey(name: "is_skip")
  final int isSkip;

  const ContentType({
    required this.id,
    required this.name,
    required this.description,
    required this.isSkip,
  });

  ContentType copyWith({
    int? id,
    String? name,
    String? description,
    int? isSkip,
  }) {
    return ContentType(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      isSkip: isSkip ?? this.isSkip,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'isSkip': isSkip,
    };
  }

  factory ContentType.fromMap(Map<String, dynamic> map) {
    return ContentType(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      isSkip: map['isSkip'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContentType.fromJson(Map<String, dynamic> source) =>
      _$ContentTypeFromJson(source);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name, description, isSkip];
}
