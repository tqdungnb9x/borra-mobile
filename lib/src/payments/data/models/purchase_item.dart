// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'purchase_item.g.dart';

@JsonSerializable()
class PurchaseItem extends Equatable {
  final int id;
  @JsonKey(name: 'purchase_id')
  final int purchaseId;
  final String title;
  final String price;
  @JsonKey(name: 'created_at')
  final String createdAt;
  const PurchaseItem({
    required this.id,
    required this.purchaseId,
    required this.title,
    required this.price,
    required this.createdAt,
  });

  PurchaseItem copyWith({
    int? id,
    int? purchaseId,
    String? title,
    String? price,
    String? createdAt,
  }) {
    return PurchaseItem(
      id: id ?? this.id,
      purchaseId: purchaseId ?? this.purchaseId,
      title: title ?? this.title,
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'purchaseId': purchaseId,
      'title': title,
      'price': price,
      'createdAt': createdAt,
    };
  }

  factory PurchaseItem.fromMap(Map<String, dynamic> map) {
    return PurchaseItem(
      id: map['id'] as int,
      purchaseId: map['purchaseId'] as int,
      title: map['title'] as String,
      price: map['price'] as String,
      createdAt: map['createdAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PurchaseItem.fromJson(Map<String, dynamic> source) =>
      _$PurchaseItemFromJson(source);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      purchaseId,
      title,
      price,
      createdAt,
    ];
  }
}
