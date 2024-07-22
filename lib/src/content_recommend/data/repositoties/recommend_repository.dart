import 'package:borra_app/src/content_recommend/data/services/recommend_service.dart';

import '../../../../app_base/services/rest_api/rest_api.dart';
import '../../../home/data/models/app_main_content.dart';

class RecommendRepository {
  final RecommendService _service = RecommendService();
  Future<BaseResponse<List<AppMainContent>>> getRecommend() async {
    final result = await _service.getRecommend();
    return result;
  }

  Future<BaseResponse<List<int>>> getListLikeIds(
      {required List<int> ids}) async {
    final result = await _service.getListUserLikedContentId(ids: ids);
    return result;
  }
}
