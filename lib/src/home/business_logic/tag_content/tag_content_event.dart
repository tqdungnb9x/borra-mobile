part of 'tag_content_bloc.dart';

@freezed
class TagContentEvent with _$TagContentEvent {
  const factory TagContentEvent.initial(
    int? id,
    int? categoryId,
    String? priceType,
  ) = _Initial;
  const factory TagContentEvent.onSelectTag(
    int? id,
    int? categoryId,
    String? priceType,
  ) = SelectTag;
  const factory TagContentEvent.loadMore(
    int? id,
    int? categoryId,
    String? priceType,
  ) = _LoadMore;
}
