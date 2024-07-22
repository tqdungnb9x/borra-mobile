import 'dart:async';

import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app_base/models/status.dart';
import '../../../authentication/auth/data/models/user.dart';
import '../../data/repositories/account_repository.dart';

part 'manage_profile_state.dart';
part 'manage_profile_event.dart';
part 'manage_profile_bloc.freezed.dart';

class ManageProfileBloc extends Bloc<ManageProfileEvent, ManageProfileState>
    with ApiError {
  final AccountRepository repo = AccountRepository();
  ManageProfileBloc() : super(ManageProfileState.initial()) {
    on<_Initial>(_onInitial);
    on<_ProfileChanged>(_onUpdateProfile);
    on<_OnChangeProfileClicked>(_onButtonUpdateClicked);
    on<OnChangeOutReason>(_onChangeOutReason);
    on<_OnWithdrawClicked>(_onWithdrawClicked);
    on<_SetNoti>(_onSetNoti);
  }

  initial() {
    add(const _Initial());
  }

  updateProfile(User updatedUser) {
    add(_ProfileChanged(updatedUser));
  }

  confirmUpdate(User editedUser) {
    add(_OnChangeProfileClicked(editedUser));
  }

  FutureOr<void> _onInitial(
      _Initial event, Emitter<ManageProfileState> emit) async {
    await apiCallSafety<User?>(
      () async {
        return repo.getUserInfo();
      },
      onStart: () async =>
          emit(state.copyWith(statusLoadingData: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(statusLoadingData: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
          statusLoadingData: Status.success(data: res),
          user: res!,
          isNotify: res.isNotify,
        ));
      },
      onFinally: () async =>
          emit(state.copyWith(statusLoadingData: const Status.idle())),
      onCompleted: () async {
        emit(state.copyWith(statusLoadingData: const Status.idle()));
      },
    );
  }

  FutureOr<void> _onUpdateProfile(
      _ProfileChanged event, Emitter<ManageProfileState> emit) {
    emit(state.copyWith(
        user: event.userUpdated,
        isChangedInfo: true,
        isNotify: event.userUpdated.isNotify));
  }

  FutureOr<void> _onButtonUpdateClicked(
      _OnChangeProfileClicked event, Emitter<ManageProfileState> emit) async {
    await apiCallSafety<bool>(
      () async {
        return repo.updateProfile(user: event.userUpdated);
      },
      onStart: () async =>
          emit(state.copyWith(statusChanging: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(statusChanging: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
            statusChanging: Status.success(data: res), isChangedInfo: false));
      },
      onFinally: () async =>
          emit(state.copyWith(statusChanging: const Status.idle())),
      onCompleted: () async {
        emit(state.copyWith(statusChanging: const Status.idle()));
      },
    );
  }

  FutureOr<void> _onChangeOutReason(
      OnChangeOutReason event, Emitter<ManageProfileState> emit) {
    emit(state.copyWith(withdrawReason: event.reason));
  }

  FutureOr<void> _onWithdrawClicked(
      _OnWithdrawClicked event, Emitter<ManageProfileState> emit) async {
    await apiCallSafety<bool>(
      () async {
        return repo.deleteUser(reason: state.withdrawReason);
      },
      onStart: () async =>
          emit(state.copyWith(statusChangingWithdraw: const Status.loading())),
      onSuccess: (res) async {
        emit(state.copyWith(statusChangingWithdraw: Status.success(data: res)));
      },
      onError: (error) async => emit(
          state.copyWith(statusChangingWithdraw: Status.failure(error: error))),
      onFinally: () async =>
          emit(state.copyWith(statusChangingWithdraw: const Status.idle())),
      onCompleted: () async =>
          emit(state.copyWith(statusChangingWithdraw: const Status.idle())),
    );
  }

  deleteUser() {
    add(const _OnWithdrawClicked());
  }

  FutureOr<void> _onSetNoti(
      _SetNoti event, Emitter<ManageProfileState> emit) async {
    await apiCallSafety<bool>(
      () async {
        return repo.setNotification(status: event.status);
      },
      onStart: () async =>
          emit(state.copyWith(statusSetNoti: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(statusSetNoti: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
            statusSetNoti: Status.success(data: res),
            user: state.user!.copyWith(isNotify: event.status)));
      },
      onCompleted: () async {
        emit(state.copyWith(statusSetNoti: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(statusSetNoti: const Status.idle()));
      },
    );
  }

  setNoti(bool status) {
    add(_SetNoti(status));
  }
}
