part of 'content_result_bloc.dart';

@freezed
class ContentResultEvent with _$ContentResultEvent {
  const factory ContentResultEvent.initial(int contentId, String? shareCode) =
      _Initial;
  const factory ContentResultEvent.checkLiked(int contentId) = CheckLiked;
  const factory ContentResultEvent.likeContent(BuildContext context, int id) =
      LikeContent;
  const factory ContentResultEvent.loadShareLink(int purchaseId) =
      LoadShareLink;
}
