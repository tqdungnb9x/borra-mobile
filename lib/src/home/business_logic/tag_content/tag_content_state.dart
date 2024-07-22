part of 'tag_content_bloc.dart';

@freezed
class TagContentState with _$TagContentState {
  const factory TagContentState({
    @Default(Status.idle()) Status status,
    @Default(Status.idle()) Status loadStatus,
    @Default([]) List<LikeContent> listTagAllContent,
    @Default(1) int tagId,
    @Default(1) int page,
    @Default(10) int pageSize,
    List<AppTag>? listTag,
  }) = _TagContentState;
  factory TagContentState.initial() => const TagContentState();
}
