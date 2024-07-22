part of 'content_purchased_bloc.dart';

@freezed
class ContentPurchasedState with _$ContentPurchasedState {
  const factory ContentPurchasedState({
    @Default(Status.idle()) Status status,
    @Default(Status.idle()) Status statusLoadPreview,
    @Default(Status.idle()) Status statusLoadFeedback,
    @Default(Status.idle()) Status statusLoadResult,
    @Default([]) List<ContentPreview> listPreview,
    @Default([]) List<AppMainContent> listRecommend,
    @Default([]) List<int> listLikedIds,
    @Default('') String shareLink,
    ContentBasicArgument? contentBasicArgument,
    ContentResult? contentResult,
    AppContent? content,
    List<Map<String, dynamic>>? tarotList,
    @Default(false) bool isLiked,
  }) = _ContentPurchasedState;
  factory ContentPurchasedState.initial() => const ContentPurchasedState();
}

List<Map<String, dynamic>> processTarotContent(ContentResult result) {
  List<Map<String, dynamic>> resultList = [];
  List<String> tarotCards = [];
  if (result.purchase.value != null) {
    tarotCards = result.purchase.value!.split(',');
  }

  var parentMap = result.children.groupListsBy((element) => element.parentId);
  int index = 0;
  parentMap.forEach((key, childrenList) {
    Map<String, dynamic> tarotMap = {
      'tarot_card_order': index,
      'tarot_card': tarotCards.length == parentMap.length
          ? AppImages.getTarotResult(tarotCards[index])
          : '',
      'tarot_id': key,
      'children': childrenList,
    };
    index = index + 1;
    resultList.add(tarotMap);
  });

  return resultList;
}
