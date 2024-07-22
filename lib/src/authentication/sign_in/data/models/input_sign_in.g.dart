// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_sign_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoSignIn _$InfoSignInFromJson(Map<String, dynamic> json) => InfoSignIn(
      json['provider_id'] as int,
      json['token'] as String,
      json['name'] as String?,
      json['nickname'] as String?,
      json['email'] as String?,
      json['profile'] as String?,
      json['age_range'] as String?,
      json['birthday'] as String?,
      json['calendar'] as String?,
      json['gender'] as String?,
      json['is_agree'] as bool?,
      json['is_agree_all'] as bool?,
      json['fcm_token'] as String?,
    );

Map<String, dynamic> _$InfoSignInToJson(InfoSignIn instance) =>
    <String, dynamic>{
      'provider_id': instance.providerId,
      'token': instance.token,
      'name': instance.name,
      'nickname': instance.nickName,
      'email': instance.email,
      'profile': instance.profile,
      'age_range': instance.ageRange,
      'birthday': instance.birthday,
      'calendar': instance.calendar,
      'gender': instance.gender,
      'is_agree': instance.isAgree,
      'is_agree_all': instance.isAgreeAll,
      'fcm_token': instance.fcmToken,
    };
