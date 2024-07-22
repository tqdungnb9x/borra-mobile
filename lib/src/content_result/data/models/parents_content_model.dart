// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'parents_content_model.g.dart';

@JsonSerializable()
class ParentsContent extends Equatable {
  final int id;
  final String name;
  const ParentsContent({
    required this.id,
    required this.name,
  });

  ParentsContent copyWith({
    int? id,
    String? name,
  }) {
    return ParentsContent(
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

  factory ParentsContent.fromMap(Map<String, dynamic> map) {
    return ParentsContent(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ParentsContent.fromJson(Map<String, dynamic> source) =>
      _$ParentsContentFromJson(source);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name];
}
