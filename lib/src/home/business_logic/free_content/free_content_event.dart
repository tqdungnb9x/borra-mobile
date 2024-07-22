part of 'free_content_bloc.dart';

@freezed
class FreeContentEvent with _$FreeContentEvent {
  const factory FreeContentEvent.initial() = _Initial;
  const factory FreeContentEvent.loadMore() = _LoadMore;
}
