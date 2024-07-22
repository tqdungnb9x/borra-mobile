// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'saju_detail_model.g.dart';

@JsonSerializable()
class SajuDetail extends Equatable {
  final List<List<String>> cheongan;
  final Daeun daeun;
  final List<List<String>> jiji;
  const SajuDetail({
    required this.cheongan,
    required this.daeun,
    required this.jiji,
  });

  SajuDetail copyWith({
    List<List<String>>? cheongan,
    Daeun? daeun,
    List<List<String>>? jiji,
  }) {
    return SajuDetail(
      cheongan: cheongan ?? this.cheongan,
      daeun: daeun ?? this.daeun,
      jiji: jiji ?? this.jiji,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cheongan': cheongan,
      'daeun': daeun.toMap(),
      'jiji': jiji,
    };
  }

  factory SajuDetail.fromMap(Map<String, dynamic> map) {
    return SajuDetail(
      cheongan: List<List<String>>.from(
        (map['cheongan'] as List<List<String>>).map<List<String>>(
          (x) => x,
        ),
      ),
      daeun: Daeun.fromMap(map['daeun'] as Map<String, dynamic>),
      jiji: List<List<String>>.from(
        (map['jiji'] as List<List<String>>).map<List<String>>(
          (x) => x,
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SajuDetail.fromJson(Map<String, dynamic> json) {
    return SajuDetail(
      cheongan: json['cheongan'].map<List<String>>((dynamic item) {
        return List<String>.from(item.map<String>((dynamic element) {
          return element.toString();
        }));
      }).toList(),
      daeun: Daeun.fromJson(json['daeun'] as Map<String, dynamic>),
      jiji: json['jiji'].map<List<String>>((dynamic item) {
        return List<String>.from(item.map<String>((dynamic element) {
          return element.toString();
        }));
      }).toList(),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [cheongan, daeun, jiji];
}

class Daeun extends Equatable {
  final String name;
  final List<String> age;
  final List<String> gan;
  final List<String> ji;
  const Daeun({
    required this.name,
    required this.age,
    required this.gan,
    required this.ji,
  });

  Daeun copyWith({
    String? name,
    List<String>? age,
    List<String>? gan,
    List<String>? ji,
  }) {
    return Daeun(
      name: name ?? this.name,
      age: age ?? this.age,
      gan: gan ?? this.gan,
      ji: ji ?? this.ji,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'gan': gan,
      'ji': ji,
    };
  }

  factory Daeun.fromMap(Map<String, dynamic> map) {
    return Daeun(
      name: map['name'] as String,
      age: List<String>.from(map['age'] as List<String>),
      gan: List<String>.from(map['gan'] as List<String>),
      ji: List<String>.from(map['ji'] as List<String>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Daeun.fromJson(Map<String, dynamic> json) => Daeun(
        name: json['name'] as String,
        age: List<String>.from(json['age'].map<String>((dynamic element) {
          return element.toString();
        })),
        gan: List<String>.from(json['gan'].map<String>((dynamic element) {
          return element.toString();
        })),
        ji: List<String>.from(json['ji'].map<String>((dynamic element) {
          return element.toString();
        })),
      );

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [name, age, gan, ji];
}
