import 'package:freezed_annotation/freezed_annotation.dart';

import 'user.dart';

part 'auth_status.freezed.dart';

@freezed
class AuthStatus with _$AuthStatus {
  const factory AuthStatus.authenticated(User user) = Authenticated;
  const factory AuthStatus.unauthenticated() = Unauthenticated;
  const factory AuthStatus.unknown() = Unknown;
}
