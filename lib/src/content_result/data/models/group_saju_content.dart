import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:borra_app/src/content_result/data/models/children_data_model.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class GroupSajuContent extends Equatable {
  String groupTitle;
  final List<List<ChildrenData>> resultChildrenData;
  GroupSajuContent({
    required this.groupTitle,
    required this.resultChildrenData,
  });

  GroupSajuContent copyWith({
    String? groupTitle,
    List<List<ChildrenData>>? resultChildrenData,
  }) {
    return GroupSajuContent(
      groupTitle: groupTitle ?? this.groupTitle,
      resultChildrenData: resultChildrenData ?? this.resultChildrenData,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'groupTitle': groupTitle,
      'resultChildrenData': resultChildrenData.map((x) => x.asMap()).toList(),
    };
  }

  factory GroupSajuContent.fromMap(Map<String, dynamic> map) {
    return GroupSajuContent(
      groupTitle: map['groupTitle'] as String,
      resultChildrenData: (map['resultChildrenData'] as List)
          .map<List<ChildrenData>>(
            (x) => (x as List)
                .map<ChildrenData>(
                    (childData) => ChildrenData.fromMap(childData))
                .toList(),
          )
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory GroupSajuContent.fromJson(String source) =>
      GroupSajuContent.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [groupTitle, resultChildrenData];
}
