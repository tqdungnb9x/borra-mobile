import 'package:borra_app/src/like/data/services/like_service.dart';

import '../../../../app_base/services/rest_api/rest_api.dart';
import '../models/user_liked_content_model.dart';

class LikeRepository {
  final LikeService _service = LikeService();
  Future<BaseResponse<List<UserLikedContent>>> getListLiked(
      {int page = 1}) async {
    final result = await _service.getListLikedContent(page: page);
    return result;
  }
}
