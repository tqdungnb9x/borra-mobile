import 'package:borra_app/src/hot_content/data/models/category.dart';
import 'package:borra_app/src/hot_content/data/services/category_service.dart';

import '../../../../app_base/services/rest_api/rest_api.dart';
import '../../../like/data/models/like_content_model.dart';

class CategoryRepository {
  final CategoryService _service = CategoryService();
  Future<BaseResponse<List<ContentCategory>>> getListCategory() async {
    final result = await _service.getListCategory();
    return result;
  }

  Future<BaseResponse<List<LikeContent>>> getCategoryContent(
      {int page = 1, required int categoryId}) async {
    final result = await _service.getCategoryDetailList(
        page: page, categoryId: categoryId);
    return result;
  }
}
