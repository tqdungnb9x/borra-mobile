part of 'manage_profile_bloc.dart';

@freezed
class ManageProfileState with _$ManageProfileState {
  const factory ManageProfileState({
    User? user,
    @Default(false) bool isChangedInfo,
    @Default(Status.idle()) Status statusLoadingData,
    @Default(Status.idle()) Status statusChanging,
    @Default(Status.idle()) Status statusSetNoti,
    @Default('') String withdrawReason,
    @Default(Status.idle()) Status statusChangingWithdraw,
    bool? isNotify,
  }) = _ManageProfileState;
  factory ManageProfileState.initial() => const ManageProfileState();
}
