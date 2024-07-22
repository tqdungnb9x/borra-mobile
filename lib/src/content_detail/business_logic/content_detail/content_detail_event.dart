part of 'content_detail_bloc.dart';

@freezed
class ContentDetailEvent with _$ContentDetailEvent {
  const factory ContentDetailEvent.initial(int contentId) = _Initial;
  const factory ContentDetailEvent.loadPreviews(int contentId) = LoadPreview;
  const factory ContentDetailEvent.checkLiked(int contentId) = CheckLiked;
  const factory ContentDetailEvent.likeContent(BuildContext context) =
      LikeContent;
  const factory ContentDetailEvent.onValidInput(bool result) = ValidateInput;
  const factory ContentDetailEvent.loadResultJuyeog(
          int contentId, String name, String gender, String value) =
      LoadResultJuyeog;
  const factory ContentDetailEvent.resetInput() = ResetInput;
  const factory ContentDetailEvent.updateInput(
      ContentBasicArgument input, bool isPartner) = UpdateInput;
}
