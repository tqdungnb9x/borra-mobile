// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tarot.g.dart';

@JsonSerializable()
class ContentTarot extends Equatable {
  final String name;
  @JsonKey(name: "is_straight")
  final int isStraight;
  const ContentTarot({
    required this.name,
    required this.isStraight,
  });

  ContentTarot copyWith({
    String? name,
    int? isStraight,
  }) {
    return ContentTarot(
      name: name ?? this.name,
      isStraight: isStraight ?? this.isStraight,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'isStraight': isStraight,
    };
  }

  factory ContentTarot.fromMap(Map<String, dynamic> map) {
    return ContentTarot(
      name: map['name'] as String,
      isStraight: map['isStraight'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContentTarot.fromJson(Map<String, dynamic> source) =>
      _$ContentTarotFromJson(source);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [name, isStraight];
}
