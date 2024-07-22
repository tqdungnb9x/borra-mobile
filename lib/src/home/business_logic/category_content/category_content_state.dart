part of 'category_content_bloc.dart';

@freezed
class CategoryContentState with _$CategoryContentState {
  const factory CategoryContentState({
    @Default(Status.idle()) Status status,
    @Default(Status.idle()) Status loadStatus,
    @Default([]) List<LikeContent> listCategoryContent,
    @Default(1) int page,
    @Default(10) int pageSize,
  }) = _CategoryContentState;
  factory CategoryContentState.initial() => const CategoryContentState();
}
