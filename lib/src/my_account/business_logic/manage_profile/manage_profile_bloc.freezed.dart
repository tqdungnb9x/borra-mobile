// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ManageProfileState {
  User? get user => throw _privateConstructorUsedError;
  bool get isChangedInfo => throw _privateConstructorUsedError;
  Status get statusLoadingData => throw _privateConstructorUsedError;
  Status get statusChanging => throw _privateConstructorUsedError;
  Status get statusSetNoti => throw _privateConstructorUsedError;
  String get withdrawReason => throw _privateConstructorUsedError;
  Status get statusChangingWithdraw => throw _privateConstructorUsedError;
  bool? get isNotify => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ManageProfileStateCopyWith<ManageProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManageProfileStateCopyWith<$Res> {
  factory $ManageProfileStateCopyWith(
          ManageProfileState value, $Res Function(ManageProfileState) then) =
      _$ManageProfileStateCopyWithImpl<$Res, ManageProfileState>;
  @useResult
  $Res call(
      {User? user,
      bool isChangedInfo,
      Status statusLoadingData,
      Status statusChanging,
      Status statusSetNoti,
      String withdrawReason,
      Status statusChangingWithdraw,
      bool? isNotify});

  $StatusCopyWith<$Res> get statusLoadingData;
  $StatusCopyWith<$Res> get statusChanging;
  $StatusCopyWith<$Res> get statusSetNoti;
  $StatusCopyWith<$Res> get statusChangingWithdraw;
}

/// @nodoc
class _$ManageProfileStateCopyWithImpl<$Res, $Val extends ManageProfileState>
    implements $ManageProfileStateCopyWith<$Res> {
  _$ManageProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? isChangedInfo = null,
    Object? statusLoadingData = null,
    Object? statusChanging = null,
    Object? statusSetNoti = null,
    Object? withdrawReason = null,
    Object? statusChangingWithdraw = null,
    Object? isNotify = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      isChangedInfo: null == isChangedInfo
          ? _value.isChangedInfo
          : isChangedInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      statusLoadingData: null == statusLoadingData
          ? _value.statusLoadingData
          : statusLoadingData // ignore: cast_nullable_to_non_nullable
              as Status,
      statusChanging: null == statusChanging
          ? _value.statusChanging
          : statusChanging // ignore: cast_nullable_to_non_nullable
              as Status,
      statusSetNoti: null == statusSetNoti
          ? _value.statusSetNoti
          : statusSetNoti // ignore: cast_nullable_to_non_nullable
              as Status,
      withdrawReason: null == withdrawReason
          ? _value.withdrawReason
          : withdrawReason // ignore: cast_nullable_to_non_nullable
              as String,
      statusChangingWithdraw: null == statusChangingWithdraw
          ? _value.statusChangingWithdraw
          : statusChangingWithdraw // ignore: cast_nullable_to_non_nullable
              as Status,
      isNotify: freezed == isNotify
          ? _value.isNotify
          : isNotify // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get statusLoadingData {
    return $StatusCopyWith<$Res>(_value.statusLoadingData, (value) {
      return _then(_value.copyWith(statusLoadingData: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get statusChanging {
    return $StatusCopyWith<$Res>(_value.statusChanging, (value) {
      return _then(_value.copyWith(statusChanging: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get statusSetNoti {
    return $StatusCopyWith<$Res>(_value.statusSetNoti, (value) {
      return _then(_value.copyWith(statusSetNoti: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get statusChangingWithdraw {
    return $StatusCopyWith<$Res>(_value.statusChangingWithdraw, (value) {
      return _then(_value.copyWith(statusChangingWithdraw: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ManageProfileStateImplCopyWith<$Res>
    implements $ManageProfileStateCopyWith<$Res> {
  factory _$$ManageProfileStateImplCopyWith(_$ManageProfileStateImpl value,
          $Res Function(_$ManageProfileStateImpl) then) =
      __$$ManageProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User? user,
      bool isChangedInfo,
      Status statusLoadingData,
      Status statusChanging,
      Status statusSetNoti,
      String withdrawReason,
      Status statusChangingWithdraw,
      bool? isNotify});

  @override
  $StatusCopyWith<$Res> get statusLoadingData;
  @override
  $StatusCopyWith<$Res> get statusChanging;
  @override
  $StatusCopyWith<$Res> get statusSetNoti;
  @override
  $StatusCopyWith<$Res> get statusChangingWithdraw;
}

/// @nodoc
class __$$ManageProfileStateImplCopyWithImpl<$Res>
    extends _$ManageProfileStateCopyWithImpl<$Res, _$ManageProfileStateImpl>
    implements _$$ManageProfileStateImplCopyWith<$Res> {
  __$$ManageProfileStateImplCopyWithImpl(_$ManageProfileStateImpl _value,
      $Res Function(_$ManageProfileStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? isChangedInfo = null,
    Object? statusLoadingData = null,
    Object? statusChanging = null,
    Object? statusSetNoti = null,
    Object? withdrawReason = null,
    Object? statusChangingWithdraw = null,
    Object? isNotify = freezed,
  }) {
    return _then(_$ManageProfileStateImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      isChangedInfo: null == isChangedInfo
          ? _value.isChangedInfo
          : isChangedInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      statusLoadingData: null == statusLoadingData
          ? _value.statusLoadingData
          : statusLoadingData // ignore: cast_nullable_to_non_nullable
              as Status,
      statusChanging: null == statusChanging
          ? _value.statusChanging
          : statusChanging // ignore: cast_nullable_to_non_nullable
              as Status,
      statusSetNoti: null == statusSetNoti
          ? _value.statusSetNoti
          : statusSetNoti // ignore: cast_nullable_to_non_nullable
              as Status,
      withdrawReason: null == withdrawReason
          ? _value.withdrawReason
          : withdrawReason // ignore: cast_nullable_to_non_nullable
              as String,
      statusChangingWithdraw: null == statusChangingWithdraw
          ? _value.statusChangingWithdraw
          : statusChangingWithdraw // ignore: cast_nullable_to_non_nullable
              as Status,
      isNotify: freezed == isNotify
          ? _value.isNotify
          : isNotify // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$ManageProfileStateImpl implements _ManageProfileState {
  const _$ManageProfileStateImpl(
      {this.user,
      this.isChangedInfo = false,
      this.statusLoadingData = const Status.idle(),
      this.statusChanging = const Status.idle(),
      this.statusSetNoti = const Status.idle(),
      this.withdrawReason = '',
      this.statusChangingWithdraw = const Status.idle(),
      this.isNotify});

  @override
  final User? user;
  @override
  @JsonKey()
  final bool isChangedInfo;
  @override
  @JsonKey()
  final Status statusLoadingData;
  @override
  @JsonKey()
  final Status statusChanging;
  @override
  @JsonKey()
  final Status statusSetNoti;
  @override
  @JsonKey()
  final String withdrawReason;
  @override
  @JsonKey()
  final Status statusChangingWithdraw;
  @override
  final bool? isNotify;

  @override
  String toString() {
    return 'ManageProfileState(user: $user, isChangedInfo: $isChangedInfo, statusLoadingData: $statusLoadingData, statusChanging: $statusChanging, statusSetNoti: $statusSetNoti, withdrawReason: $withdrawReason, statusChangingWithdraw: $statusChangingWithdraw, isNotify: $isNotify)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManageProfileStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isChangedInfo, isChangedInfo) ||
                other.isChangedInfo == isChangedInfo) &&
            (identical(other.statusLoadingData, statusLoadingData) ||
                other.statusLoadingData == statusLoadingData) &&
            (identical(other.statusChanging, statusChanging) ||
                other.statusChanging == statusChanging) &&
            (identical(other.statusSetNoti, statusSetNoti) ||
                other.statusSetNoti == statusSetNoti) &&
            (identical(other.withdrawReason, withdrawReason) ||
                other.withdrawReason == withdrawReason) &&
            (identical(other.statusChangingWithdraw, statusChangingWithdraw) ||
                other.statusChangingWithdraw == statusChangingWithdraw) &&
            (identical(other.isNotify, isNotify) ||
                other.isNotify == isNotify));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      isChangedInfo,
      statusLoadingData,
      statusChanging,
      statusSetNoti,
      withdrawReason,
      statusChangingWithdraw,
      isNotify);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ManageProfileStateImplCopyWith<_$ManageProfileStateImpl> get copyWith =>
      __$$ManageProfileStateImplCopyWithImpl<_$ManageProfileStateImpl>(
          this, _$identity);
}

abstract class _ManageProfileState implements ManageProfileState {
  const factory _ManageProfileState(
      {final User? user,
      final bool isChangedInfo,
      final Status statusLoadingData,
      final Status statusChanging,
      final Status statusSetNoti,
      final String withdrawReason,
      final Status statusChangingWithdraw,
      final bool? isNotify}) = _$ManageProfileStateImpl;

  @override
  User? get user;
  @override
  bool get isChangedInfo;
  @override
  Status get statusLoadingData;
  @override
  Status get statusChanging;
  @override
  Status get statusSetNoti;
  @override
  String get withdrawReason;
  @override
  Status get statusChangingWithdraw;
  @override
  bool? get isNotify;
  @override
  @JsonKey(ignore: true)
  _$$ManageProfileStateImplCopyWith<_$ManageProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ManageProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadListTag,
    required TResult Function(bool status) setNotification,
    required TResult Function(User userUpdated) onProfileChanged,
    required TResult Function(User userUpdated) onChangeProfileClicked,
    required TResult Function(String reason) onOutReasonChange,
    required TResult Function() onWithdrawClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadListTag,
    TResult? Function(bool status)? setNotification,
    TResult? Function(User userUpdated)? onProfileChanged,
    TResult? Function(User userUpdated)? onChangeProfileClicked,
    TResult? Function(String reason)? onOutReasonChange,
    TResult? Function()? onWithdrawClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadListTag,
    TResult Function(bool status)? setNotification,
    TResult Function(User userUpdated)? onProfileChanged,
    TResult Function(User userUpdated)? onChangeProfileClicked,
    TResult Function(String reason)? onOutReasonChange,
    TResult Function()? onWithdrawClicked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadListTag value) loadListTag,
    required TResult Function(_SetNoti value) setNotification,
    required TResult Function(_ProfileChanged value) onProfileChanged,
    required TResult Function(_OnChangeProfileClicked value)
        onChangeProfileClicked,
    required TResult Function(OnChangeOutReason value) onOutReasonChange,
    required TResult Function(_OnWithdrawClicked value) onWithdrawClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadListTag value)? loadListTag,
    TResult? Function(_SetNoti value)? setNotification,
    TResult? Function(_ProfileChanged value)? onProfileChanged,
    TResult? Function(_OnChangeProfileClicked value)? onChangeProfileClicked,
    TResult? Function(OnChangeOutReason value)? onOutReasonChange,
    TResult? Function(_OnWithdrawClicked value)? onWithdrawClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadListTag value)? loadListTag,
    TResult Function(_SetNoti value)? setNotification,
    TResult Function(_ProfileChanged value)? onProfileChanged,
    TResult Function(_OnChangeProfileClicked value)? onChangeProfileClicked,
    TResult Function(OnChangeOutReason value)? onOutReasonChange,
    TResult Function(_OnWithdrawClicked value)? onWithdrawClicked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManageProfileEventCopyWith<$Res> {
  factory $ManageProfileEventCopyWith(
          ManageProfileEvent value, $Res Function(ManageProfileEvent) then) =
      _$ManageProfileEventCopyWithImpl<$Res, ManageProfileEvent>;
}

/// @nodoc
class _$ManageProfileEventCopyWithImpl<$Res, $Val extends ManageProfileEvent>
    implements $ManageProfileEventCopyWith<$Res> {
  _$ManageProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ManageProfileEventCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ManageProfileEvent.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadListTag,
    required TResult Function(bool status) setNotification,
    required TResult Function(User userUpdated) onProfileChanged,
    required TResult Function(User userUpdated) onChangeProfileClicked,
    required TResult Function(String reason) onOutReasonChange,
    required TResult Function() onWithdrawClicked,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadListTag,
    TResult? Function(bool status)? setNotification,
    TResult? Function(User userUpdated)? onProfileChanged,
    TResult? Function(User userUpdated)? onChangeProfileClicked,
    TResult? Function(String reason)? onOutReasonChange,
    TResult? Function()? onWithdrawClicked,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadListTag,
    TResult Function(bool status)? setNotification,
    TResult Function(User userUpdated)? onProfileChanged,
    TResult Function(User userUpdated)? onChangeProfileClicked,
    TResult Function(String reason)? onOutReasonChange,
    TResult Function()? onWithdrawClicked,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadListTag value) loadListTag,
    required TResult Function(_SetNoti value) setNotification,
    required TResult Function(_ProfileChanged value) onProfileChanged,
    required TResult Function(_OnChangeProfileClicked value)
        onChangeProfileClicked,
    required TResult Function(OnChangeOutReason value) onOutReasonChange,
    required TResult Function(_OnWithdrawClicked value) onWithdrawClicked,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadListTag value)? loadListTag,
    TResult? Function(_SetNoti value)? setNotification,
    TResult? Function(_ProfileChanged value)? onProfileChanged,
    TResult? Function(_OnChangeProfileClicked value)? onChangeProfileClicked,
    TResult? Function(OnChangeOutReason value)? onOutReasonChange,
    TResult? Function(_OnWithdrawClicked value)? onWithdrawClicked,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadListTag value)? loadListTag,
    TResult Function(_SetNoti value)? setNotification,
    TResult Function(_ProfileChanged value)? onProfileChanged,
    TResult Function(_OnChangeProfileClicked value)? onChangeProfileClicked,
    TResult Function(OnChangeOutReason value)? onOutReasonChange,
    TResult Function(_OnWithdrawClicked value)? onWithdrawClicked,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ManageProfileEvent {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadListTagImplCopyWith<$Res> {
  factory _$$LoadListTagImplCopyWith(
          _$LoadListTagImpl value, $Res Function(_$LoadListTagImpl) then) =
      __$$LoadListTagImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadListTagImplCopyWithImpl<$Res>
    extends _$ManageProfileEventCopyWithImpl<$Res, _$LoadListTagImpl>
    implements _$$LoadListTagImplCopyWith<$Res> {
  __$$LoadListTagImplCopyWithImpl(
      _$LoadListTagImpl _value, $Res Function(_$LoadListTagImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadListTagImpl implements _LoadListTag {
  const _$LoadListTagImpl();

  @override
  String toString() {
    return 'ManageProfileEvent.loadListTag()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadListTagImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadListTag,
    required TResult Function(bool status) setNotification,
    required TResult Function(User userUpdated) onProfileChanged,
    required TResult Function(User userUpdated) onChangeProfileClicked,
    required TResult Function(String reason) onOutReasonChange,
    required TResult Function() onWithdrawClicked,
  }) {
    return loadListTag();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadListTag,
    TResult? Function(bool status)? setNotification,
    TResult? Function(User userUpdated)? onProfileChanged,
    TResult? Function(User userUpdated)? onChangeProfileClicked,
    TResult? Function(String reason)? onOutReasonChange,
    TResult? Function()? onWithdrawClicked,
  }) {
    return loadListTag?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadListTag,
    TResult Function(bool status)? setNotification,
    TResult Function(User userUpdated)? onProfileChanged,
    TResult Function(User userUpdated)? onChangeProfileClicked,
    TResult Function(String reason)? onOutReasonChange,
    TResult Function()? onWithdrawClicked,
    required TResult orElse(),
  }) {
    if (loadListTag != null) {
      return loadListTag();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadListTag value) loadListTag,
    required TResult Function(_SetNoti value) setNotification,
    required TResult Function(_ProfileChanged value) onProfileChanged,
    required TResult Function(_OnChangeProfileClicked value)
        onChangeProfileClicked,
    required TResult Function(OnChangeOutReason value) onOutReasonChange,
    required TResult Function(_OnWithdrawClicked value) onWithdrawClicked,
  }) {
    return loadListTag(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadListTag value)? loadListTag,
    TResult? Function(_SetNoti value)? setNotification,
    TResult? Function(_ProfileChanged value)? onProfileChanged,
    TResult? Function(_OnChangeProfileClicked value)? onChangeProfileClicked,
    TResult? Function(OnChangeOutReason value)? onOutReasonChange,
    TResult? Function(_OnWithdrawClicked value)? onWithdrawClicked,
  }) {
    return loadListTag?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadListTag value)? loadListTag,
    TResult Function(_SetNoti value)? setNotification,
    TResult Function(_ProfileChanged value)? onProfileChanged,
    TResult Function(_OnChangeProfileClicked value)? onChangeProfileClicked,
    TResult Function(OnChangeOutReason value)? onOutReasonChange,
    TResult Function(_OnWithdrawClicked value)? onWithdrawClicked,
    required TResult orElse(),
  }) {
    if (loadListTag != null) {
      return loadListTag(this);
    }
    return orElse();
  }
}

abstract class _LoadListTag implements ManageProfileEvent {
  const factory _LoadListTag() = _$LoadListTagImpl;
}

/// @nodoc
abstract class _$$SetNotiImplCopyWith<$Res> {
  factory _$$SetNotiImplCopyWith(
          _$SetNotiImpl value, $Res Function(_$SetNotiImpl) then) =
      __$$SetNotiImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool status});
}

/// @nodoc
class __$$SetNotiImplCopyWithImpl<$Res>
    extends _$ManageProfileEventCopyWithImpl<$Res, _$SetNotiImpl>
    implements _$$SetNotiImplCopyWith<$Res> {
  __$$SetNotiImplCopyWithImpl(
      _$SetNotiImpl _value, $Res Function(_$SetNotiImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$SetNotiImpl(
      null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SetNotiImpl implements _SetNoti {
  const _$SetNotiImpl(this.status);

  @override
  final bool status;

  @override
  String toString() {
    return 'ManageProfileEvent.setNotification(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetNotiImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetNotiImplCopyWith<_$SetNotiImpl> get copyWith =>
      __$$SetNotiImplCopyWithImpl<_$SetNotiImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadListTag,
    required TResult Function(bool status) setNotification,
    required TResult Function(User userUpdated) onProfileChanged,
    required TResult Function(User userUpdated) onChangeProfileClicked,
    required TResult Function(String reason) onOutReasonChange,
    required TResult Function() onWithdrawClicked,
  }) {
    return setNotification(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadListTag,
    TResult? Function(bool status)? setNotification,
    TResult? Function(User userUpdated)? onProfileChanged,
    TResult? Function(User userUpdated)? onChangeProfileClicked,
    TResult? Function(String reason)? onOutReasonChange,
    TResult? Function()? onWithdrawClicked,
  }) {
    return setNotification?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadListTag,
    TResult Function(bool status)? setNotification,
    TResult Function(User userUpdated)? onProfileChanged,
    TResult Function(User userUpdated)? onChangeProfileClicked,
    TResult Function(String reason)? onOutReasonChange,
    TResult Function()? onWithdrawClicked,
    required TResult orElse(),
  }) {
    if (setNotification != null) {
      return setNotification(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadListTag value) loadListTag,
    required TResult Function(_SetNoti value) setNotification,
    required TResult Function(_ProfileChanged value) onProfileChanged,
    required TResult Function(_OnChangeProfileClicked value)
        onChangeProfileClicked,
    required TResult Function(OnChangeOutReason value) onOutReasonChange,
    required TResult Function(_OnWithdrawClicked value) onWithdrawClicked,
  }) {
    return setNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadListTag value)? loadListTag,
    TResult? Function(_SetNoti value)? setNotification,
    TResult? Function(_ProfileChanged value)? onProfileChanged,
    TResult? Function(_OnChangeProfileClicked value)? onChangeProfileClicked,
    TResult? Function(OnChangeOutReason value)? onOutReasonChange,
    TResult? Function(_OnWithdrawClicked value)? onWithdrawClicked,
  }) {
    return setNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadListTag value)? loadListTag,
    TResult Function(_SetNoti value)? setNotification,
    TResult Function(_ProfileChanged value)? onProfileChanged,
    TResult Function(_OnChangeProfileClicked value)? onChangeProfileClicked,
    TResult Function(OnChangeOutReason value)? onOutReasonChange,
    TResult Function(_OnWithdrawClicked value)? onWithdrawClicked,
    required TResult orElse(),
  }) {
    if (setNotification != null) {
      return setNotification(this);
    }
    return orElse();
  }
}

abstract class _SetNoti implements ManageProfileEvent {
  const factory _SetNoti(final bool status) = _$SetNotiImpl;

  bool get status;
  @JsonKey(ignore: true)
  _$$SetNotiImplCopyWith<_$SetNotiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileChangedImplCopyWith<$Res> {
  factory _$$ProfileChangedImplCopyWith(_$ProfileChangedImpl value,
          $Res Function(_$ProfileChangedImpl) then) =
      __$$ProfileChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User userUpdated});
}

/// @nodoc
class __$$ProfileChangedImplCopyWithImpl<$Res>
    extends _$ManageProfileEventCopyWithImpl<$Res, _$ProfileChangedImpl>
    implements _$$ProfileChangedImplCopyWith<$Res> {
  __$$ProfileChangedImplCopyWithImpl(
      _$ProfileChangedImpl _value, $Res Function(_$ProfileChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUpdated = null,
  }) {
    return _then(_$ProfileChangedImpl(
      null == userUpdated
          ? _value.userUpdated
          : userUpdated // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$ProfileChangedImpl implements _ProfileChanged {
  const _$ProfileChangedImpl(this.userUpdated);

  @override
  final User userUpdated;

  @override
  String toString() {
    return 'ManageProfileEvent.onProfileChanged(userUpdated: $userUpdated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileChangedImpl &&
            (identical(other.userUpdated, userUpdated) ||
                other.userUpdated == userUpdated));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileChangedImplCopyWith<_$ProfileChangedImpl> get copyWith =>
      __$$ProfileChangedImplCopyWithImpl<_$ProfileChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadListTag,
    required TResult Function(bool status) setNotification,
    required TResult Function(User userUpdated) onProfileChanged,
    required TResult Function(User userUpdated) onChangeProfileClicked,
    required TResult Function(String reason) onOutReasonChange,
    required TResult Function() onWithdrawClicked,
  }) {
    return onProfileChanged(userUpdated);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadListTag,
    TResult? Function(bool status)? setNotification,
    TResult? Function(User userUpdated)? onProfileChanged,
    TResult? Function(User userUpdated)? onChangeProfileClicked,
    TResult? Function(String reason)? onOutReasonChange,
    TResult? Function()? onWithdrawClicked,
  }) {
    return onProfileChanged?.call(userUpdated);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadListTag,
    TResult Function(bool status)? setNotification,
    TResult Function(User userUpdated)? onProfileChanged,
    TResult Function(User userUpdated)? onChangeProfileClicked,
    TResult Function(String reason)? onOutReasonChange,
    TResult Function()? onWithdrawClicked,
    required TResult orElse(),
  }) {
    if (onProfileChanged != null) {
      return onProfileChanged(userUpdated);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadListTag value) loadListTag,
    required TResult Function(_SetNoti value) setNotification,
    required TResult Function(_ProfileChanged value) onProfileChanged,
    required TResult Function(_OnChangeProfileClicked value)
        onChangeProfileClicked,
    required TResult Function(OnChangeOutReason value) onOutReasonChange,
    required TResult Function(_OnWithdrawClicked value) onWithdrawClicked,
  }) {
    return onProfileChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadListTag value)? loadListTag,
    TResult? Function(_SetNoti value)? setNotification,
    TResult? Function(_ProfileChanged value)? onProfileChanged,
    TResult? Function(_OnChangeProfileClicked value)? onChangeProfileClicked,
    TResult? Function(OnChangeOutReason value)? onOutReasonChange,
    TResult? Function(_OnWithdrawClicked value)? onWithdrawClicked,
  }) {
    return onProfileChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadListTag value)? loadListTag,
    TResult Function(_SetNoti value)? setNotification,
    TResult Function(_ProfileChanged value)? onProfileChanged,
    TResult Function(_OnChangeProfileClicked value)? onChangeProfileClicked,
    TResult Function(OnChangeOutReason value)? onOutReasonChange,
    TResult Function(_OnWithdrawClicked value)? onWithdrawClicked,
    required TResult orElse(),
  }) {
    if (onProfileChanged != null) {
      return onProfileChanged(this);
    }
    return orElse();
  }
}

abstract class _ProfileChanged implements ManageProfileEvent {
  const factory _ProfileChanged(final User userUpdated) = _$ProfileChangedImpl;

  User get userUpdated;
  @JsonKey(ignore: true)
  _$$ProfileChangedImplCopyWith<_$ProfileChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnChangeProfileClickedImplCopyWith<$Res> {
  factory _$$OnChangeProfileClickedImplCopyWith(
          _$OnChangeProfileClickedImpl value,
          $Res Function(_$OnChangeProfileClickedImpl) then) =
      __$$OnChangeProfileClickedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User userUpdated});
}

/// @nodoc
class __$$OnChangeProfileClickedImplCopyWithImpl<$Res>
    extends _$ManageProfileEventCopyWithImpl<$Res, _$OnChangeProfileClickedImpl>
    implements _$$OnChangeProfileClickedImplCopyWith<$Res> {
  __$$OnChangeProfileClickedImplCopyWithImpl(
      _$OnChangeProfileClickedImpl _value,
      $Res Function(_$OnChangeProfileClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUpdated = null,
  }) {
    return _then(_$OnChangeProfileClickedImpl(
      null == userUpdated
          ? _value.userUpdated
          : userUpdated // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$OnChangeProfileClickedImpl implements _OnChangeProfileClicked {
  const _$OnChangeProfileClickedImpl(this.userUpdated);

  @override
  final User userUpdated;

  @override
  String toString() {
    return 'ManageProfileEvent.onChangeProfileClicked(userUpdated: $userUpdated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnChangeProfileClickedImpl &&
            (identical(other.userUpdated, userUpdated) ||
                other.userUpdated == userUpdated));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnChangeProfileClickedImplCopyWith<_$OnChangeProfileClickedImpl>
      get copyWith => __$$OnChangeProfileClickedImplCopyWithImpl<
          _$OnChangeProfileClickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadListTag,
    required TResult Function(bool status) setNotification,
    required TResult Function(User userUpdated) onProfileChanged,
    required TResult Function(User userUpdated) onChangeProfileClicked,
    required TResult Function(String reason) onOutReasonChange,
    required TResult Function() onWithdrawClicked,
  }) {
    return onChangeProfileClicked(userUpdated);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadListTag,
    TResult? Function(bool status)? setNotification,
    TResult? Function(User userUpdated)? onProfileChanged,
    TResult? Function(User userUpdated)? onChangeProfileClicked,
    TResult? Function(String reason)? onOutReasonChange,
    TResult? Function()? onWithdrawClicked,
  }) {
    return onChangeProfileClicked?.call(userUpdated);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadListTag,
    TResult Function(bool status)? setNotification,
    TResult Function(User userUpdated)? onProfileChanged,
    TResult Function(User userUpdated)? onChangeProfileClicked,
    TResult Function(String reason)? onOutReasonChange,
    TResult Function()? onWithdrawClicked,
    required TResult orElse(),
  }) {
    if (onChangeProfileClicked != null) {
      return onChangeProfileClicked(userUpdated);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadListTag value) loadListTag,
    required TResult Function(_SetNoti value) setNotification,
    required TResult Function(_ProfileChanged value) onProfileChanged,
    required TResult Function(_OnChangeProfileClicked value)
        onChangeProfileClicked,
    required TResult Function(OnChangeOutReason value) onOutReasonChange,
    required TResult Function(_OnWithdrawClicked value) onWithdrawClicked,
  }) {
    return onChangeProfileClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadListTag value)? loadListTag,
    TResult? Function(_SetNoti value)? setNotification,
    TResult? Function(_ProfileChanged value)? onProfileChanged,
    TResult? Function(_OnChangeProfileClicked value)? onChangeProfileClicked,
    TResult? Function(OnChangeOutReason value)? onOutReasonChange,
    TResult? Function(_OnWithdrawClicked value)? onWithdrawClicked,
  }) {
    return onChangeProfileClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadListTag value)? loadListTag,
    TResult Function(_SetNoti value)? setNotification,
    TResult Function(_ProfileChanged value)? onProfileChanged,
    TResult Function(_OnChangeProfileClicked value)? onChangeProfileClicked,
    TResult Function(OnChangeOutReason value)? onOutReasonChange,
    TResult Function(_OnWithdrawClicked value)? onWithdrawClicked,
    required TResult orElse(),
  }) {
    if (onChangeProfileClicked != null) {
      return onChangeProfileClicked(this);
    }
    return orElse();
  }
}

abstract class _OnChangeProfileClicked implements ManageProfileEvent {
  const factory _OnChangeProfileClicked(final User userUpdated) =
      _$OnChangeProfileClickedImpl;

  User get userUpdated;
  @JsonKey(ignore: true)
  _$$OnChangeProfileClickedImplCopyWith<_$OnChangeProfileClickedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnChangeOutReasonImplCopyWith<$Res> {
  factory _$$OnChangeOutReasonImplCopyWith(_$OnChangeOutReasonImpl value,
          $Res Function(_$OnChangeOutReasonImpl) then) =
      __$$OnChangeOutReasonImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String reason});
}

/// @nodoc
class __$$OnChangeOutReasonImplCopyWithImpl<$Res>
    extends _$ManageProfileEventCopyWithImpl<$Res, _$OnChangeOutReasonImpl>
    implements _$$OnChangeOutReasonImplCopyWith<$Res> {
  __$$OnChangeOutReasonImplCopyWithImpl(_$OnChangeOutReasonImpl _value,
      $Res Function(_$OnChangeOutReasonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
  }) {
    return _then(_$OnChangeOutReasonImpl(
      null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnChangeOutReasonImpl implements OnChangeOutReason {
  const _$OnChangeOutReasonImpl(this.reason);

  @override
  final String reason;

  @override
  String toString() {
    return 'ManageProfileEvent.onOutReasonChange(reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnChangeOutReasonImpl &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnChangeOutReasonImplCopyWith<_$OnChangeOutReasonImpl> get copyWith =>
      __$$OnChangeOutReasonImplCopyWithImpl<_$OnChangeOutReasonImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadListTag,
    required TResult Function(bool status) setNotification,
    required TResult Function(User userUpdated) onProfileChanged,
    required TResult Function(User userUpdated) onChangeProfileClicked,
    required TResult Function(String reason) onOutReasonChange,
    required TResult Function() onWithdrawClicked,
  }) {
    return onOutReasonChange(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadListTag,
    TResult? Function(bool status)? setNotification,
    TResult? Function(User userUpdated)? onProfileChanged,
    TResult? Function(User userUpdated)? onChangeProfileClicked,
    TResult? Function(String reason)? onOutReasonChange,
    TResult? Function()? onWithdrawClicked,
  }) {
    return onOutReasonChange?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadListTag,
    TResult Function(bool status)? setNotification,
    TResult Function(User userUpdated)? onProfileChanged,
    TResult Function(User userUpdated)? onChangeProfileClicked,
    TResult Function(String reason)? onOutReasonChange,
    TResult Function()? onWithdrawClicked,
    required TResult orElse(),
  }) {
    if (onOutReasonChange != null) {
      return onOutReasonChange(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadListTag value) loadListTag,
    required TResult Function(_SetNoti value) setNotification,
    required TResult Function(_ProfileChanged value) onProfileChanged,
    required TResult Function(_OnChangeProfileClicked value)
        onChangeProfileClicked,
    required TResult Function(OnChangeOutReason value) onOutReasonChange,
    required TResult Function(_OnWithdrawClicked value) onWithdrawClicked,
  }) {
    return onOutReasonChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadListTag value)? loadListTag,
    TResult? Function(_SetNoti value)? setNotification,
    TResult? Function(_ProfileChanged value)? onProfileChanged,
    TResult? Function(_OnChangeProfileClicked value)? onChangeProfileClicked,
    TResult? Function(OnChangeOutReason value)? onOutReasonChange,
    TResult? Function(_OnWithdrawClicked value)? onWithdrawClicked,
  }) {
    return onOutReasonChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadListTag value)? loadListTag,
    TResult Function(_SetNoti value)? setNotification,
    TResult Function(_ProfileChanged value)? onProfileChanged,
    TResult Function(_OnChangeProfileClicked value)? onChangeProfileClicked,
    TResult Function(OnChangeOutReason value)? onOutReasonChange,
    TResult Function(_OnWithdrawClicked value)? onWithdrawClicked,
    required TResult orElse(),
  }) {
    if (onOutReasonChange != null) {
      return onOutReasonChange(this);
    }
    return orElse();
  }
}

abstract class OnChangeOutReason implements ManageProfileEvent {
  const factory OnChangeOutReason(final String reason) =
      _$OnChangeOutReasonImpl;

  String get reason;
  @JsonKey(ignore: true)
  _$$OnChangeOutReasonImplCopyWith<_$OnChangeOutReasonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnWithdrawClickedImplCopyWith<$Res> {
  factory _$$OnWithdrawClickedImplCopyWith(_$OnWithdrawClickedImpl value,
          $Res Function(_$OnWithdrawClickedImpl) then) =
      __$$OnWithdrawClickedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnWithdrawClickedImplCopyWithImpl<$Res>
    extends _$ManageProfileEventCopyWithImpl<$Res, _$OnWithdrawClickedImpl>
    implements _$$OnWithdrawClickedImplCopyWith<$Res> {
  __$$OnWithdrawClickedImplCopyWithImpl(_$OnWithdrawClickedImpl _value,
      $Res Function(_$OnWithdrawClickedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnWithdrawClickedImpl implements _OnWithdrawClicked {
  const _$OnWithdrawClickedImpl();

  @override
  String toString() {
    return 'ManageProfileEvent.onWithdrawClicked()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnWithdrawClickedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadListTag,
    required TResult Function(bool status) setNotification,
    required TResult Function(User userUpdated) onProfileChanged,
    required TResult Function(User userUpdated) onChangeProfileClicked,
    required TResult Function(String reason) onOutReasonChange,
    required TResult Function() onWithdrawClicked,
  }) {
    return onWithdrawClicked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadListTag,
    TResult? Function(bool status)? setNotification,
    TResult? Function(User userUpdated)? onProfileChanged,
    TResult? Function(User userUpdated)? onChangeProfileClicked,
    TResult? Function(String reason)? onOutReasonChange,
    TResult? Function()? onWithdrawClicked,
  }) {
    return onWithdrawClicked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadListTag,
    TResult Function(bool status)? setNotification,
    TResult Function(User userUpdated)? onProfileChanged,
    TResult Function(User userUpdated)? onChangeProfileClicked,
    TResult Function(String reason)? onOutReasonChange,
    TResult Function()? onWithdrawClicked,
    required TResult orElse(),
  }) {
    if (onWithdrawClicked != null) {
      return onWithdrawClicked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadListTag value) loadListTag,
    required TResult Function(_SetNoti value) setNotification,
    required TResult Function(_ProfileChanged value) onProfileChanged,
    required TResult Function(_OnChangeProfileClicked value)
        onChangeProfileClicked,
    required TResult Function(OnChangeOutReason value) onOutReasonChange,
    required TResult Function(_OnWithdrawClicked value) onWithdrawClicked,
  }) {
    return onWithdrawClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadListTag value)? loadListTag,
    TResult? Function(_SetNoti value)? setNotification,
    TResult? Function(_ProfileChanged value)? onProfileChanged,
    TResult? Function(_OnChangeProfileClicked value)? onChangeProfileClicked,
    TResult? Function(OnChangeOutReason value)? onOutReasonChange,
    TResult? Function(_OnWithdrawClicked value)? onWithdrawClicked,
  }) {
    return onWithdrawClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadListTag value)? loadListTag,
    TResult Function(_SetNoti value)? setNotification,
    TResult Function(_ProfileChanged value)? onProfileChanged,
    TResult Function(_OnChangeProfileClicked value)? onChangeProfileClicked,
    TResult Function(OnChangeOutReason value)? onOutReasonChange,
    TResult Function(_OnWithdrawClicked value)? onWithdrawClicked,
    required TResult orElse(),
  }) {
    if (onWithdrawClicked != null) {
      return onWithdrawClicked(this);
    }
    return orElse();
  }
}

abstract class _OnWithdrawClicked implements ManageProfileEvent {
  const factory _OnWithdrawClicked() = _$OnWithdrawClickedImpl;
}
