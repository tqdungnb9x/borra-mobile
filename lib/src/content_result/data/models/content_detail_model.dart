// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:borra_app/src/content_result/data/models/children_content_model.dart';
import 'package:borra_app/src/content_result/data/models/children_data_model.dart';
import 'package:borra_app/src/content_result/data/models/content_children_model.dart';
import 'package:borra_app/src/content_result/data/models/content_purchase_info_model.dart';
import 'package:borra_app/src/content_result/data/models/parents_content_model.dart';
import 'package:borra_app/src/content_result/data/models/saju_detail_model.dart';

part 'content_detail_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ContentResult extends Equatable {
  final List<ContentChildren> children;
  @JsonKey(name: 'children_data')
  final List<ChildrenData> childrenData;
  final ChildrenContent content;
  final List<ParentsContent> parents;
  final ContentPurchase purchase;
  final List<SajuDetail>? saju;
  const ContentResult({
    required this.children,
    required this.childrenData,
    required this.content,
    required this.purchase,
    required this.parents,
    this.saju,
  });

  ContentResult copyWith({
    List<ContentChildren>? children,
    List<ChildrenData>? childrenData,
    ChildrenContent? content,
    ContentPurchase? purchase,
    List<SajuDetail>? saju,
    List<ParentsContent>? parents,
  }) {
    return ContentResult(
      children: children ?? this.children,
      childrenData: childrenData ?? this.childrenData,
      content: content ?? this.content,
      purchase: purchase ?? this.purchase,
      saju: saju ?? this.saju,
      parents: parents ?? this.parents,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'children': children.map((x) => x.toMap()).toList(),
      'childrenData': childrenData.map((x) => x.toMap()).toList(),
      'content': content.toMap(),
      'purchase': purchase.toMap(),
      'parents': parents.map((x) => x.toMap()).toList(),
      // 'saju': saju.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());

  factory ContentResult.fromJson(Map<String, dynamic> source) =>
      _$ContentResultFromJson(source);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      children,
      childrenData,
      content,
      parents,
      purchase,
      saju,
    ];
  }

  factory ContentResult.fromMap(Map<String, dynamic> map) {
    return ContentResult(
      children: List<ContentChildren>.from(
        (map['children'] as List<dynamic>).map(
          (x) => ContentChildren.fromMap(x as Map<String, dynamic>),
        ),
      ),
      childrenData: List<ChildrenData>.from(
        (map['childrenData'] as List<dynamic>).map(
          (x) => ChildrenData.fromMap(x as Map<String, dynamic>),
        ),
      ),
      content: ChildrenContent.fromMap(map['content'] as Map<String, dynamic>),
      purchase:
          ContentPurchase.fromMap(map['purchase'] as Map<String, dynamic>),
      saju: map['saju'] != null
          ? List<SajuDetail>.from(
              (map['saju'] as List<dynamic>).map(
                (x) => SajuDetail.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      parents: List<ParentsContent>.from(
        (map['parents'] as List<dynamic>).map(
          (x) => ParentsContent.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
