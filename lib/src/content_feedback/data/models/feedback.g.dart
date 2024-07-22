// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackResult _$FeedbackResultFromJson(Map<String, dynamic> json) =>
    FeedbackResult(
      id: json['id'] as int,
      contentId: json['content_id'] as int,
      feedbackId: json['feedback_id'] as int,
      purchaseId: json['purchase_id'] as int,
      price: json['price'] as int,
      message: json['message'] as String,
    );

Map<String, dynamic> _$FeedbackResultToJson(FeedbackResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content_id': instance.contentId,
      'feedback_id': instance.feedbackId,
      'purchase_id': instance.purchaseId,
      'price': instance.price,
      'message': instance.message,
    };
