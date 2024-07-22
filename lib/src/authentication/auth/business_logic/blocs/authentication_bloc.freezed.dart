// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthenticationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserInfo,
    required TResult Function() logOut,
    required TResult Function(User user, bool isPageResultWatchAds) watchAds,
    required TResult Function(bool status) setUserNoti,
    required TResult Function() updateUserProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserInfo,
    TResult? Function()? logOut,
    TResult? Function(User user, bool isPageResultWatchAds)? watchAds,
    TResult? Function(bool status)? setUserNoti,
    TResult? Function()? updateUserProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserInfo,
    TResult Function()? logOut,
    TResult Function(User user, bool isPageResultWatchAds)? watchAds,
    TResult Function(bool status)? setUserNoti,
    TResult Function()? updateUserProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventInitial value) initial,
    required TResult Function(GetUserInfo value) getUserInfo,
    required TResult Function(AuthEventLogOut value) logOut,
    required TResult Function(UserWatchAds value) watchAds,
    required TResult Function(AuthEventSetUserNoti value) setUserNoti,
    required TResult Function(AuthEventUpdateUserProfle value)
        updateUserProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventInitial value)? initial,
    TResult? Function(GetUserInfo value)? getUserInfo,
    TResult? Function(AuthEventLogOut value)? logOut,
    TResult? Function(UserWatchAds value)? watchAds,
    TResult? Function(AuthEventSetUserNoti value)? setUserNoti,
    TResult? Function(AuthEventUpdateUserProfle value)? updateUserProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventInitial value)? initial,
    TResult Function(GetUserInfo value)? getUserInfo,
    TResult Function(AuthEventLogOut value)? logOut,
    TResult Function(UserWatchAds value)? watchAds,
    TResult Function(AuthEventSetUserNoti value)? setUserNoti,
    TResult Function(AuthEventUpdateUserProfle value)? updateUserProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationEventCopyWith<$Res> {
  factory $AuthenticationEventCopyWith(
          AuthenticationEvent value, $Res Function(AuthenticationEvent) then) =
      _$AuthenticationEventCopyWithImpl<$Res, AuthenticationEvent>;
}

/// @nodoc
class _$AuthenticationEventCopyWithImpl<$Res, $Val extends AuthenticationEvent>
    implements $AuthenticationEventCopyWith<$Res> {
  _$AuthenticationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthEventInitialImplCopyWith<$Res> {
  factory _$$AuthEventInitialImplCopyWith(_$AuthEventInitialImpl value,
          $Res Function(_$AuthEventInitialImpl) then) =
      __$$AuthEventInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthEventInitialImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$AuthEventInitialImpl>
    implements _$$AuthEventInitialImplCopyWith<$Res> {
  __$$AuthEventInitialImplCopyWithImpl(_$AuthEventInitialImpl _value,
      $Res Function(_$AuthEventInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthEventInitialImpl implements AuthEventInitial {
  const _$AuthEventInitialImpl();

  @override
  String toString() {
    return 'AuthenticationEvent.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthEventInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserInfo,
    required TResult Function() logOut,
    required TResult Function(User user, bool isPageResultWatchAds) watchAds,
    required TResult Function(bool status) setUserNoti,
    required TResult Function() updateUserProfile,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserInfo,
    TResult? Function()? logOut,
    TResult? Function(User user, bool isPageResultWatchAds)? watchAds,
    TResult? Function(bool status)? setUserNoti,
    TResult? Function()? updateUserProfile,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserInfo,
    TResult Function()? logOut,
    TResult Function(User user, bool isPageResultWatchAds)? watchAds,
    TResult Function(bool status)? setUserNoti,
    TResult Function()? updateUserProfile,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventInitial value) initial,
    required TResult Function(GetUserInfo value) getUserInfo,
    required TResult Function(AuthEventLogOut value) logOut,
    required TResult Function(UserWatchAds value) watchAds,
    required TResult Function(AuthEventSetUserNoti value) setUserNoti,
    required TResult Function(AuthEventUpdateUserProfle value)
        updateUserProfile,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventInitial value)? initial,
    TResult? Function(GetUserInfo value)? getUserInfo,
    TResult? Function(AuthEventLogOut value)? logOut,
    TResult? Function(UserWatchAds value)? watchAds,
    TResult? Function(AuthEventSetUserNoti value)? setUserNoti,
    TResult? Function(AuthEventUpdateUserProfle value)? updateUserProfile,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventInitial value)? initial,
    TResult Function(GetUserInfo value)? getUserInfo,
    TResult Function(AuthEventLogOut value)? logOut,
    TResult Function(UserWatchAds value)? watchAds,
    TResult Function(AuthEventSetUserNoti value)? setUserNoti,
    TResult Function(AuthEventUpdateUserProfle value)? updateUserProfile,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AuthEventInitial implements AuthenticationEvent {
  const factory AuthEventInitial() = _$AuthEventInitialImpl;
}

/// @nodoc
abstract class _$$GetUserInfoImplCopyWith<$Res> {
  factory _$$GetUserInfoImplCopyWith(
          _$GetUserInfoImpl value, $Res Function(_$GetUserInfoImpl) then) =
      __$$GetUserInfoImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUserInfoImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$GetUserInfoImpl>
    implements _$$GetUserInfoImplCopyWith<$Res> {
  __$$GetUserInfoImplCopyWithImpl(
      _$GetUserInfoImpl _value, $Res Function(_$GetUserInfoImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetUserInfoImpl implements GetUserInfo {
  const _$GetUserInfoImpl();

  @override
  String toString() {
    return 'AuthenticationEvent.getUserInfo()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetUserInfoImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserInfo,
    required TResult Function() logOut,
    required TResult Function(User user, bool isPageResultWatchAds) watchAds,
    required TResult Function(bool status) setUserNoti,
    required TResult Function() updateUserProfile,
  }) {
    return getUserInfo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserInfo,
    TResult? Function()? logOut,
    TResult? Function(User user, bool isPageResultWatchAds)? watchAds,
    TResult? Function(bool status)? setUserNoti,
    TResult? Function()? updateUserProfile,
  }) {
    return getUserInfo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserInfo,
    TResult Function()? logOut,
    TResult Function(User user, bool isPageResultWatchAds)? watchAds,
    TResult Function(bool status)? setUserNoti,
    TResult Function()? updateUserProfile,
    required TResult orElse(),
  }) {
    if (getUserInfo != null) {
      return getUserInfo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventInitial value) initial,
    required TResult Function(GetUserInfo value) getUserInfo,
    required TResult Function(AuthEventLogOut value) logOut,
    required TResult Function(UserWatchAds value) watchAds,
    required TResult Function(AuthEventSetUserNoti value) setUserNoti,
    required TResult Function(AuthEventUpdateUserProfle value)
        updateUserProfile,
  }) {
    return getUserInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventInitial value)? initial,
    TResult? Function(GetUserInfo value)? getUserInfo,
    TResult? Function(AuthEventLogOut value)? logOut,
    TResult? Function(UserWatchAds value)? watchAds,
    TResult? Function(AuthEventSetUserNoti value)? setUserNoti,
    TResult? Function(AuthEventUpdateUserProfle value)? updateUserProfile,
  }) {
    return getUserInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventInitial value)? initial,
    TResult Function(GetUserInfo value)? getUserInfo,
    TResult Function(AuthEventLogOut value)? logOut,
    TResult Function(UserWatchAds value)? watchAds,
    TResult Function(AuthEventSetUserNoti value)? setUserNoti,
    TResult Function(AuthEventUpdateUserProfle value)? updateUserProfile,
    required TResult orElse(),
  }) {
    if (getUserInfo != null) {
      return getUserInfo(this);
    }
    return orElse();
  }
}

abstract class GetUserInfo implements AuthenticationEvent {
  const factory GetUserInfo() = _$GetUserInfoImpl;
}

/// @nodoc
abstract class _$$AuthEventLogOutImplCopyWith<$Res> {
  factory _$$AuthEventLogOutImplCopyWith(_$AuthEventLogOutImpl value,
          $Res Function(_$AuthEventLogOutImpl) then) =
      __$$AuthEventLogOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthEventLogOutImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$AuthEventLogOutImpl>
    implements _$$AuthEventLogOutImplCopyWith<$Res> {
  __$$AuthEventLogOutImplCopyWithImpl(
      _$AuthEventLogOutImpl _value, $Res Function(_$AuthEventLogOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthEventLogOutImpl implements AuthEventLogOut {
  const _$AuthEventLogOutImpl();

  @override
  String toString() {
    return 'AuthenticationEvent.logOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthEventLogOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserInfo,
    required TResult Function() logOut,
    required TResult Function(User user, bool isPageResultWatchAds) watchAds,
    required TResult Function(bool status) setUserNoti,
    required TResult Function() updateUserProfile,
  }) {
    return logOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserInfo,
    TResult? Function()? logOut,
    TResult? Function(User user, bool isPageResultWatchAds)? watchAds,
    TResult? Function(bool status)? setUserNoti,
    TResult? Function()? updateUserProfile,
  }) {
    return logOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserInfo,
    TResult Function()? logOut,
    TResult Function(User user, bool isPageResultWatchAds)? watchAds,
    TResult Function(bool status)? setUserNoti,
    TResult Function()? updateUserProfile,
    required TResult orElse(),
  }) {
    if (logOut != null) {
      return logOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventInitial value) initial,
    required TResult Function(GetUserInfo value) getUserInfo,
    required TResult Function(AuthEventLogOut value) logOut,
    required TResult Function(UserWatchAds value) watchAds,
    required TResult Function(AuthEventSetUserNoti value) setUserNoti,
    required TResult Function(AuthEventUpdateUserProfle value)
        updateUserProfile,
  }) {
    return logOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventInitial value)? initial,
    TResult? Function(GetUserInfo value)? getUserInfo,
    TResult? Function(AuthEventLogOut value)? logOut,
    TResult? Function(UserWatchAds value)? watchAds,
    TResult? Function(AuthEventSetUserNoti value)? setUserNoti,
    TResult? Function(AuthEventUpdateUserProfle value)? updateUserProfile,
  }) {
    return logOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventInitial value)? initial,
    TResult Function(GetUserInfo value)? getUserInfo,
    TResult Function(AuthEventLogOut value)? logOut,
    TResult Function(UserWatchAds value)? watchAds,
    TResult Function(AuthEventSetUserNoti value)? setUserNoti,
    TResult Function(AuthEventUpdateUserProfle value)? updateUserProfile,
    required TResult orElse(),
  }) {
    if (logOut != null) {
      return logOut(this);
    }
    return orElse();
  }
}

abstract class AuthEventLogOut implements AuthenticationEvent {
  const factory AuthEventLogOut() = _$AuthEventLogOutImpl;
}

/// @nodoc
abstract class _$$UserWatchAdsImplCopyWith<$Res> {
  factory _$$UserWatchAdsImplCopyWith(
          _$UserWatchAdsImpl value, $Res Function(_$UserWatchAdsImpl) then) =
      __$$UserWatchAdsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user, bool isPageResultWatchAds});
}

/// @nodoc
class __$$UserWatchAdsImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$UserWatchAdsImpl>
    implements _$$UserWatchAdsImplCopyWith<$Res> {
  __$$UserWatchAdsImplCopyWithImpl(
      _$UserWatchAdsImpl _value, $Res Function(_$UserWatchAdsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? isPageResultWatchAds = null,
  }) {
    return _then(_$UserWatchAdsImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      isPageResultWatchAds: null == isPageResultWatchAds
          ? _value.isPageResultWatchAds
          : isPageResultWatchAds // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UserWatchAdsImpl implements UserWatchAds {
  const _$UserWatchAdsImpl(
      {required this.user, required this.isPageResultWatchAds});

  @override
  final User user;
  @override
  final bool isPageResultWatchAds;

  @override
  String toString() {
    return 'AuthenticationEvent.watchAds(user: $user, isPageResultWatchAds: $isPageResultWatchAds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserWatchAdsImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isPageResultWatchAds, isPageResultWatchAds) ||
                other.isPageResultWatchAds == isPageResultWatchAds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, isPageResultWatchAds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserWatchAdsImplCopyWith<_$UserWatchAdsImpl> get copyWith =>
      __$$UserWatchAdsImplCopyWithImpl<_$UserWatchAdsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserInfo,
    required TResult Function() logOut,
    required TResult Function(User user, bool isPageResultWatchAds) watchAds,
    required TResult Function(bool status) setUserNoti,
    required TResult Function() updateUserProfile,
  }) {
    return watchAds(user, isPageResultWatchAds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserInfo,
    TResult? Function()? logOut,
    TResult? Function(User user, bool isPageResultWatchAds)? watchAds,
    TResult? Function(bool status)? setUserNoti,
    TResult? Function()? updateUserProfile,
  }) {
    return watchAds?.call(user, isPageResultWatchAds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserInfo,
    TResult Function()? logOut,
    TResult Function(User user, bool isPageResultWatchAds)? watchAds,
    TResult Function(bool status)? setUserNoti,
    TResult Function()? updateUserProfile,
    required TResult orElse(),
  }) {
    if (watchAds != null) {
      return watchAds(user, isPageResultWatchAds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventInitial value) initial,
    required TResult Function(GetUserInfo value) getUserInfo,
    required TResult Function(AuthEventLogOut value) logOut,
    required TResult Function(UserWatchAds value) watchAds,
    required TResult Function(AuthEventSetUserNoti value) setUserNoti,
    required TResult Function(AuthEventUpdateUserProfle value)
        updateUserProfile,
  }) {
    return watchAds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventInitial value)? initial,
    TResult? Function(GetUserInfo value)? getUserInfo,
    TResult? Function(AuthEventLogOut value)? logOut,
    TResult? Function(UserWatchAds value)? watchAds,
    TResult? Function(AuthEventSetUserNoti value)? setUserNoti,
    TResult? Function(AuthEventUpdateUserProfle value)? updateUserProfile,
  }) {
    return watchAds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventInitial value)? initial,
    TResult Function(GetUserInfo value)? getUserInfo,
    TResult Function(AuthEventLogOut value)? logOut,
    TResult Function(UserWatchAds value)? watchAds,
    TResult Function(AuthEventSetUserNoti value)? setUserNoti,
    TResult Function(AuthEventUpdateUserProfle value)? updateUserProfile,
    required TResult orElse(),
  }) {
    if (watchAds != null) {
      return watchAds(this);
    }
    return orElse();
  }
}

abstract class UserWatchAds implements AuthenticationEvent {
  const factory UserWatchAds(
      {required final User user,
      required final bool isPageResultWatchAds}) = _$UserWatchAdsImpl;

  User get user;
  bool get isPageResultWatchAds;
  @JsonKey(ignore: true)
  _$$UserWatchAdsImplCopyWith<_$UserWatchAdsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthEventSetUserNotiImplCopyWith<$Res> {
  factory _$$AuthEventSetUserNotiImplCopyWith(_$AuthEventSetUserNotiImpl value,
          $Res Function(_$AuthEventSetUserNotiImpl) then) =
      __$$AuthEventSetUserNotiImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool status});
}

/// @nodoc
class __$$AuthEventSetUserNotiImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$AuthEventSetUserNotiImpl>
    implements _$$AuthEventSetUserNotiImplCopyWith<$Res> {
  __$$AuthEventSetUserNotiImplCopyWithImpl(_$AuthEventSetUserNotiImpl _value,
      $Res Function(_$AuthEventSetUserNotiImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$AuthEventSetUserNotiImpl(
      null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AuthEventSetUserNotiImpl implements AuthEventSetUserNoti {
  const _$AuthEventSetUserNotiImpl(this.status);

  @override
  final bool status;

  @override
  String toString() {
    return 'AuthenticationEvent.setUserNoti(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthEventSetUserNotiImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthEventSetUserNotiImplCopyWith<_$AuthEventSetUserNotiImpl>
      get copyWith =>
          __$$AuthEventSetUserNotiImplCopyWithImpl<_$AuthEventSetUserNotiImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserInfo,
    required TResult Function() logOut,
    required TResult Function(User user, bool isPageResultWatchAds) watchAds,
    required TResult Function(bool status) setUserNoti,
    required TResult Function() updateUserProfile,
  }) {
    return setUserNoti(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserInfo,
    TResult? Function()? logOut,
    TResult? Function(User user, bool isPageResultWatchAds)? watchAds,
    TResult? Function(bool status)? setUserNoti,
    TResult? Function()? updateUserProfile,
  }) {
    return setUserNoti?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserInfo,
    TResult Function()? logOut,
    TResult Function(User user, bool isPageResultWatchAds)? watchAds,
    TResult Function(bool status)? setUserNoti,
    TResult Function()? updateUserProfile,
    required TResult orElse(),
  }) {
    if (setUserNoti != null) {
      return setUserNoti(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventInitial value) initial,
    required TResult Function(GetUserInfo value) getUserInfo,
    required TResult Function(AuthEventLogOut value) logOut,
    required TResult Function(UserWatchAds value) watchAds,
    required TResult Function(AuthEventSetUserNoti value) setUserNoti,
    required TResult Function(AuthEventUpdateUserProfle value)
        updateUserProfile,
  }) {
    return setUserNoti(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventInitial value)? initial,
    TResult? Function(GetUserInfo value)? getUserInfo,
    TResult? Function(AuthEventLogOut value)? logOut,
    TResult? Function(UserWatchAds value)? watchAds,
    TResult? Function(AuthEventSetUserNoti value)? setUserNoti,
    TResult? Function(AuthEventUpdateUserProfle value)? updateUserProfile,
  }) {
    return setUserNoti?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventInitial value)? initial,
    TResult Function(GetUserInfo value)? getUserInfo,
    TResult Function(AuthEventLogOut value)? logOut,
    TResult Function(UserWatchAds value)? watchAds,
    TResult Function(AuthEventSetUserNoti value)? setUserNoti,
    TResult Function(AuthEventUpdateUserProfle value)? updateUserProfile,
    required TResult orElse(),
  }) {
    if (setUserNoti != null) {
      return setUserNoti(this);
    }
    return orElse();
  }
}

abstract class AuthEventSetUserNoti implements AuthenticationEvent {
  const factory AuthEventSetUserNoti(final bool status) =
      _$AuthEventSetUserNotiImpl;

  bool get status;
  @JsonKey(ignore: true)
  _$$AuthEventSetUserNotiImplCopyWith<_$AuthEventSetUserNotiImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthEventUpdateUserProfleImplCopyWith<$Res> {
  factory _$$AuthEventUpdateUserProfleImplCopyWith(
          _$AuthEventUpdateUserProfleImpl value,
          $Res Function(_$AuthEventUpdateUserProfleImpl) then) =
      __$$AuthEventUpdateUserProfleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthEventUpdateUserProfleImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res,
        _$AuthEventUpdateUserProfleImpl>
    implements _$$AuthEventUpdateUserProfleImplCopyWith<$Res> {
  __$$AuthEventUpdateUserProfleImplCopyWithImpl(
      _$AuthEventUpdateUserProfleImpl _value,
      $Res Function(_$AuthEventUpdateUserProfleImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthEventUpdateUserProfleImpl implements AuthEventUpdateUserProfle {
  const _$AuthEventUpdateUserProfleImpl();

  @override
  String toString() {
    return 'AuthenticationEvent.updateUserProfile()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthEventUpdateUserProfleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getUserInfo,
    required TResult Function() logOut,
    required TResult Function(User user, bool isPageResultWatchAds) watchAds,
    required TResult Function(bool status) setUserNoti,
    required TResult Function() updateUserProfile,
  }) {
    return updateUserProfile();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getUserInfo,
    TResult? Function()? logOut,
    TResult? Function(User user, bool isPageResultWatchAds)? watchAds,
    TResult? Function(bool status)? setUserNoti,
    TResult? Function()? updateUserProfile,
  }) {
    return updateUserProfile?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getUserInfo,
    TResult Function()? logOut,
    TResult Function(User user, bool isPageResultWatchAds)? watchAds,
    TResult Function(bool status)? setUserNoti,
    TResult Function()? updateUserProfile,
    required TResult orElse(),
  }) {
    if (updateUserProfile != null) {
      return updateUserProfile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEventInitial value) initial,
    required TResult Function(GetUserInfo value) getUserInfo,
    required TResult Function(AuthEventLogOut value) logOut,
    required TResult Function(UserWatchAds value) watchAds,
    required TResult Function(AuthEventSetUserNoti value) setUserNoti,
    required TResult Function(AuthEventUpdateUserProfle value)
        updateUserProfile,
  }) {
    return updateUserProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEventInitial value)? initial,
    TResult? Function(GetUserInfo value)? getUserInfo,
    TResult? Function(AuthEventLogOut value)? logOut,
    TResult? Function(UserWatchAds value)? watchAds,
    TResult? Function(AuthEventSetUserNoti value)? setUserNoti,
    TResult? Function(AuthEventUpdateUserProfle value)? updateUserProfile,
  }) {
    return updateUserProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEventInitial value)? initial,
    TResult Function(GetUserInfo value)? getUserInfo,
    TResult Function(AuthEventLogOut value)? logOut,
    TResult Function(UserWatchAds value)? watchAds,
    TResult Function(AuthEventSetUserNoti value)? setUserNoti,
    TResult Function(AuthEventUpdateUserProfle value)? updateUserProfile,
    required TResult orElse(),
  }) {
    if (updateUserProfile != null) {
      return updateUserProfile(this);
    }
    return orElse();
  }
}

abstract class AuthEventUpdateUserProfle implements AuthenticationEvent {
  const factory AuthEventUpdateUserProfle() = _$AuthEventUpdateUserProfleImpl;
}

/// @nodoc
mixin _$AuthenticationState {
  AuthStatus get authStatus => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String get userWord => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthenticationStateCopyWith<AuthenticationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res, AuthenticationState>;
  @useResult
  $Res call(
      {AuthStatus authStatus, User? user, Status status, String userWord});

  $AuthStatusCopyWith<$Res> get authStatus;
  $StatusCopyWith<$Res> get status;
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res, $Val extends AuthenticationState>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authStatus = null,
    Object? user = freezed,
    Object? status = null,
    Object? userWord = null,
  }) {
    return _then(_value.copyWith(
      authStatus: null == authStatus
          ? _value.authStatus
          : authStatus // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      userWord: null == userWord
          ? _value.userWord
          : userWord // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthStatusCopyWith<$Res> get authStatus {
    return $AuthStatusCopyWith<$Res>(_value.authStatus, (value) {
      return _then(_value.copyWith(authStatus: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get status {
    return $StatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthenticationStateImplCopyWith<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  factory _$$AuthenticationStateImplCopyWith(_$AuthenticationStateImpl value,
          $Res Function(_$AuthenticationStateImpl) then) =
      __$$AuthenticationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AuthStatus authStatus, User? user, Status status, String userWord});

  @override
  $AuthStatusCopyWith<$Res> get authStatus;
  @override
  $StatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$AuthenticationStateImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$AuthenticationStateImpl>
    implements _$$AuthenticationStateImplCopyWith<$Res> {
  __$$AuthenticationStateImplCopyWithImpl(_$AuthenticationStateImpl _value,
      $Res Function(_$AuthenticationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authStatus = null,
    Object? user = freezed,
    Object? status = null,
    Object? userWord = null,
  }) {
    return _then(_$AuthenticationStateImpl(
      authStatus: null == authStatus
          ? _value.authStatus
          : authStatus // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      userWord: null == userWord
          ? _value.userWord
          : userWord // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthenticationStateImpl implements _AuthenticationState {
  const _$AuthenticationStateImpl(
      {this.authStatus = const AuthStatus.unknown(),
      this.user,
      this.status = const Status.idle(),
      this.userWord = ''});

  @override
  @JsonKey()
  final AuthStatus authStatus;
  @override
  final User? user;
  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final String userWord;

  @override
  String toString() {
    return 'AuthenticationState(authStatus: $authStatus, user: $user, status: $status, userWord: $userWord)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationStateImpl &&
            (identical(other.authStatus, authStatus) ||
                other.authStatus == authStatus) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.userWord, userWord) ||
                other.userWord == userWord));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, authStatus, user, status, userWord);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationStateImplCopyWith<_$AuthenticationStateImpl> get copyWith =>
      __$$AuthenticationStateImplCopyWithImpl<_$AuthenticationStateImpl>(
          this, _$identity);
}

abstract class _AuthenticationState implements AuthenticationState {
  const factory _AuthenticationState(
      {final AuthStatus authStatus,
      final User? user,
      final Status status,
      final String userWord}) = _$AuthenticationStateImpl;

  @override
  AuthStatus get authStatus;
  @override
  User? get user;
  @override
  Status get status;
  @override
  String get userWord;
  @override
  @JsonKey(ignore: true)
  _$$AuthenticationStateImplCopyWith<_$AuthenticationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
