// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notice_model.g.dart';

@JsonSerializable()
class AppNotice extends Equatable {
  final int id;
  final String? category;
  final String name;
  final String contents;
  final String type;
  @JsonKey(name: 'created_at')
  final String createdAt;
  const AppNotice({
    required this.id,
    this.category,
    required this.name,
    required this.contents,
    required this.type,
    required this.createdAt,
  });

  AppNotice copyWith({
    int? id,
    String? category,
    String? name,
    String? contents,
    String? type,
    String? createdAt,
  }) {
    return AppNotice(
      id: id ?? this.id,
      category: category ?? this.category,
      name: name ?? this.name,
      contents: contents ?? this.contents,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'category': category,
      'name': name,
      'contents': contents,
      'type': type,
      'createdAt': createdAt,
    };
  }

  factory AppNotice.fromMap(Map<String, dynamic> map) {
    return AppNotice(
      id: map['id'] as int,
      category: map['category'] != null ? map['category'] as String : null,
      name: map['name'] as String,
      contents: map['contents'] as String,
      type: map['type'] as String,
      createdAt: map['createdAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppNotice.fromJson(Map<String, dynamic> source) =>
      _$AppNoticeFromJson(source);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      category,
      name,
      contents,
      type,
      createdAt,
    ];
  }
}

enum NoticeType { notice, faq }

extension NoticeTypeExt on String {
  String get getStringType {
    final values = {
      NoticeType.notice: 'notice',
      NoticeType.faq: 'faq',
    };
    return values[this]!;
  }
}
