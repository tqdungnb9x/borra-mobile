part of 'free_content_bloc.dart';

@freezed
class FreeContentState with _$FreeContentState {
  const factory FreeContentState({
    @Default(Status.idle()) Status status,
    @Default(Status.idle()) Status loadStatus,
    @Default([]) List<LikeContent> listFreeContent,
    @Default(1) int page,
    @Default(10) int pageSize,
  }) = _FreeContentState;
  factory FreeContentState.initial() => const FreeContentState();
}
