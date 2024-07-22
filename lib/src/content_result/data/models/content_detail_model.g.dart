// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentResult _$ContentResultFromJson(Map<String, dynamic> json) =>
    ContentResult(
      children: (json['children'] as List<dynamic>)
          .map((e) => ContentChildren.fromJson(e as Map<String, dynamic>))
          .toList(),
      childrenData: (json['children_data'] as List<dynamic>)
          .map((e) => ChildrenData.fromJson(e as Map<String, dynamic>))
          .toList(),
      content:
          ChildrenContent.fromJson(json['content'] as Map<String, dynamic>),
      purchase:
          ContentPurchase.fromJson(json['purchase'] as Map<String, dynamic>),
      parents:
          (json['parents'] as List<dynamic>)
          .map((e) => ParentsContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      saju: (json['saju'] as List<dynamic>?)
          ?.map((e) => SajuDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContentResultToJson(ContentResult instance) =>
    <String, dynamic>{
      'children': instance.children,
      'children_data': instance.childrenData,
      'parents': instance.parents,
      'content': instance.content,
      'purchase': instance.purchase,
      'saju': instance.saju,
    };
