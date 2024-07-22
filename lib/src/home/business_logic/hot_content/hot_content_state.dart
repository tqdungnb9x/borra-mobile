part of 'hot_content_bloc.dart';

@freezed
class HotContentState with _$HotContentState {
  const factory HotContentState({
    @Default(Status.idle()) Status status,
    @Default(Status.idle()) Status loadStatus,
    @Default([]) List<LikeContent> listHotContent,
    @Default(1) int page,
    @Default(10) int pageSize,
  }) = _HotContentState;
  factory HotContentState.initial() => const HotContentState();
}
