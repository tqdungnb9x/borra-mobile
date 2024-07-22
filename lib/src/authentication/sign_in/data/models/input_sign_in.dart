// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

part 'input_sign_in.g.dart';

@JsonSerializable()
class InfoSignIn {
  @JsonKey(name: 'provider_id')
  final int providerId;
  final String token;
  final String? name;
  @JsonKey(name: 'nickname')
  final String? nickName;
  final String? email;
  final String? profile;
  @JsonKey(name: 'age_range')
  final String? ageRange;
  final String? birthday;
  final String? calendar;
  final String? gender;
  @JsonKey(name: 'is_agree')
  final bool? isAgree;
  @JsonKey(name: 'is_agree_all')
  final bool? isAgreeAll;
  @JsonKey(name: 'fcm_token')
  final String? fcmToken;

  const InfoSignIn(
    this.providerId,
    this.token,
    this.name,
    this.nickName,
    this.email,
    this.profile,
    this.ageRange,
    this.birthday,
    this.calendar,
    this.gender,
    this.isAgree,
    this.isAgreeAll,
    this.fcmToken,
  );

  InfoSignIn copyWith({
    int? providerId,
    String? token,
    String? name,
    String? nickName,
    String? email,
    String? profile,
    String? ageRange,
    String? birthday,
    String? calendar,
    String? gender,
    bool? isAgree,
    bool? isAgreeAll,
    String? fcmToken,
  }) {
    return InfoSignIn(
      providerId ?? this.providerId,
      token ?? this.token,
      name ?? this.name,
      nickName ?? this.nickName,
      email ?? this.email,
      profile ?? this.profile,
      ageRange ?? this.ageRange,
      birthday ?? this.birthday,
      calendar ?? this.calendar,
      gender ?? this.gender,
      isAgree ?? this.isAgree,
      isAgreeAll ?? this.isAgreeAll,
      fcmToken ?? this.fcmToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'providerId': providerId,
      'token': token,
      'name': name,
      'nickName': nickName,
      'email': email,
      'profile': profile,
      'ageRange': ageRange,
      'birthday': birthday,
      'calendar': calendar,
      'gender': gender,
      'isAgree': isAgree,
      'isAgreeAll': isAgreeAll,
      'fcmToken': fcmToken,
    };
  }

  Map<String, dynamic> toServerMap() {
    return <String, dynamic>{
      'provider_id': providerId,
      'token': token,
      'name': name,
      'nickname': nickName,
      'email': email,
      'profile': profile,
      'age_range': ageRange,
      'birthday': birthday,
      'calendar': calendar,
      'gender': gender,
      'is_agree': true,
      'is_agree_all': isAgreeAll,
      'fcm_token': fcmToken,
    };
  }

  factory InfoSignIn.fromMap(Map<String, dynamic> map) {
    return InfoSignIn(
      map['providerId'] as int,
      map['token'] as String,
      map['name'] != null ? map['name'] as String : null,
      map['nickName'] != null ? map['nickName'] as String : null,
      map['email'] != null ? map['email'] as String : null,
      map['profile'] != null ? map['profile'] as String : null,
      map['ageRange'] != null ? map['ageRange'] as String : null,
      map['birthday'] != null ? map['birthday'] as String : null,
      map['calendar'] != null ? map['calendar'] as String : null,
      map['gender'] != null ? map['gender'] as String : null,
      map['isAgree'] != null ? map['isAgree'] as bool : null,
      map['isAgreeAll'] != null ? map['isAgreeAll'] as bool : null,
      map['fcmToken'] != null ? map['isAgreeAll'] as String : null,
    );
  }

  factory InfoSignIn.fromKakao(User kakaoInfo, String token,
      {String? fcmToken}) {
    return InfoSignIn(
      kakaoInfo.id,
      token,
      kakaoInfo.properties!['nickname'],
      null,
      kakaoInfo.kakaoAccount != null ? kakaoInfo.kakaoAccount!.email : '',
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      fcmToken,
    );
  }

  String toJson() => json.encode(toMap());

  factory InfoSignIn.fromJson(String source) =>
      InfoSignIn.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'InfoSignIn(providerId: $providerId, token: $token, name: $name, nickName: $nickName, email: $email, profile: $profile, ageRange: $ageRange, birthday: $birthday, calendar: $calendar, gender: $gender, isAgree: $isAgree, isAgreeAll: $isAgreeAll)';
  }

  @override
  bool operator ==(covariant InfoSignIn other) {
    if (identical(this, other)) return true;

    return other.providerId == providerId &&
        other.token == token &&
        other.name == name &&
        other.nickName == nickName &&
        other.email == email &&
        other.profile == profile &&
        other.ageRange == ageRange &&
        other.birthday == birthday &&
        other.calendar == calendar &&
        other.gender == gender &&
        other.isAgree == isAgree &&
        other.isAgreeAll == isAgreeAll &&
        other.fcmToken == fcmToken;
  }

  @override
  int get hashCode {
    return providerId.hashCode ^
        token.hashCode ^
        name.hashCode ^
        nickName.hashCode ^
        email.hashCode ^
        profile.hashCode ^
        ageRange.hashCode ^
        birthday.hashCode ^
        calendar.hashCode ^
        gender.hashCode ^
        isAgree.hashCode ^
        fcmToken.hashCode ^
        isAgreeAll.hashCode;
  }
}
