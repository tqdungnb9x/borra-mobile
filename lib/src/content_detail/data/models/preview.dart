// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'preview.g.dart';

@JsonSerializable()
class ContentPreview extends Equatable {
  final int id;
  @JsonKey(name: "parent_id")
  final int parentId;
  final String? sign;
  final String? name;
  final int? order;
  final int? count;
  const ContentPreview({
    required this.id,
    required this.parentId,
    required this.sign,
    required this.name,
    required this.order,
    required this.count,
  });

  ContentPreview copyWith({
    int? id,
    int? parentId,
    String? sign,
    String? name,
    int? order,
    int? count,
  }) {
    return ContentPreview(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      sign: sign ?? this.sign,
      name: name ?? this.name,
      order: order ?? this.order,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'parentId': parentId,
      'sign': sign,
      'name': name,
      'order': order,
      'count': count,
    };
  }

  factory ContentPreview.fromMap(Map<String, dynamic> map) {
    return ContentPreview(
      id: map['id'] as int,
      parentId: map['parentId'] as int,
      sign: map['sign'] != null ? map['sign'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      order: map['order'] != null ? map['order'] as int : null,
      count: map['count'] != null ? map['count'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContentPreview.fromJson(Map<String, dynamic> source) =>
      _$ContentPreviewFromJson(source);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      parentId,
      sign,
      name,
      order,
      count,
    ];
  }
}
