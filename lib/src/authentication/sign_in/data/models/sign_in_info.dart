// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_in_info.g.dart';

@JsonSerializable()
class SignInReturn extends Equatable {
  final String token;
  @JsonKey(name: 'is_register')
  final dynamic isRegister;
  const SignInReturn({
    required this.token,
    required this.isRegister,
  });

  SignInReturn copyWith({
    String? token,
    dynamic isRegister,
  }) {
    return SignInReturn(
      token: token ?? this.token,
      isRegister: isRegister ?? this.isRegister,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'isRegister': isRegister,
    };
  }

  factory SignInReturn.fromMap(Map<String, dynamic> map) {
    return SignInReturn(
      token: map['token'] as String,
      isRegister: map['isRegister'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignInReturn.fromJson(Map<String, dynamic> source) =>
      _$SignInReturnFromJson(source);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [token, isRegister];
}
