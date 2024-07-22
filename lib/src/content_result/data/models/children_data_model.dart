// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:borra_app/src/content_result/data/models/template_content_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'children_data_model.g.dart';

@JsonSerializable()
class ChildrenData extends Equatable {
  final int id;
  @JsonKey(name: 'child_id')
  final int childId;
  @JsonKey(name: 'fortune_id')
  final int fortuneId;
  final String? contents;
  final String? name;
  final String? summary;
  // final List<TemplateContent>? template;
  final TemplateContent? template;

  const ChildrenData({
    required this.id,
    required this.childId,
    required this.fortuneId,
    required this.contents,
    this.name,
    this.template,
    this.summary,
  });

  ChildrenData copyWith(
      {int? id,
      int? childId,
      int? fortuneId,
      String? contents,
      String? name,
      String? summary,
      TemplateContent? template
      // int? template
      }) {
    return ChildrenData(
      id: id ?? this.id,
      childId: childId ?? this.childId,
      fortuneId: fortuneId ?? this.fortuneId,
      contents: contents ?? this.contents,
      name: name ?? this.name,
      summary: summary ?? this.summary,
      template: template ?? this.template,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'childId': childId,
      'fortuneId': fortuneId,
      'contents': contents,
      'name': name,
      'summary': summary,
      'template': template,
      // 'template': template?.map((x) => x.toMap()).toList() ?? [],
    };
  }

  factory ChildrenData.fromMap(Map<String, dynamic> map) {
    return ChildrenData(
      id: map['id'] as int,
      childId: map['childId'] as int,
      fortuneId: map['fortuneId'] as int,
      contents: map['contents'] != null ? map['contents'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      summary: map['summary'] != null ? map['summary'] as String : null,
      template: TemplateContent.fromMap(map['content'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChildrenData.fromJson(Map<String, dynamic> source) =>
      _$ChildrenDataFromJson(source);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      childId,
      fortuneId,
      contents,
      name,
      summary,
      template ?? [],
    ];
  }
}
