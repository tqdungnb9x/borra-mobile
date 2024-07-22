// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ui';

import 'package:borra_app/app_base/extensions/extension.dart';
import 'package:borra_app/src/authentication/auth/data/models/user.dart';
import 'package:borra_app/src/content_detail/data/models/content.dart';

import '../../../../app_base/utils/app_utils.dart';

class ContentInputArgument {
  final AppContent content;
  final ContentBasicArgument? user;
  final ContentBasicArgument? partner;
  final bool? isShowAds;
  ContentInputArgument(this.content, {this.user, this.partner, this.isShowAds});
}

class ContentBasicArgument {
  final String name;
  final int gender;
  final String? value;
  final String? birthedAt;
  final String? calendar;
  final String? marital;
  final dynamic isBirthedTime;
  ContentBasicArgument({
    required this.name,
    required this.gender,
    this.value,
    this.birthedAt,
    this.calendar,
    this.marital,
    this.isBirthedTime,
  });

  ContentBasicArgument copyWith({
    String? name,
    int? gender,
    String? value,
    String? birthedAt,
    String? calendar,
    String? marital,
    dynamic isBirthedTime,
  }) {
    return ContentBasicArgument(
      name: name ?? this.name,
      gender: gender ?? this.gender,
      value: value ?? this.value,
      birthedAt: birthedAt ?? this.birthedAt,
      calendar: calendar ?? this.calendar,
      marital: marital ?? this.marital,
      isBirthedTime: isBirthedTime ?? this.isBirthedTime,
    );
  }

  factory ContentBasicArgument.empty() {
    return ContentBasicArgument(
      name: '',
      gender: -1,
      birthedAt: DateTime(1990, 1, 1, 0, 0).toString(),
      calendar: 'solar',
      isBirthedTime: 1,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "name": name,
      "gender": gender,
      "marital": marital,
      "birthed_at": UtilTimeZone.formatDatetimeToServer(birthedAt!),
      "is_birthed_time": (isBirthedTime as int).toBool,
      "calendar": calendar,
      "value": value,
    };
  }

  Map<String, dynamic> toSubmit() {
    return <String, dynamic>{
      "name": name,
      "gender": gender,
      "marital": marital,
      "birthed_at": UtilTimeZone.formatDatetimeToServer(birthedAt!),
      "is_birthed_time": (isBirthedTime as int).toBool,
      "calendar": calendar,
      "value": value,
    };
  }

  factory ContentBasicArgument.fromMap(Map<String, dynamic> map) {
    return ContentBasicArgument(
      name: map['name'] as String,
      gender: map['gender'] as int,
      value: map['value'] != null ? map['value'] as String : null,
      birthedAt: map['birthedAt'] != null ? map['birthedAt'] as String : null,
      calendar: map['calendar'] != null ? map['calendar'] as String : null,
      marital: map['marital'] != null ? map['marital'] as String : null,
      isBirthedTime: map['isBirthedTime'] as dynamic,
    );
  }

  factory ContentBasicArgument.fromUser(User mapUser) {
    return ContentBasicArgument(
      name: mapUser.name ?? '',
      gender: mapUser.gender ?? 0,
      value: '',
      birthedAt: mapUser.birthedAt,
      calendar: mapUser.calendar,
      marital: mapUser.marital,
      isBirthedTime: mapUser.isBirthedTime,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContentBasicArgument.fromJson(String source) =>
      ContentBasicArgument.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ContentBasicArgument(name: $name, gender: $gender, value: $value, birthedAt: $birthedAt, calendar: $calendar, marital: $marital, isBirthedTime: $isBirthedTime)';
  }

  @override
  bool operator ==(covariant ContentBasicArgument other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.gender == gender &&
        other.value == value &&
        other.birthedAt == birthedAt &&
        other.calendar == calendar &&
        other.marital == marital &&
        other.isBirthedTime == isBirthedTime;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        gender.hashCode ^
        value.hashCode ^
        birthedAt.hashCode ^
        calendar.hashCode ^
        marital.hashCode ^
        isBirthedTime.hashCode;
  }
}
