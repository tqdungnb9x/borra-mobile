import 'package:borra_app/src/home_notice/data/models/notice_model.dart';
import 'package:borra_app/src/home_notice/data/services/notice_service.dart';

import '../../../../app_base/services/rest_api/rest_api.dart';

class NoticeRepository {
  final NoticeService _service = NoticeService();
  Future<BaseResponse<List<AppNotice>>> getListNotice(
      {int page = 1, required String type}) async {
    final result = await _service.getListLNotice(page: page, type: type);
    return result;
  }

  Future<AppNotice?> getNoticeDetail({required int id}) async {
    final result = await _service.getNotice(id: id);
    return result.data;
  }
}
