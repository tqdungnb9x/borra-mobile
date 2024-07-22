part of 'account_bloc.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState({
    @Default(Status.idle()) Status status,
    @Default(Status.idle()) Status statusUpdateProfile,
    List<UserContent>? listLikedContent,
    List<UserContent>? listReplaysContent,
    List<UserLikedContent>? listUserLiked,
    List<UserLikedContent>? listUserReplays,
    @Default(1) int page,
    @Default(10) int pageSize,
    @Default([]) List<int> listLikedId,
    List<AppTag>? listTag,
  }) = _AccountState;
  factory AccountState.initial() => const AccountState();
}
