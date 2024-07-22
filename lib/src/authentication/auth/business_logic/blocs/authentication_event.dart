part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.initial() = AuthEventInitial;
  const factory AuthenticationEvent.getUserInfo() = GetUserInfo;
  const factory AuthenticationEvent.logOut() = AuthEventLogOut;
  const factory AuthenticationEvent.watchAds(
      {required User user, required bool isPageResultWatchAds}) = UserWatchAds;
  const factory AuthenticationEvent.setUserNoti(bool status) =
      AuthEventSetUserNoti;
  const factory AuthenticationEvent.updateUserProfile() =
      AuthEventUpdateUserProfle;
}
