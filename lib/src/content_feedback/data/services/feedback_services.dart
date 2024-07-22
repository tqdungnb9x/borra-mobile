import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/src/content_feedback/data/models/feedback.dart';

import '../models/content_feedback.dart';

class FeedbackService extends Api {
  Future<BaseResponse<AppFeedback>> getFeedback(
      {required int contentId, int? purchaseId}) async {
    final res = await get('contents/$contentId/feedback',
        query: purchaseId != null ? {'purchase_id': purchaseId} : {});

    if (res.success) {
      var list = (res.data["feedback"] as List<dynamic>)
          .map((e) => ContentFeedback.fromJson(e))
          .toList();
      AppFeedback appFeedback =
          AppFeedback(listFeedback: list, feedbackSelected: res.data["status"]);
      return BaseResponse.success(appFeedback);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<FeedbackResult>> postFeedback(
      {required int feedback,
      required int purchaseId,
      required int contentId}) async {
    final res = await post('contents/$contentId/feedback', data: {
      'feedback_id': feedback,
      'purchase_id': purchaseId,
    });

    if (res.success) {
      FeedbackResult result = FeedbackResult.fromJson(res.data);
      return BaseResponse.success(result);
    }
    return BaseResponse.error(res.message);
  }
}
