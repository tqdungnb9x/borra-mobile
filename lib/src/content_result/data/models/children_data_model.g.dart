// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'children_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChildrenData _$ChildrenDataFromJson(Map<String, dynamic> json) => ChildrenData(
      id: json['id'] as int,
      childId: json['child_id'] as int,
      fortuneId: json['fortune_id'] as int,
      contents: json['contents'] as String?,
      name: json['name'] as String?,
      summary: json['summary'] as String?,
      template:
          TemplateContent.fromJson(json['template'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChildrenDataToJson(ChildrenData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'child_id': instance.childId,
      'fortune_id': instance.fortuneId,
      'contents': instance.contents,
      'name': instance.name,
      'summary': instance.summary,
      'template': instance.template,
    };
