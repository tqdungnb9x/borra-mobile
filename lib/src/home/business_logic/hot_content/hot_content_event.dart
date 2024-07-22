part of 'hot_content_bloc.dart';

@freezed
class HotContentEvent with _$HotContentEvent {
  const factory HotContentEvent.initial() = _Initial;
  const factory HotContentEvent.loadMore() = _LoadMore;
}
