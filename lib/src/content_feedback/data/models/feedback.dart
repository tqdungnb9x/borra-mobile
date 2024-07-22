// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'content_feedback.dart';

part 'feedback.g.dart';

@JsonSerializable()
class FeedbackResult extends Equatable {
  final int id;
  @JsonKey(name: 'content_id')
  final int contentId;
  @JsonKey(name: 'feedback_id')
  final int feedbackId;
  @JsonKey(name: 'purchase_id')
  final int purchaseId;
  final int price;
  final String message;
  const FeedbackResult({
    required this.id,
    required this.contentId,
    required this.feedbackId,
    required this.purchaseId,
    required this.price,
    required this.message,
  });

  FeedbackResult copyWith({
    int? id,
    int? contentId,
    int? feedbackId,
    int? purchaseId,
    int? price,
    String? message,
  }) {
    return FeedbackResult(
      id: id ?? this.id,
      contentId: contentId ?? this.contentId,
      feedbackId: feedbackId ?? this.feedbackId,
      purchaseId: purchaseId ?? this.purchaseId,
      price: price ?? this.price,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'contentId': contentId,
      'feedbackId': feedbackId,
      'purchaseId': purchaseId,
      'price': price,
      'message': message,
    };
  }

  factory FeedbackResult.fromMap(Map<String, dynamic> map) {
    return FeedbackResult(
      id: map['id'] as int,
      contentId: map['contentId'] as int,
      feedbackId: map['feedbackId'] as int,
      purchaseId: map['purchaseId'] as int,
      price: map['price'] as int,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FeedbackResult.fromJson(Map<String, dynamic> source) =>
      _$FeedbackResultFromJson(source);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      contentId,
      feedbackId,
      purchaseId,
      price,
      message,
    ];
  }
}

class AppFeedback {
  final List<ContentFeedback> listFeedback;
  final int? feedbackSelected;
  AppFeedback({
    required this.listFeedback,
    this.feedbackSelected,
  });

  AppFeedback copyWith({
    List<ContentFeedback>? listFeedback,
    int? feedbackSelected,
  }) {
    return AppFeedback(
      listFeedback: listFeedback ?? this.listFeedback,
      feedbackSelected: feedbackSelected ?? this.feedbackSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'listFeedback': listFeedback.map((x) => x.toMap()).toList(),
      'feedbackSelected': feedbackSelected,
    };
  }

  factory AppFeedback.fromMap(Map<String, dynamic> map) {
    return AppFeedback(
      listFeedback: List<ContentFeedback>.from(
        (map['listFeedback'] as List<int>).map<ContentFeedback>(
          (x) => ContentFeedback.fromMap(x as Map<String, dynamic>),
        ),
      ),
      feedbackSelected: map['feedbackSelected'] != null
          ? map['feedbackSelected'] as int
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppFeedback.fromJson(String source) =>
      AppFeedback.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AppFeedback(listFeedback: $listFeedback, feedbackSelected: $feedbackSelected)';

  @override
  bool operator ==(covariant AppFeedback other) {
    if (identical(this, other)) return true;

    return listEquals(other.listFeedback, listFeedback) &&
        other.feedbackSelected == feedbackSelected;
  }

  @override
  int get hashCode => listFeedback.hashCode ^ feedbackSelected.hashCode;
}
