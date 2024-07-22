// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_method.g.dart';

@JsonSerializable()
class PaymentMethod extends Equatable {
  final int id;
  final String name;
  final String content;
  @JsonKey(name: 'is_open')
  final dynamic isOpen;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  const PaymentMethod({
    required this.id,
    required this.name,
    required this.content,
    required this.isOpen,
    required this.createdAt,
    required this.updatedAt,
  });

  PaymentMethod copyWith({
    int? id,
    String? name,
    String? content,
    dynamic isOpen,
    String? createdAt,
    String? updatedAt,
  }) {
    return PaymentMethod(
      id: id ?? this.id,
      name: name ?? this.name,
      content: content ?? this.content,
      isOpen: isOpen ?? this.isOpen,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'content': content,
      'isOpen': isOpen,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory PaymentMethod.fromMap(Map<String, dynamic> map) {
    return PaymentMethod(
      id: map['id'] as int,
      name: map['name'] as String,
      content: map['content'] as String,
      isOpen: map['isOpen'] as dynamic,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentMethod.fromJson(Map<String, dynamic> source) =>
      _$PaymentMethodFromJson(source);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      content,
      isOpen,
      createdAt,
      updatedAt,
    ];
  }
}
