part of 'sign_in_bloc.dart';

@freezed
class SignInEvent with _$SignInEvent {
  const factory SignInEvent.clicked() = _Clicked;
  const factory SignInEvent.inputChanged(InfoSignIn newInput) = _InputChanged;
  const factory SignInEvent.signInWithApple() = SignInApple;
}
