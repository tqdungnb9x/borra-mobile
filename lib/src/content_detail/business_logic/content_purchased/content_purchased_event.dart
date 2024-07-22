part of 'content_purchased_bloc.dart';

@freezed
class ContentPurchasedEvent with _$ContentPurchasedEvent {
  const factory ContentPurchasedEvent.initial(ContentInputArgument input) =
      _Initial;
  const factory ContentPurchasedEvent.loadPreviews(int contentId) = LoadPreview;
  const factory ContentPurchasedEvent.loadFeedback(int contentId) =
      LoadFeedback;
  const factory ContentPurchasedEvent.likeContent(
      BuildContext context, int id) = LikeContent;
  const factory ContentPurchasedEvent.loadRecommend() = LoadRecommend;
  const factory ContentPurchasedEvent.checkLiked(int contentId) = CheckLiked;
  const factory ContentPurchasedEvent.getContentDetail(int contentId) =
      GetContentDetail;
  const factory ContentPurchasedEvent.getListLikedIds(List<int> ids) =
      GetListLikedIds;
  const factory ContentPurchasedEvent.loadShareLink(int purchaseId) =
      LoadShareLink;
}
