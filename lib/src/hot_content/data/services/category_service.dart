import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/src/hot_content/data/models/category.dart';
import 'package:borra_app/src/like/data/models/like_content_model.dart';

class CategoryService extends Api {
  Future<BaseResponse<List<ContentCategory>>> getListCategory() async {
    final res = await get(
      'common/categories',
    );

    if (res.success) {
      var list = (res.data as List<dynamic>)
          .map((e) => ContentCategory.fromJson(e))
          .toList();
      return BaseResponse.success(list);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<List<LikeContent>>> getCategoryDetailList(
      {required int categoryId, required int page}) async {
    final res = await get(
      'contents/categories/$categoryId',
      query: {'page': page},
    );

    if (res.success) {
      var list = (res.data['list'] as List<dynamic>)
          .map((e) => LikeContent.fromJson(e))
          .toList();
      return BaseResponse.success(list);
    }
    return BaseResponse.error(res.message);
  }
}
