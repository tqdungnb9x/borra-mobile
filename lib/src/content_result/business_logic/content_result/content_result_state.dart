part of 'content_result_bloc.dart';

@freezed
class ContentResultState with _$ContentResultState {
  const factory ContentResultState({
    @Default(Status.idle()) Status status,
    @Default(Status.idle()) Status statusLoadRecommend,
    ContentResult? contentResult,
    List<Map<String, dynamic>>? tarotList,
    @Default(false) bool isLiked,
    @Default('') String shareLink,
  }) = _ContentResultState;
  factory ContentResultState.initial() => const ContentResultState();
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
