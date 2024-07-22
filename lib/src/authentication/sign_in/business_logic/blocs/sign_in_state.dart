part of 'sign_in_bloc.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    InfoSignIn? input,
    @Default(Status.idle()) Status status,
  }) = _SignInState;
  factory SignInState.initial() => const SignInState();
}
