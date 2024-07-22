part of 'like_bloc.dart';

@freezed
class LikeState with _$LikeState {
  const factory LikeState({
    @Default(Status.idle()) Status status,
    @Default(Status.idle()) Status statusLoadMore,
    List<UserLikedContent>? listLikedContent,
    @Default(1) int page,
    @Default(10) int pageSize,
  }) = _LikeState;
  factory LikeState.initial() => const LikeState();
}
