part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState(
      {@Default(Status.idle()) Status status,
      @Default(Status.idle()) Status statusGetContentByTag,
      @Default(Status.idle()) Status statusLoadRecommend,
      @Default(Status.idle()) Status statusLoadKeywords,
      @Default(Status.idle()) Status statusLoadSearch,
      AppTag? selectedTag,
      @Default('') String tagHeader,
      List<AppBanner>? listBanner,
      List<HotContent>? listHotContent,
      List<AppMainContent>? listTarotToday,
      List<AppMainContent>? listTarotFree,
      List<AppMainContent>? listTarotMainFree,
      List<AppMainContent>? listTarotFirstFree,
      List<AppTag>? listTag,
      List<AppMainContent>? listTarotByCategory,
      List<AppMainContent>? listRecommend,
      List<String>? listKeywords,
      List<LikeContent>? listSearchResult,
      @Default(false) bool isSearchShowing,
      @Default(false) bool isActiveSearch,
      @Default(false) bool isExecutedSearch,
      @Default(1) int page,
      @Default(10) int pageSize,
      @Default([]) List<int> listLikedIds,
      @Default([]) List<String> searchingHistoryList}) = _HomeState;
  factory HomeState.initial() => const HomeState();
}

String mapTagtoString(AppTag tag) {
  switch (tag.id) {
    case 1:
      return LocaleKeys.home_tag_title_tag_1.tr();
    case 2:
      return LocaleKeys.home_tag_title_tag_2.tr();
    case 3:
      return LocaleKeys.home_tag_title_tag_3.tr();
    case 4:
      return LocaleKeys.home_tag_title_tag_4.tr();
    case 5:
      return LocaleKeys.home_tag_title_tag_5.tr();
    case 6:
      return LocaleKeys.home_tag_title_tag_6.tr();
    case 7:
      return LocaleKeys.home_tag_title_tag_7.tr();
    case 8:
      return LocaleKeys.home_tag_title_tag_8.tr();
    case 9:
      return LocaleKeys.home_tag_title_tag_9.tr();
    case 10:
      return LocaleKeys.home_tag_title_tag_10.tr();
    case 11:
      return LocaleKeys.home_tag_title_tag_11.tr();
    default:
      return '';
  }
}
