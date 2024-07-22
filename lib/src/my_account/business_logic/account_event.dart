part of 'account_bloc.dart';

@freezed
class AccountEvent with _$AccountEvent {
  const factory AccountEvent.initial() = _Initial;
  const factory AccountEvent.loadListLike() = _LoadListLiked;
  const factory AccountEvent.loadListLikeMore() = _LoadListLikedMore;
  const factory AccountEvent.loadListReplay() = _LoadListReplay;
  const factory AccountEvent.loadListReplayMore() = _LoadListReplayMore;
  const factory AccountEvent.loadLikedIds(List<int> ids) = _LoadLikedIds;
  const factory AccountEvent.loadListTag() = _LoadListTag;
  const factory AccountEvent.updateProfile(User user) = _UpdateProfile;
}
