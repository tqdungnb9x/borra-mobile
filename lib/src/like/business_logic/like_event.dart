part of 'like_bloc.dart';

@freezed
class LikeEvent with _$LikeEvent {
  const factory LikeEvent.initial() = _Initial;
  const factory LikeEvent.loadMore() = _LoadMore;
}
