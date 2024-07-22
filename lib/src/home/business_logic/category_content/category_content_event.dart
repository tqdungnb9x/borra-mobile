part of 'category_content_bloc.dart';

@freezed
class CategoryContentEvent with _$CategoryContentEvent {
  const factory CategoryContentEvent.initial(int id) = _Initial;
  const factory CategoryContentEvent.loadMore(int id) = _LoadMore;
}
