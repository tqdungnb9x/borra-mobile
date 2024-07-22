// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:borra_app/src/content_detail/data/models/content_type.dart';
import 'package:borra_app/src/home/data/models/tag.dart';

part 'children_content_model.g.dart';

@JsonSerializable()
class ChildrenContent extends Equatable {
  final int id;
  @JsonKey(name: "category_id")
  final int category;
  final ContentType type;
  final List<AppTag> tags;
  @JsonKey(name: "thumbnail_id")
  final int thumbnail;
  final dynamic banner;
  final String? site;
  final String? name;
  final String? summary;
  final String? contents;
  @JsonKey(name: "like_count")
  final int likeCount;
  @JsonKey(name: "share_count")
  final int shareCount;
  final int price;
  @JsonKey(name: "is_first_free")
  final int isFirstFree;
  @JsonKey(name: "wait_free_time")
  final int waitFreeTime;
  const ChildrenContent({
    required this.id,
    required this.category,
    required this.type,
    required this.tags,
    required this.thumbnail,
    required this.banner,
    required this.site,
    required this.name,
    required this.summary,
    required this.contents,
    required this.likeCount,
    required this.shareCount,
    required this.price,
    required this.isFirstFree,
    required this.waitFreeTime,
  });

  ChildrenContent copyWith({
    int? id,
    int? category,
    ContentType? type,
    List<AppTag>? tags,
    int? thumbnail,
    int? banner,
    String? site,
    String? name,
    String? summary,
    String? contents,
    int? likeCount,
    int? shareCount,
    int? price,
    int? isFirstFree,
    int? waitFreeTime,
  }) {
    return ChildrenContent(
      id: id ?? this.id,
      category: category ?? this.category,
      type: type ?? this.type,
      tags: tags ?? this.tags,
      thumbnail: thumbnail ?? this.thumbnail,
      banner: banner ?? this.banner,
      site: site ?? this.site,
      name: name ?? this.name,
      summary: summary ?? this.summary,
      contents: contents ?? this.contents,
      likeCount: likeCount ?? this.likeCount,
      shareCount: shareCount ?? this.shareCount,
      price: price ?? this.price,
      isFirstFree: isFirstFree ?? this.isFirstFree,
      waitFreeTime: waitFreeTime ?? this.waitFreeTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'category': category,
      'type': type.toMap(),
      'tags': tags.map((x) => x.toMap()).toList(),
      'thumbnail': thumbnail,
      'banner': banner,
      'site': site,
      'name': name,
      'summary': summary,
      'contents': contents,
      'likeCount': likeCount,
      'shareCount': shareCount,
      'price': price,
      'isFirstFree': isFirstFree,
      'waitFreeTime': waitFreeTime,
    };
  }

  String toJson() => json.encode(toMap());

  factory ChildrenContent.fromJson(Map<String, dynamic> source) =>
      _$ChildrenContentFromJson(source);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      category,
      type,
      tags,
      thumbnail,
      banner ??
          {
            "id": null,
            "user_id": null,
            "name": null,
            "path": null,
            "extension": null,
            "size": null,
            "created_at": null,
            "updated_at": null
          },
      site ?? "",
      name ?? "",
      summary ?? "",
      contents ?? "",
      likeCount,
      shareCount,
      price,
      isFirstFree,
      waitFreeTime,
    ];
  }

  factory ChildrenContent.fromMap(Map<String, dynamic> map) {
    return ChildrenContent(
      id: map['id'] as int,
      category: map['category'] as int,
      type: ContentType.fromMap(map['type'] as Map<String, dynamic>),
      tags: [],
      thumbnail: map['thumbnail'] as int,
      banner: map['banner'] as dynamic,
      site: map['site'] != null ? map['site'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      summary: map['summary'] != null ? map['summary'] as String : null,
      contents: map['contents'] != null ? map['contents'] as String : null,
      likeCount: map['likeCount'] as int,
      shareCount: map['shareCount'] as int,
      price: map['price'] as int,
      isFirstFree: map['isFirstFree'] as int,
      waitFreeTime: map['waitFreeTime'] as int,
    );
  }
}
