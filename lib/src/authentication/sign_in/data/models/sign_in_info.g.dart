// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInReturn _$SignInReturnFromJson(Map<String, dynamic> json) => SignInReturn(
      token: json['token'] as String,
      isRegister: json['is_register'],
    );

Map<String, dynamic> _$SignInReturnToJson(SignInReturn instance) =>
    <String, dynamic>{
      'token': instance.token,
      'is_register': instance.isRegister,
    };
