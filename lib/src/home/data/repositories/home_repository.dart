import 'package:borra_app/src/home/data/models/banner.dart';
import 'package:borra_app/src/home/data/models/hot_content.dart';
import 'package:borra_app/src/home/data/models/tag.dart';
import 'package:borra_app/src/home/data/models/app_main_content.dart';

import '../../../../app_base/services/rest_api/rest_api.dart';
import '../../../like/data/models/like_content_model.dart';
import '../services/home_service.dart';

class HomeRepository {
  final HomeService _service = HomeService();
  Future<BaseResponse<List<AppBanner>>> getListBanner() async {
    final result = await _service.getListBanner();
    return result;
  }

  Future<BaseResponse<List<AppTag>>> getTagList() async {
    final result = await _service.getTagList();
    return result;
  }

  Future<BaseResponse<List<AppMainContent>>> getContentListByTag(
      {required int tagId}) async {
    final result = await _service.getContentListByTag(tagId);
    return result;
  }

  Future<BaseResponse<List<HotContent>>> getHotContent() async {
    final result = await _service.getHotContent();
    return result;
  }

  Future<BaseResponse<List<AppMainContent>>> getTarotToday() async {
    final result = await _service.getTarotToday();
    return result;
  }

  Future<BaseResponse<List<AppMainContent>>> getTarotFree() async {
    final result = await _service.getTarotFree();
    return result;
  }

  Future<BaseResponse<List<AppMainContent>>> getTarotMainFree() async {
    final result = await _service.getTarotMainFree();
    return result;
  }

  Future<BaseResponse<List<AppMainContent>>> getTarotFirstFree() async {
    final result = await _service.getTarotFirstFree();
    return result;
  }

  Future<BaseResponse<List<LikeContent>>> getListLiked({int page = 1}) async {
    final result = await _service.getListHotContent(page: page);
    return result;
  }

  Future<BaseResponse<List<LikeContent>>> getCategoryContent(
      {int page = 1, required int categoryId}) async {
    final result =
        await _service.getCategoryContent(page: page, categoryId: categoryId);
    return result;
  }

  Future<BaseResponse<List<LikeContent>>> getListFree({int page = 1}) async {
    final result = await _service.getMainFreeContent(page: page);
    return result;
  }

  Future<BaseResponse<List<LikeContent>>> getTagAllContent(
      {int page = 1,
      String? priceType,
      required int tagId,
      int? categoryId}) async {
    final result = await _service.getTagAllContent(
      page: page,
      tagId: tagId,
      limit: 100,
      categoryId: categoryId,
      priceType: priceType ?? 'all',
    );
    return result;
  }

  Future<BaseResponse<List<AppMainContent>>> getRecommend() async {
    final result = await _service.getRecommend();
    return result;
  }

  Future<BaseResponse<List<String>>> getKeywords() async {
    final result = await _service.getSearchKeywords();
    return result;
  }

  Future<BaseResponse<List<LikeContent>>> getSearchResult(
      {int page = 1, required String keyword}) async {
    final result = await _service.getSearchResult(page: page, keyword: keyword);
    return result;
  }

  Future<BaseResponse<List<int>>> getListLikeId(
      {required List<int> ids}) async {
    final result = await _service.getListUserLikedContentId(ids: ids);
    return result;
  }

  Future<BaseResponse<List<String>>> getSearchingHistoryList() async {
    final result = await _service.getSearchingHistoryList();
    return result;
  }

  Future<BaseResponse<bool>> removeSearchingHistory(
      {required String keyword}) async {
    final result = await _service.removeSearchingHistory(keyword: keyword);
    return result;
  }
}
