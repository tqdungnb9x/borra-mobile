part of 'recommend_bloc.dart';

@freezed
class RecommendState with _$RecommendState {
  const factory RecommendState(
      {@Default(Status.idle()) Status status,
      @Default([]) List<AppMainContent> listRecommend,
      @Default([]) List<int> listLikedIds,
      int? feedbackResult}) = _RecommendState;
  factory RecommendState.initial() => const RecommendState();
}
