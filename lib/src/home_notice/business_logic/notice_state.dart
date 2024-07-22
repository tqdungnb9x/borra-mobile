part of 'notice_bloc.dart';

@freezed
class NoticeState with _$NoticeState {
  const factory NoticeState({
    @Default(Status.idle()) Status status,
    @Default(Status.idle()) Status statusLoadMore,
    List<AppNotice>? listNotice,
    @Default(1) int page,
    @Default(10) int pageSize,
  }) = _NoticeState;
  factory NoticeState.initial() => NoticeState();
}
