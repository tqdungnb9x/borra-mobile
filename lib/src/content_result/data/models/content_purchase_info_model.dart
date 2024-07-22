// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'content_purchase_info_model.g.dart';

@JsonSerializable()
class ContentPurchase extends Equatable {
  final int id;
  final String? name;
  final dynamic gender;
  final String? marital;
  @JsonKey(name: 'birthed_at')
  final String? birthedAt;
  @JsonKey(name: 'is_birthed_time')
  final dynamic isBirtheTime;
  final String? calendar;
  final String? value;
  @JsonKey(name: 'survey_value')
  final dynamic surveyValue;
  final int price;
  final dynamic gwae;
  final Partner? partner;
  const ContentPurchase({
    required this.id,
    required this.name,
    required this.gender,
    required this.marital,
    required this.birthedAt,
    required this.isBirtheTime,
    required this.calendar,
    required this.value,
    required this.surveyValue,
    required this.price,
    required this.gwae,
    required this.partner,
  });

  ContentPurchase copyWith({
    int? id,
    String? name,
    dynamic gender,
    String? marital,
    String? birthedAt,
    dynamic isBirtheTime,
    String? calendar,
    String? value,
    dynamic surveyValue,
    int? price,
    dynamic gwae,
    Partner? partner,
  }) {
    return ContentPurchase(
      id: id ?? this.id,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      marital: marital ?? this.marital,
      birthedAt: birthedAt ?? this.birthedAt,
      isBirtheTime: isBirtheTime ?? this.isBirtheTime,
      calendar: calendar ?? this.calendar,
      value: value ?? this.value,
      surveyValue: surveyValue ?? this.surveyValue,
      price: price ?? this.price,
      gwae: gwae ?? this.gwae,
      partner: partner ?? this.partner,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'gender': gender,
      'marital': marital,
      'birthedAt': birthedAt,
      'isBirtheTime': isBirtheTime,
      'calendar': calendar,
      'value': value,
      'surveyValue': surveyValue,
      'price': price,
      'gwae': gwae,
      'partner': partner?.toMap(),
    };
  }

  factory ContentPurchase.fromMap(Map<String, dynamic> map) {
    return ContentPurchase(
      id: map['id'] as int,
      name: map['value'] != null ? map['value'] as String : null,
      gender: map['gender'] as dynamic,
      marital: map['value'] != null ? map['value'] as String : null,
      birthedAt: map['value'] != null ? map['value'] as String : null,
      isBirtheTime: map['isBirtheTime'] as dynamic,
      calendar: map['value'] != null ? map['value'] as String : null,
      value: map['value'] != null ? map['value'] as String : null,
      surveyValue: map['surveyValue'] as dynamic,
      price: map['price'] as int,
      gwae: map['gwae'] as dynamic,
      partner: map['partner'] != null
          ? Partner.fromMap(map['partner'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContentPurchase.fromJson(Map<String, dynamic> source) =>
      _$ContentPurchaseFromJson(source);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      gender,
      marital,
      birthedAt,
      isBirtheTime,
      calendar,
      value,
      surveyValue,
      price,
      gwae,
      partner,
    ];
  }
}

@JsonSerializable()
class Partner extends Equatable {
  final int id;
  final String name;
  final dynamic gender;
  final String marital;
  @JsonKey(name: 'birthed_at')
  final String birthedAt;
  @JsonKey(name: 'is_birthed_time')
  final int isBirthedTime;
  final String calendar;
  const Partner({
    required this.id,
    required this.name,
    required this.gender,
    required this.marital,
    required this.birthedAt,
    required this.isBirthedTime,
    required this.calendar,
  });

  Partner copyWith({
    int? id,
    String? name,
    dynamic gender,
    String? marital,
    String? birthedAt,
    int? isBirthedTime,
    String? calendar,
  }) {
    return Partner(
      id: id ?? this.id,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      marital: marital ?? this.marital,
      birthedAt: birthedAt ?? this.birthedAt,
      isBirthedTime: isBirthedTime ?? this.isBirthedTime,
      calendar: calendar ?? this.calendar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'gender': gender,
      'marital': marital,
      'birthedAt': birthedAt,
      'isBirthedTime': isBirthedTime,
      'calendar': calendar,
    };
  }

  factory Partner.fromMap(Map<String, dynamic> map) {
    return Partner(
      id: map['id'] as int,
      name: map['name'] as String,
      gender: map['gender'] as dynamic,
      marital: map['marital'] as String,
      birthedAt: map['birthedAt'] as String,
      isBirthedTime: map['isBirthedTime'] as int,
      calendar: map['calendar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Partner.fromJson(Map<String, dynamic> source) =>
      _$PartnerFromJson(source);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      gender,
      marital,
      birthedAt,
      isBirthedTime,
      calendar,
    ];
  }
}
