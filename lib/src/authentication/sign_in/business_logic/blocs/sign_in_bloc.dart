import 'dart:async';

import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/src/authentication/auth/data/repositories/authentication_repository.dart';
import 'package:borra_app/src/authentication/sign_in/data/models/input_sign_in.dart';
import 'package:borra_app/src/authentication/sign_in/data/models/sign_in_info.dart';
import 'package:borra_app/src/authentication/sign_in/data/repositories/sign_in_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../../app_base/models/status.dart';
import '../../../../../app_base/services/local/secure_storage/secure_storage.dart';
import '../../../../../app_base/services/local/secure_storage/secure_storage_service.dart';
import '../../../../../app_base/services/local/shared_preferences/app_preference.dart';

part 'sign_in_state.dart';
part 'sign_in_event.dart';
part 'sign_in_bloc.freezed.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> with ApiError {
  final AuthenticationRepository authRepo = AuthenticationRepository();
  final SignInRepository signInRepository = SignInRepository();
  final LocalSecureRepository _localSecureRepository = LocalSecureRepository();
  SignInBloc() : super(SignInState.initial()) {
    on<_Clicked>(_onClicked);
    on<_InputChanged>(_onInputChanged);
    on<SignInApple>(_onSignInAppleClicked);
  }

  Future<void> _onClicked(_Clicked event, Emitter<SignInState> emit) async {
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    // use this keyHash to register in https://developers.kakao.com Platform Android
    var keyHash = await KakaoSdk.origin;
    print('kakao keyHash: ${keyHash}');
    try {
      emit(state.copyWith(status: const Status.loading()));
      bool talkInstalled = await isKakaoTalkInstalled();

      OAuthToken token = talkInstalled
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();

      var kakaoInfo = await UserApi.instance.me(secureResource: false);
      InfoSignIn info = InfoSignIn.fromKakao(kakaoInfo, token.accessToken,
          fcmToken: fcmToken);

      await _getAppToken(info, emit);

      emit(state.copyWith(status: const Status.success()));
    } on PlatformException catch (e) {
      if (e.code == 'NotSupportError') {
        try {
          OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
          var kakaoInfo = await UserApi.instance.me(secureResource: false);
          InfoSignIn info = InfoSignIn.fromKakao(kakaoInfo, token.accessToken,
              fcmToken: fcmToken);

          await _getAppToken(info, emit);

          emit(state.copyWith(status: const Status.success()));
        } on Exception catch (e) {
          emit(state.copyWith(status: Status.failure(error: e.toString())));
        }
      } else {
        emit(state.copyWith(status: Status.failure(error: e.code)));
      }
    } catch (ex) {
      emit(state.copyWith(status: Status.failure(error: ex.toString())));
    }
  }

  Future<void> _getAppToken(InfoSignIn info, Emitter<SignInState> emit) async {
    await apiCallSafety<SignInReturn>(
      () => signInRepository.getAppTokenKakao(info: info),
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onSuccess: (res) async {
        await AppPreferences.instance
            .set<String>(AppPreferenceKey.accessToken, res!.token);
        await _localSecureRepository.saveData(
            SecureStorageItem(AppPreferenceKey.accessToken.value, res.token));
        emit(state.copyWith(status: const Status.success()));
      },
      onError: (error) async =>
          {emit(state.copyWith(status: Status.failure(error: error)))},
      onCompleted: () async =>
          emit(state.copyWith(status: const Status.idle())),
      onFinally: () async => emit(state.copyWith(status: const Status.idle())),
    );
  }

  void _onInputChanged(_InputChanged event, Emitter<SignInState> emit) {
    emit(state.copyWith(input: event.newInput));
  }

  inputChanged(InfoSignIn newInput) {
    add(_InputChanged(newInput));
  }

  onClicked() {
    add(const _Clicked());
  }

  onSignAppleClicked() {
    add(const SignInApple());
  }

  FutureOr<void> _onSignInAppleClicked(
      SignInApple event, Emitter<SignInState> emit) async {
    String? fcmToken = await FirebaseMessaging.instance.getToken();

    try {
      if (await SignInWithApple.isAvailable()) {
        final result = await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
        );
        //Handle App authen here, verify and get app token
        await apiCallSafety<SignInReturn>(
          () => signInRepository.getAppTokenApple(
            sub: result.userIdentifier ?? '',
            token: result.identityToken ?? '',
            name: result.familyName ?? '',
            email: result.email ?? '',
            hash: result.hashCode.toString(),
            fcmToken: fcmToken,
          ),
          onStart: () async =>
              emit(state.copyWith(status: const Status.loading())),
          onSuccess: (res) async {
            await AppPreferences.instance
                .set<String>(AppPreferenceKey.accessToken, res!.token);
            await _localSecureRepository.saveData(SecureStorageItem(
                AppPreferenceKey.accessToken.value, res.token));
            emit(state.copyWith(status: const Status.success()));
          },
          onError: (error) async => emit(state.copyWith(
            status: Status.failure(error: error),
          )),
          onCompleted: () async =>
              emit(state.copyWith(status: const Status.idle())),
          onFinally: () async =>
              emit(state.copyWith(status: const Status.idle())),
        );
      } else {
        emit(state.copyWith(
            status: const Status.failure(error: 'Not supported')));
      }
    } catch (e) {
      emit(state.copyWith(status: Status.failure(error: e.toString())));
    }
  }
}
