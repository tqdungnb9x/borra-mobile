// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:borra_app/app_base/extensions/extension.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final int id;
  final String? name;
  final String? email;
  final int? gender;
  final String? marital;
  @JsonKey(name: "birthed_at")
  final String? birthedAt;
  @JsonKey(name: "is_birthed_time")
  final int isBirthedTime;
  final String calendar;
  final String? recommender;
  final double coin;
  @JsonKey(name: "is_mail")
  final bool isEmail;
  @JsonKey(name: "is_notify")
  final bool isNotify;
  @JsonKey(name: "is_kakao")
  final bool isKakao;
  @JsonKey(name: "is_agree")
  final int isAgree;
  @JsonKey(name: "is_admin")
  final bool isAdmin;
  final List<int> tags;
  final bool? isAgreeAll;
  @JsonKey(name: "remaining_watch_ad")
  final int? remainingWatchAd;
  @JsonKey(name: "page_result_watch_ad")
  final bool? pageResultWatchAd;
  @JsonKey(name: "fcm_token")
  final String? fcmToken;
  User({
    required this.id,
    this.name,
    this.email,
    this.gender,
    this.marital,
    this.birthedAt,
    required this.isBirthedTime,
    required this.calendar,
    this.recommender,
    required this.coin,
    required this.isEmail,
    required this.isNotify,
    required this.isKakao,
    required this.isAgree,
    required this.isAdmin,
    required this.tags,
    this.isAgreeAll,
    this.remainingWatchAd,
    this.pageResultWatchAd,
    this.fcmToken,
  });

  factory User.empty() {
    return User(
      id: -1,
      isBirthedTime: 0,
      calendar: 'solar',
      coin: 0,
      isEmail: false,
      isNotify: false,
      isKakao: false,
      isAgree: 0,
      isAdmin: false,
      tags: [],
      remainingWatchAd: 0,
      pageResultWatchAd: false,
      fcmToken: '',
    );
  }

  User copyWith(
      {int? id,
      String? name,
      String? email,
      int? gender,
      String? marital,
      String? birthedAt,
      int? isBirthedTime,
      String? calendar,
      String? recommender,
      double? coin,
      bool? isEmail,
      bool? isNotify,
      bool? isKakao,
      int? isAgree,
      bool? isAdmin,
      List<int>? tags,
      bool? isAgreeAll,
      int? remainingWatchAd,
      bool? pageResultWatchAd,
      String? fcmToken}) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      marital: marital ?? this.marital,
      birthedAt: birthedAt ?? this.birthedAt,
      isBirthedTime: isBirthedTime ?? this.isBirthedTime,
      calendar: calendar ?? this.calendar,
      recommender: recommender ?? this.recommender,
      coin: coin ?? this.coin,
      isEmail: isEmail ?? this.isEmail,
      isNotify: isNotify ?? this.isNotify,
      isKakao: isKakao ?? this.isKakao,
      isAgree: isAgree ?? this.isAgree,
      isAdmin: isAdmin ?? this.isAdmin,
      tags: tags ?? this.tags,
      isAgreeAll: isAgreeAll ?? this.isAgreeAll,
      remainingWatchAd: remainingWatchAd ?? this.remainingWatchAd,
      pageResultWatchAd: pageResultWatchAd ?? this.pageResultWatchAd,
      fcmToken: fcmToken ?? this.fcmToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'gender': gender,
      'marital': marital,
      'birthedAt': birthedAt,
      'isBirthedTime': isBirthedTime,
      'calendar': calendar,
      'recommender': recommender,
      'coin': coin,
      'isEmail': isEmail,
      'isNotify': isNotify,
      'isKakao': isKakao,
      'isAgree': isAgree,
      'isAdmin': isAdmin,
      'tags': tags,
      'remainingWatchAd': remainingWatchAd,
      'pageResultWatchAd': pageResultWatchAd,
      'fcmToken': fcmToken,
    };
  }

  Map<String, dynamic> toMapUpdate() {
    return <String, dynamic>{
      'name': name,
      'gender': gender,
      'marital': marital,
      'birthed_at': birthedAt,
      'is_birthed_time': isBirthedTime.toBool,
      'calendar': calendar,
      'is_email': isEmail,
      'is_notify': isNotify,
      'is_kakao': isKakao,
      'is_agree': true,
      'is_agree_all': isAgreeAll,
      'tags': tags,
      'referrer_path': null,
      'register_path': null,
      'remaining_watch_ad': remainingWatchAd,
      'page_result_watch_ad': pageResultWatchAd,
      'fcm_token': fcmToken,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      gender: map['gender'] != null ? map['gender'] as int : null,
      marital: map['marital'] != null ? map['marital'] as String : null,
      birthedAt: map['birthedAt'] != null ? map['birthedAt'] as String : null,
      isBirthedTime: map['isBirthedTime'] as int,
      calendar: map['calendar'] as String,
      recommender:
          map['recommender'] != null ? map['recommender'] as String : null,
      coin: map['coin'] as double,
      isEmail: map['isEmail'] as bool,
      isNotify: map['isNotify'] as bool,
      isKakao: map['isKakao'] as bool,
      isAgree: map['isAgree'] as int,
      isAdmin: map['isAdmin'] as bool,
      remainingWatchAd: map['remainingWatchAd'] != null
          ? map['remainingWatchAd'] as int
          : null,
      pageResultWatchAd: map['pageResultWatchAd'] != null
          ? map['pageResultWatchAd'] as bool
          : null,
      fcmToken: map['fcmToken'] != null ? map['fcmToken'] as String : null,
      tags: List<int>.from(
        map['tags'] as List<int>,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  String toString() =>
      'User(id: $id, name: $name), gender: $gender, marital: $marital, birthedAt: $birthedAt, calendar: $calendar, tags:  $tags, remainingWatchAd: $remainingWatchAd, pageResultWatchAd: $pageResultWatchAd, fcmToken: $fcmToken';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      gender,
      marital,
      birthedAt,
      isBirthedTime,
      calendar,
      recommender,
      coin,
      isEmail,
      isNotify,
      isKakao,
      isAgree,
      isAdmin,
      tags,
      remainingWatchAd,
      pageResultWatchAd,
      fcmToken,
    ];
  }
}
