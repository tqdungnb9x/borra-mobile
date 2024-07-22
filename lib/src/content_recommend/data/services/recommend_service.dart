import 'package:borra_app/app_base/services/rest_api/rest_api.dart';

import '../../../home/data/models/app_main_content.dart';

class RecommendService extends Api {
  Future<BaseResponse<List<AppMainContent>>> getRecommend() async {
    final res = await get('contents/main/hot/recommend');

    if (!res.success) {
      return BaseResponse.error(res.message);
    }

    final List<dynamic> rawData = res.data as List<dynamic>;
    if (rawData.isEmpty) {
      return BaseResponse.success([]);
    }
    final List<AppMainContent> recommendContents =
        rawData.map((dynamic data) => AppMainContent.fromJson(data)).toList();

    final List<int> contentIds =
        recommendContents.map((AppMainContent e) => e.id).toList();

    final BaseResponse<List<int>> likedContentIdsResponse =
        await getListUserLikedContentId(ids: contentIds);

    if (likedContentIdsResponse.success) {
      final List<int> likedContentIds = likedContentIdsResponse.data!;
      for (var userContent in recommendContents) {
        userContent.isLiked = likedContentIds.contains(userContent.id);
      }
    }

    return BaseResponse.success(recommendContents);
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
}
