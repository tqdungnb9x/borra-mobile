part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState({
    @Default(Status.idle()) Status status,
    @Default(Status.idle()) Status statusGetContentByCat,
    @Default(Status.idle()) Status statusLoadMore,
    List<ContentCategory>? listCategory,
    ContentCategory? selectedCategory,
    @Default([]) List<LikeContent> listContentByCat,
    @Default(1) int page,
    @Default(10) int pageSize,
  }) = _CategoryState;
  factory CategoryState.initial() => const CategoryState();
}
