import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import '../models/content_detail_model.dart';

class ContentResultService extends Api {
  Future<BaseResponse<ContentResult>> getContentResultTemp(
      {required int contentId, String? shareCode}) async {
    final res = shareCode != null
        ? await get('purchases/$contentId?code=$shareCode')
        : await get('purchases/$contentId');

    if (res.success) {
      ContentResult content = ContentResult.fromJson(res.data);
      return BaseResponse.success(content);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<String>> getShareLink({required int purchaseId}) async {
    final res = await get(
      'purchases/$purchaseId/share',
    );

    if (res.success) {
      String url = res.data["code"];
      return BaseResponse.success(url);
    }
    return BaseResponse.error(res.message);
  }
}
