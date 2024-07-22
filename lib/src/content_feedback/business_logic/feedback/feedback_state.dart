part of 'feedback_bloc.dart';

@freezed
class FeedbackState with _$FeedbackState {
  const factory FeedbackState(
      {@Default(Status.idle()) Status status,
      @Default(Status.idle()) Status statusPost,
      @Default([]) List<ContentFeedback> listFeedback,
      FeedbackResult? feedbackContent,
      int? feedbackResult}) = _FeedbackState;
  factory FeedbackState.initial() => const FeedbackState();
}
