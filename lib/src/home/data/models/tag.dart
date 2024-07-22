// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

@JsonSerializable()
class AppTag extends Equatable {
  final int id;
  final String name;
  const AppTag({
    required this.id,
    required this.name,
  });

  AppTag copyWith({
    int? id,
    String? name,
  }) {
    return AppTag(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory AppTag.fromMap(Map<String, dynamic> map) {
    return AppTag(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppTag.fromJson(Map<String, dynamic> source) =>
      _$AppTagFromJson(source);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name];
}
