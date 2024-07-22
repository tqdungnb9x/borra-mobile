part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.initial() = _Initial;
  const factory HomeEvent.activeSearch(bool isActive) = ActiveSearch;
  const factory HomeEvent.searchShowing(bool isShowing) = SearchShowing;
  const factory HomeEvent.searchingHistoryRemove(String keyword) =
      SearchingHistoryRemove;
  const factory HomeEvent.initialSearch() = _InitialSearch;
  const factory HomeEvent.executeSearch(String keyword) = ExecuteSearch;
  const factory HomeEvent.clearSearch() = ClearSearch;
  const factory HomeEvent.selectCategory(AppTag tag) = SelectCategory;
  const factory HomeEvent.getListLikedIds(List<int> ids) = GetListLikedIds;
}
