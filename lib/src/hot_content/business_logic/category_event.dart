part of 'category_bloc.dart';

@freezed
class CategoryEvent with _$CategoryEvent {
  const factory CategoryEvent.initial() = _Initial;
  const factory CategoryEvent.initialHotContent() = _InitialHotContent;
  const factory CategoryEvent.selectCategory(ContentCategory category) =
      SelectCategory;
  const factory CategoryEvent.loadMore(int id) = _LoadMore;
  const factory CategoryEvent.removeAll() = _RemoveAll;
}
