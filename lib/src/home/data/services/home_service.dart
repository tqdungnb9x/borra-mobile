import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/src/home/data/models/banner.dart';
import 'package:borra_app/src/home/data/models/hot_content.dart';
import 'package:borra_app/src/home/data/models/tag.dart';
import 'package:borra_app/src/home/data/models/app_main_content.dart';

import '../../../like/data/models/like_content_model.dart';

class HomeService extends Api {
  Future<BaseResponse<List<AppBanner>>> getListBanner() async {
    final res = await get(
      'contents/main/banner',
    );

    if (res.success) {
      var list = (res.data as List<dynamic>)
          .map((e) => AppBanner.fromJson(e))
          .toList();
      return BaseResponse.success(list);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<List<AppTag>>> getTagList() async {
    final res = await get(
      'common/tags',
    );

    if (res.success) {
      var list =
          (res.data as List<dynamic>).map((e) => AppTag.fromMap(e)).toList();

      // return BaseResponse.success(sortList(list));
      return BaseResponse.success(list);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<List<AppMainContent>>> getContentListByTag(
      int tagId) async {
    final res = await get(
      'contents/main/tags/$tagId',
    );

    if (res.success) {
      var list = (res.data as List<dynamic>)
          .map((e) => AppMainContent.fromJson(e))
          .toList();

      return BaseResponse.success(list);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<List<HotContent>>> getHotContent() async {
    final res = await get(
      'contents/main/hot',
    );

    if (res.success) {
      var list = (res.data as List<dynamic>)
          .map((e) => HotContent.fromJson(e))
          .toList();
      return BaseResponse.success(list);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<List<AppMainContent>>> getTarotToday() async {
    final res = await get(
      'contents/main/today',
    );

    if (res.success) {
      var list = (res.data as List<dynamic>)
          .map((e) => AppMainContent.fromJson(e))
          .toList();
      return BaseResponse.success(list);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<List<AppMainContent>>> getTarotFree() async {
    final res = await get(
      'contents/main/wait-free',
    );

    if (res.success) {
      var list = (res.data as List<dynamic>)
          .map((e) => AppMainContent.fromJson(e))
          .toList();
      return BaseResponse.success(list);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<List<AppMainContent>>> getTarotMainFree() async {
    final res = await get(
      'contents/main/free',
    );

    if (res.success) {
      var list = (res.data as List<dynamic>)
          .map((e) => AppMainContent.fromJson(e))
          .toList();
      return BaseResponse.success(list);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<List<AppMainContent>>> getTarotFirstFree() async {
    final res = await get(
      'contents/main/first-free',
    );

    if (res.success) {
      var list = (res.data as List<dynamic>)
          .map((e) => AppMainContent.fromJson(e))
          .toList();
      return BaseResponse.success(list);
    }
    return BaseResponse.error(res.message);
  }

  /// Home detail page service

  /// Get Hot content list
  Future<BaseResponse<List<LikeContent>>> getListHotContent(
      {required int page}) async {
    final res = await get(
      'contents/main/hot/index',
      query: {
        'page': page,
      },
    );

    if (res.success) {
      var list = (res.data['list'] as List<dynamic>)
          .map((e) => LikeContent.fromJson(e))
          .toList();
      return BaseResponse.success(list);
    }
    return BaseResponse.error(res.message);
  }

  /// Get Category content list
  Future<BaseResponse<List<LikeContent>>> getCategoryContent(
      {required int page, int categoryId = 8}) async {
    final res = await get(
      'contents/categories/$categoryId',
      query: {
        'page': page,
      },
    );

    if (res.success) {
      var list = (res.data['list'] as List<dynamic>)
          .map((e) => LikeContent.fromJson(e))
          .toList();
      return BaseResponse.success(list);
    }
    return BaseResponse.error(res.message);
  }

  /// Get Main free content list
  Future<BaseResponse<List<LikeContent>>> getMainFreeContent(
      {required int page}) async {
    final res = await get(
      'contents/main/free/index',
      query: {
        'page': page,
      },
    );

    if (res.success) {
      var list = (res.data['list'] as List<dynamic>)
          .map((e) => LikeContent.fromJson(e))
          .toList();
      return BaseResponse.success(list);
    }
    return BaseResponse.error(res.message);
  }

  /// Get Main free content list
  Future<BaseResponse<List<LikeContent>>> getTagAllContent(
      {required int page,
      required int tagId,
      required int limit,
      int? categoryId,
      required String priceType}) async {
    final res = await get(
      'contents',
      query: {
        'page': page,
        'limit': limit,
        'category_id': categoryId,
        // 'category_id': categoryId,
        'tag_id': tagId,
        'price_type': priceType,
        'site': 'borra',
        'type_id': 1,
        'sort_by': 'view_count',
        'order_by': 'desc',
      },
    );

    if (res.success) {
      var list = (res.data['data'] as List<dynamic>)
          .map((e) => LikeContent.fromJson(e))
          .toList();
      return BaseResponse.success(list);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<List<AppMainContent>>> getRecommend() async {
    final res = await get(
      'contents/main/hot/recommend',
    );

    if (res.success) {
      var list = (res.data as List<dynamic>)
          .map((e) => AppMainContent.fromJson(e))
          .toList();
      return BaseResponse.success(list);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<List<String>>> getSearchKeywords() async {
    final res = await get(
      'search/keywords',
    );

    if (res.success) {
      var list = (res.data as List<dynamic>).map((e) => e.toString()).toList();
      return BaseResponse.success(list);
    }
    return BaseResponse.error(res.message);
  }

  /// Get Main free content list
  Future<BaseResponse<List<LikeContent>>> getSearchResult(
      {required int page, required String keyword}) async {
    final res = await get(
      'search',
      query: {
        'page': page,
        'search_value': keyword,
      },
    );

    if (res.success) {
      var list = (res.data['list'] as List<dynamic>)
          .map((e) => LikeContent.fromJson(e))
          .toList();
      return BaseResponse.success(list);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<List<int>>> getListUserLikedContentId(
      {required List<int> ids}) async {
    final res = await post('likes/index', data: {
      "type": "content",
      "ids": ids,
    });

    if (res.success) {
      List<int> list = (res.data as List<dynamic>)
          .map((e) => int.parse(e.toString()))
          .toList();
      return BaseResponse.success(list);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<List<String>>> getSearchingHistoryList() async {
    final res = await get('search/history');
    if (res.success) {
      var list = (res.data as List<dynamic>).map((e) => e.toString()).toList();
      return BaseResponse.success(list);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<bool>> removeSearchingHistory(
      {required String keyword}) async {
    final res = await delete('search', query: {"search_value": keyword});
    if (res.success) {
      return BaseResponse.success(true);
    }
    return BaseResponse.error(res.message);
  }

  sortListById(list) {
    list.sort(((a, b) {
      final propertyA = a.id;
      final propertyB = b.id;
      if (propertyA < propertyB) {
        return -1;
      } else if (propertyA > propertyB) {
        return 1;
      } else {
        return 0;
      }
    }));
    return list;
  }
}
