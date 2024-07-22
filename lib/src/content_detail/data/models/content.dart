// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:borra_app/src/content_detail/data/models/content_type.dart';
import 'package:borra_app/src/content_detail/data/models/tarot.dart';
import 'package:borra_app/src/home/data/models/tag.dart';

part 'content.g.dart';

@JsonSerializable()
class AppContent extends Equatable {
  final int id;
  final String category;
  final ContentType type;
  final List<AppTag> tags;
  final String? thumbnail;
  final String? banner;
  final String site;
  final String name;
  final String summary;
  final String contents;
  @JsonKey(name: "like_count")
  final int likeCount;
  @JsonKey(name: "share_count")
  final int shareCount;
  final int price;
  @JsonKey(name: "discount_price")
  final int discountPrice;
  @JsonKey(name: "is_discount")
  final bool isDiscount;
  @JsonKey(name: "is_first_free")
  final int isFirstFree;
  @JsonKey(name: "wait_free_time")
  final int waitFreeTime;
  @JsonKey(name: "is_first_free_used")
  final bool isFirstFreeUsed;
  @JsonKey(name: "user_wait_free_time")
  final String? userWaitFreeTime;
  @JsonKey(name: "purchases_flat")
  final List<String> purchasesFlat;
  @JsonKey(name: "is_skip")
  final int isSkip;
  @JsonKey(name: "is_partner")
  final bool isPartner;
  @JsonKey(name: "is_survey")
  final bool isSurvey;
  final List<ContentTarot> tarot;
  @JsonKey(name: "tarot_count")
  final int tarotCount;
  const AppContent({
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
    required this.discountPrice,
    required this.isDiscount,
    required this.isFirstFree,
    required this.waitFreeTime,
    required this.isFirstFreeUsed,
    this.userWaitFreeTime,
    required this.purchasesFlat,
    required this.isSkip,
    required this.isPartner,
    required this.isSurvey,
    required this.tarot,
    required this.tarotCount,
  });

  AppContent copyWith({
    int? id,
    String? category,
    ContentType? type,
    List<AppTag>? tags,
    String? thumbnail,
    String? banner,
    String? site,
    String? name,
    String? summary,
    String? contents,
    int? likeCount,
    int? shareCount,
    int? price,
    int? discountPrice,
    bool? isDiscount,
    int? isFirstFree,
    int? waitFreeTime,
    bool? isFirstFreeUsed,
    String? userWaitFreeTime,
    List<String>? purchasesFlat,
    int? isSkip,
    bool? isPartner,
    bool? isSurvey,
    List<ContentTarot>? tarot,
    int? tarotCount,
  }) {
    return AppContent(
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
      discountPrice: discountPrice ?? this.discountPrice,
      isDiscount: isDiscount ?? this.isDiscount,
      isFirstFree: isFirstFree ?? this.isFirstFree,
      waitFreeTime: waitFreeTime ?? this.waitFreeTime,
      isFirstFreeUsed: isFirstFreeUsed ?? this.isFirstFreeUsed,
      userWaitFreeTime: userWaitFreeTime ?? this.userWaitFreeTime,
      purchasesFlat: purchasesFlat ?? this.purchasesFlat,
      isSkip: isSkip ?? this.isSkip,
      isPartner: isPartner ?? this.isPartner,
      isSurvey: isSurvey ?? this.isSurvey,
      tarot: tarot ?? this.tarot,
      tarotCount: tarotCount ?? this.tarotCount,
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
      'discountPrice': discountPrice,
      'isDiscount': isDiscount,
      'isFirstFree': isFirstFree,
      'waitFreeTime': waitFreeTime,
      'isFirstFreeUsed': isFirstFreeUsed,
      'userWaitFreeTime': userWaitFreeTime,
      'purchasesFlat': purchasesFlat,
      'isSkip': isSkip,
      'isPartner': isPartner,
      'isSurvey': isSurvey,
      'tarot': tarot.map((x) => x.toMap()).toList(),
      'tarotCount': tarotCount,
    };
  }

  String toJson() => json.encode(toMap());

  factory AppContent.fromJson(Map<String, dynamic> source) =>
      _$AppContentFromJson(source);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      category,
      type,
      tags,
      thumbnail,
      banner,
      site,
      name,
      summary,
      contents,
      likeCount,
      shareCount,
      price,
      discountPrice,
      isDiscount,
      isFirstFree,
      waitFreeTime,
      isFirstFreeUsed,
      userWaitFreeTime,
      purchasesFlat,
      isSkip,
      isPartner,
      isSurvey,
      tarot,
      tarotCount,
    ];
  }
}
