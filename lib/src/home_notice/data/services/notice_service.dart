import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/src/home_notice/data/models/notice_model.dart';

class NoticeService extends Api {
  Future<BaseResponse<List<AppNotice>>> getListLNotice(
      {required int page, required String type}) async {
    final res = await get('posts', query: {'page': page, 'type': type});

    if (res.success) {
      var list = (res.data['list'] as List<dynamic>)
          .map((e) => AppNotice.fromJson(e))
          .toList();
      return BaseResponse.success(list);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<AppNotice>> getNotice({required int id}) async {
    final res = await get('posts/$id');

    if (res.success) {
      var result = AppNotice.fromJson(res.data);
      return BaseResponse.success(result);
    }
    return BaseResponse.error(res.message);
  }
}
