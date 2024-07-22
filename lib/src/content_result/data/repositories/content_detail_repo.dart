import '../../../../app_base/services/rest_api/rest_api.dart';
import '../models/content_detail_model.dart';
import '../services/content_detail_service.dart';

class ContentResultRepository {
  final ContentResultService _service = ContentResultService();
  Future<BaseResponse<ContentResult>> getContentResultTemp(
      {required int contentId, String? shareCode}) async {
    final result = await _service.getContentResultTemp(
        contentId: contentId, shareCode: shareCode);
    return result;
  }

  Future<BaseResponse<String>> getShareLink({required int purchaseId}) async {
    return await _service.getShareLink(purchaseId: purchaseId);
  }
}
