import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/src/content_feedback/data/services/feedback_services.dart';

import '../models/feedback.dart';

class FeedbackRepository {
  final FeedbackService _service = FeedbackService();
  Future<BaseResponse<AppFeedback>> getFeedback(
      {required int contentId, int? purchaseId}) {
    return _service.getFeedback(contentId: contentId, purchaseId: purchaseId);
  }

  Future<BaseResponse<FeedbackResult>> postFeedback(
      {required int feedback,
      required int purchaseId,
      required int contentId}) {
    return _service.postFeedback(
        feedback: feedback, purchaseId: purchaseId, contentId: contentId);
  }
}
