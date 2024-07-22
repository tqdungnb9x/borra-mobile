// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      name: json['name'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as int?,
      marital: json['marital'] as String?,
      birthedAt: json['birthed_at'] as String?,
      isBirthedTime: json['is_birthed_time'] as int,
      calendar: json['calendar'] as String,
      recommender: json['recommender'] as String?,
      coin: (json['coin'] as num).toDouble(),
      isEmail: json['is_mail'] as bool,
      isNotify: json['is_notify'] as bool,
      isKakao: json['is_kakao'] as bool,
      isAgree: json['is_agree'] as int,
      isAdmin: json['is_admin'] as bool,
      tags: (json['tags'] as List<dynamic>).map((e) => e as int).toList(),
      isAgreeAll: json['isAgreeAll'] as bool?,
      remainingWatchAd: json['remaining_watch_ad'] as int?,
      pageResultWatchAd: json['page_result_watch_ad'] as bool?,
      fcmToken: json['fcm_token'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'gender': instance.gender,
      'marital': instance.marital,
      'birthed_at': instance.birthedAt,
      'is_birthed_time': instance.isBirthedTime,
      'calendar': instance.calendar,
      'recommender': instance.recommender,
      'coin': instance.coin,
      'is_mail': instance.isEmail,
      'is_notify': instance.isNotify,
      'is_kakao': instance.isKakao,
      'is_agree': instance.isAgree,
      'is_admin': instance.isAdmin,
      'tags': instance.tags,
      'isAgreeAll': instance.isAgreeAll,
      'remaining_watch_ad': instance.remainingWatchAd,
      'page_result_watch_ad': instance.pageResultWatchAd,
      'fcm_token': instance.fcmToken,
    };
