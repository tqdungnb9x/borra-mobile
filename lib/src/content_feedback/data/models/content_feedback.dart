// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'content_feedback.g.dart';

@JsonSerializable()
class ContentFeedback extends Equatable {
  final int id;
  final String name;
  final int count;
  const ContentFeedback({
    required this.id,
    required this.name,
    required this.count,
  });

  ContentFeedback copyWith({
    int? id,
    String? name,
    int? count,
  }) {
    return ContentFeedback(
      id: id ?? this.id,
      name: name ?? this.name,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'count': count,
    };
  }

  factory ContentFeedback.fromMap(Map<String, dynamic> map) {
    return ContentFeedback(
      id: map['id'] as int,
      name: map['name'] as String,
      count: map['count'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContentFeedback.fromJson(Map<String, dynamic> source) =>
      _$ContentFeedbackFromJson(source);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name, count];
}
