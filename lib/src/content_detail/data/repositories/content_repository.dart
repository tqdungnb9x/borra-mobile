import 'package:borra_app/src/content_detail/data/models/content.dart';
import 'package:borra_app/src/content_detail/data/models/content_input_argument.dart';
import 'package:borra_app/src/content_detail/data/models/preview.dart';
import 'package:borra_app/src/content_detail/data/services/content_service.dart';
import 'package:borra_app/src/content_result/data/models/content_detail_model.dart';

import '../../../../app_base/services/rest_api/rest_api.dart';

class ContentRepository {
  final ContentService _service = ContentService();
  Future<BaseResponse<AppContent>> getContent({required int contentId}) async {
    final result = await _service.getContent(contentId: contentId);
    return result;
  }

  Future<BaseResponse<List<ContentPreview>>> getPreview(
      {required int contentId}) async {
    final result = await _service.getPreview(contentId: contentId);
    return result;
  }

  Future<BaseResponse<bool>> postLikeContent({required int contentId}) async {
    return await _service.postLikeContent(contentId: contentId);
  }

  Future<BaseResponse<bool>> checkLikedContent({required List<int> ids}) async {
    return await _service.checkLikedContent(ids: ids);
  }

  Future<BaseResponse<ContentResult>> submitPurchaseContent(
      {required int contentId,
      required String name,
      required String gender,
      required String value}) async {
    final result = await _service.submitContentJuyeog(
      contentId: contentId,
      name: name,
      gender: gender,
      value: value,
    );
    return result;
  }

  Future<BaseResponse<ContentResult>> submitPurchaseContentSaju({
    required int contentId,
    required ContentBasicArgument user,
    ContentBasicArgument? partner,
  }) async {
    final result = await _service.submitContentSaju(
      contentId: contentId,
      user: user,
      partner: partner,
    );

    return result;
  }
}
