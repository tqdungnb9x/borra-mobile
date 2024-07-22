// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saju_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SajuDetail _$SajuDetailFromJson(Map<String, dynamic> json) => SajuDetail(
      cheongan: (json['cheongan'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
      daeun: Daeun.fromJson(json['daeun'] as Map<String, dynamic>),
      jiji: (json['jiji'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
    );

Map<String, dynamic> _$SajuDetailToJson(SajuDetail instance) =>
    <String, dynamic>{
      'cheongan': instance.cheongan,
      'daeun': instance.daeun,
      'jiji': instance.jiji,
    };
