part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    @Default(AuthStatus.unknown()) AuthStatus authStatus,
    User? user,
    @Default(Status.idle()) Status status,
    @Default('') String userWord,
  }) = _AuthenticationState;

  factory AuthenticationState.initial() => const AuthenticationState();
}
