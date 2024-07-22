part of 'manage_profile_bloc.dart';

@freezed
class ManageProfileEvent with _$ManageProfileEvent {
  const factory ManageProfileEvent.initial() = _Initial;
  const factory ManageProfileEvent.loadListTag() = _LoadListTag;
  const factory ManageProfileEvent.setNotification(bool status) = _SetNoti;
  const factory ManageProfileEvent.onProfileChanged(User userUpdated) =
      _ProfileChanged;
  const factory ManageProfileEvent.onChangeProfileClicked(User userUpdated) =
      _OnChangeProfileClicked;
  const factory ManageProfileEvent.onOutReasonChange(String reason) =
      OnChangeOutReason;
  const factory ManageProfileEvent.onWithdrawClicked() = _OnWithdrawClicked;
}
