part of 'feedback_bloc.dart';

@freezed
class FeedbackEvent with _$FeedbackEvent {
  const factory FeedbackEvent.initial(int contentId, int? purchaseId) =
      _Initial;
  const factory FeedbackEvent.postFeedback(
      int selectedFeedback, int contentId, int purchaseId) = PostFeedback;
}
