import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/src/like/data/models/user_liked_content_model.dart';

class LikeService extends Api {
  Future<BaseResponse<List<UserLikedContent>>> getListLikedContent(
      {required int page}) async {
    final res =
        await get('accounts/contents/likes/index', query: {'page': page});

    if (res.success) {
      var list = (res.data['list'] as List<dynamic>)
          .map((e) => UserLikedContent.fromJson(e))
          .toList();
      return BaseResponse.success(list);
    }
    return BaseResponse.error(res.message);
  }
}
