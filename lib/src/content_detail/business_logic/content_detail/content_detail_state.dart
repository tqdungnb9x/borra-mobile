part of 'content_detail_bloc.dart';

@freezed
class ContentDetailState with _$ContentDetailState {
  const factory ContentDetailState({
    @Default(Status.idle()) Status status,
    @Default(Status.idle()) Status statusLoadPreview,
    @Default(Status.idle()) Status statusLoadFeedback,
    AppContent? content,
    @Default([]) List<ContentPreview> listPreview,
    @Default(false) bool isValidInput,
    @Default(Status.idle()) Status statusLoadResult,
    ContentResult? contentResult,
    ContentBasicArgument? currentUser,
    ContentBasicArgument? partner,
    @Default(false) bool allowSubmitForm,
    @Default(false) bool isLiked,
  }) = _ContentDetailState;
  factory ContentDetailState.initial() => const ContentDetailState();
}
