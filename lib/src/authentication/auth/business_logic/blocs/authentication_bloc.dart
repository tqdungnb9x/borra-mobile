import 'dart:async';

import 'package:borra_app/app_base/models/status.dart';
import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/src/authentication/auth/data/models/auth_status.dart';
import 'package:borra_app/src/authentication/auth/data/models/user.dart';
import 'package:borra_app/src/authentication/auth/data/repositories/authentication_repository.dart';
import 'package:borra_app/src/authentication/auth/data/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../app_base/services/local/secure_storage/local_storage_repo.dart';

part 'authentication_bloc.freezed.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState>
    with ApiError {
  final AuthenticationRepository authRepo = AuthenticationRepository();
  final LocalRepository localRepository = LocalRepository();
  final UserRepository userRepo = UserRepository();
  AuthenticationBloc() : super(AuthenticationState.initial()) {
    on<AuthEventInitial>(_onInitial);
    on<GetUserInfo>(_onGetUserInfo);
    on<AuthEventLogOut>(_onSignOut);
    on<AuthEventSetUserNoti>(_onSetNoti);
    on<AuthEventUpdateUserProfle>(_handleUpdateUserProfile);
    on<UserWatchAds>(_onUserWatchAds);
  }
  FutureOr _onInitial(
      AuthEventInitial event, Emitter<AuthenticationState> emit) async {
    getUserInfo();
  }

  FutureOr _onGetUserInfo(
      GetUserInfo event, Emitter<AuthenticationState> emit) async {
    await apiCallSafety<User?>(
      () => authRepo.getUserInfo(),
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onSuccess: (res) async {
        emit(state.copyWith(
            status: const Status.success(),
            user: res,
            authStatus: AuthStatus.authenticated(res!)));
        if (res.isAgree != 0) {
          var userWord = await authRepo.getWord();
          emit(state.copyWith(userWord: userWord.data ?? ''));
        }
      },
      onError: (error) async {
        emit(state.copyWith(
          status: Status.failure(error: error),
          authStatus: const AuthStatus.unauthenticated(),
        ));
      },
      onCompleted: () async =>
          emit(state.copyWith(status: const Status.idle())),
      onFinally: () async => emit(state.copyWith(status: const Status.idle())),
    );
  }

  Future<FutureOr> _onSignOut(
      AuthEventLogOut event, Emitter<AuthenticationState> emit) async {
    await authRepo.signOut();
    await localRepository.clearTokens();

    emit(state.copyWith(
        authStatus: const AuthStatus.unauthenticated(), user: null));
  }

  initial() {
    add(const AuthEventInitial());
  }

  getUserInfo() async {
    add(const GetUserInfo());
  }

  void logOut() {
    add(const AuthEventLogOut());
  }

  // updateUserNoti(bool status) {
  //   add(AuthEventSetUserNoti(status));
  // }

  updateUserInfo() {
    add(const AuthEventUpdateUserProfle());
  }

  userWatchAds({required User user, bool isPageResultWatchAds = false}) {
    add(UserWatchAds(user: user, isPageResultWatchAds: isPageResultWatchAds));
  }

  FutureOr<void> _handleUpdateUserProfile(AuthEventUpdateUserProfle event,
      Emitter<AuthenticationState> emit) async {
    await apiCallSafety<User?>(
      () => authRepo.getUserInfo(),
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onSuccess: (res) async {
        emit(state.copyWith(
          status: const Status.success(),
          user: res,
        ));
        if (res!.isAgree != 0) {
          var userWord = await authRepo.getWord();
          emit(state.copyWith(userWord: userWord.data ?? ''));
        }
      },
      onError: (error) async => emit(state.copyWith(
        status: Status.failure(error: error),
        authStatus: const AuthStatus.unauthenticated(),
      )),
      onCompleted: () async =>
          emit(state.copyWith(status: const Status.idle())),
      onFinally: () async => emit(state.copyWith(status: const Status.idle())),
    );
  }

  FutureOr<void> _onSetNoti(
      AuthEventSetUserNoti event, Emitter<AuthenticationState> emit) {}

  Future<void> _onUserWatchAds(
      UserWatchAds event, Emitter<AuthenticationState> emit) async {
    await apiCallSafety<User?>(
      () => authRepo.userWatchAds(
          user: event.user, isPageResultWatchAds: event.isPageResultWatchAds),
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onSuccess: (res) async {
        emit(state.copyWith(
          status: const Status.success(),
          user: res,
        ));
      },
      onError: (error) async => {
        emit(state.copyWith(
          status: Status.failure(error: error),
        ))
      },
      onCompleted: () async =>
          emit(state.copyWith(status: const Status.idle())),
      onFinally: () async => emit(state.copyWith(status: const Status.idle())),
    );
  }
}
