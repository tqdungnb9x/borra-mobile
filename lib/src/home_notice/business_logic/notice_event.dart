part of 'notice_bloc.dart';

@freezed
class NoticeEvent with _$NoticeEvent {
  const factory NoticeEvent.initial(String type) = _Initial;
  const factory NoticeEvent.loadMore(String type) = _LoadMore;
}
