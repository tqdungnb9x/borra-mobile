import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'template_content_model.g.dart';

@JsonSerializable()
class TemplateContent extends Equatable {
  int id;
  TemplateContent({
    required this.id,
  });

  TemplateContent copyWith({
    int? id,
  }) {
    return TemplateContent(
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
    };
  }

  factory TemplateContent.fromMap(Map<String, dynamic> map) {
    return TemplateContent(
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TemplateContent.fromJson(Map<String, dynamic> source) =>
      _$TemplateContentFromJson(source);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id];
}
