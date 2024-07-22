// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_item.g.dart';

@JsonSerializable()
class PaymentItem extends Equatable {
  final int id;
  final String title;
  final String? platform;
  @JsonKey(name: 'platform_name')
  final String? platformName;
  final dynamic price;
  final String method;
  @JsonKey(name: 'created_at')
  final String createdAt;
  const PaymentItem({
    required this.id,
    required this.title,
    this.platform,
    this.platformName,
    required this.price,
    required this.method,
    required this.createdAt,
  });

  PaymentItem copyWith({
    int? id,
    String? title,
    String? platform,
    String? platformName,
    dynamic price,
    String? method,
    String? createdAt,
  }) {
    return PaymentItem(
      id: id ?? this.id,
      title: title ?? this.title,
      platform: platform ?? this.platform,
      platformName: platformName ?? this.platformName,
      price: price ?? this.price,
      method: method ?? this.method,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'platform': platform,
      'platformName': platformName,
      'price': price,
      'method': method,
      'createdAt': createdAt,
    };
  }

  factory PaymentItem.fromMap(Map<String, dynamic> map) {
    return PaymentItem(
      id: map['id'] as int,
      title: map['title'] as String,
      platform: map['platform'] != null ? map['platform'] as String : null,
      platformName:
          map['platformName'] != null ? map['platformName'] as String : null,
      price: map['price'] as dynamic,
      method: map['method'] as String,
      createdAt: map['createdAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentItem.fromJson(Map<String, dynamic> source) =>
      _$PaymentItemFromJson(source);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      title,
      platform,
      platformName,
      price,
      method,
      createdAt,
    ];
  }
}
