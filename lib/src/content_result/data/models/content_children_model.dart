// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'content_children_model.g.dart';

@JsonSerializable()
class ContentChildren extends Equatable {
  final int id;
  @JsonKey(name: 'parent_id')
  final int parentId;
  final String? name;
  final String? sign;
  final int count;
  final int order;
  const ContentChildren({
    required this.id,
    required this.parentId,
    required this.name,
    required this.sign,
    required this.count,
    required this.order,
  });

  ContentChildren copyWith({
    int? id,
    int? parentId,
    String? name,
    String? sign,
    int? count,
    int? order,
  }) {
    return ContentChildren(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      name: name ?? this.name,
      sign: sign ?? this.sign,
      count: count ?? this.count,
      order: order ?? this.order,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'parentId': parentId,
      'name': name,
      'sign': sign,
      'count': count,
      'order': order,
    };
  }

  factory ContentChildren.fromMap(Map<String, dynamic> map) {
    return ContentChildren(
      id: map['id'] as int,
      parentId: map['parentId'] as int,
      name: map['name'] != null ? map['name'] as String : null,
      sign: map['sign'] != null ? map['sign'] as String : null,
      count: map['count'] as int,
      order: map['order'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContentChildren.fromJson(Map<String, dynamic> source) =>
      _$ContentChildrenFromJson(source);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      parentId,
      name,
      sign,
      count,
      order,
    ];
  }
}
