import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/src/content_detail/data/models/content.dart';
import 'package:borra_app/src/content_detail/data/models/content_input_argument.dart';
import 'package:borra_app/src/content_detail/data/models/preview.dart';

import '../../../content_result/data/models/content_detail_model.dart';

class ContentService extends Api {
  Future<BaseResponse<AppContent>> getContent({required int contentId}) async {
    final res = await get('contents/$contentId');
    if (res.success) {
      AppContent content = AppContent.fromJson(res.data);
      return BaseResponse.success(content);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<List<ContentPreview>>> getPreview(
      {required int contentId}) async {
    final res = await get('contents/$contentId/previews');

    if (res.success) {
      var list = (res.data as List<dynamic>)
          .map((e) => ContentPreview.fromJson(e))
          .toList();
      return BaseResponse.success(list);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<bool>> checkLikedContent({
    required List<int> ids,
  }) async {
    final res = await post(
      'likes/index',
      data: {
        'type': 'content',
        'ids': ids,
      },
    );

    if (res.success) {
      final data =
          List<int>.from(res.data.map((dynamic e) => int.parse(e.toString())));
      if (data.isEmpty) {
        return BaseResponse.success(false);
      }
      return BaseResponse.success(true);
    }

    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<bool>> postLikeContent({required int contentId}) async {
    final res = await post('likes', data: {
      'type': 'content',
      'id': contentId,
    });
    if (res.success) {
      return BaseResponse.success(res.data['status']);
    }

    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<ContentResult>> submitContentJuyeog(
      {required int contentId,
      required String name,
      required String gender,
      required String value}) async {
    final res = await post(
      'contents/$contentId/purchase',
      data: {
        "data": [
          {
            "name": name,
            "gender": gender,
            "value": value,
            "birthed_at": "1990-10-10 00:00:00",
            "calendar": "lunar",
            "marital": "single",
            "is_birthed_time": false
          }
        ],
        "register_path": "web",
        "referrer_path": "borra",
        "advertise_used_id": null,
      },
    );

    if (res.success) {
      ContentResult content = ContentResult.fromJson(res.data);
      return BaseResponse.success(content);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<ContentResult>> submitContentSaju({
    required int contentId,
    required ContentBasicArgument user,
    required ContentBasicArgument? partner,
  }) async {
    var input = {
      "data": [
        user.toSubmit(),
        if (partner != null) ...[
          partner.toSubmit(),
        ]
      ],
      "referrer_path": "borra",
      "register_path": "web",
      "advertise_used_id": null,
    };

    final res = await post(
      'contents/$contentId/purchase',
      data: input,
    );

    if (res.success) {
      ContentResult content = ContentResult.fromJson(res.data);
      return BaseResponse.success(content);
    }
    return BaseResponse.error(res.message, code: res.code);
  }
}
