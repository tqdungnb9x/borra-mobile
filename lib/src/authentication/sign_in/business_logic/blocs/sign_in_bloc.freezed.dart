// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignInState {
  InfoSignIn? get input => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInStateCopyWith<SignInState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
          SignInState value, $Res Function(SignInState) then) =
      _$SignInStateCopyWithImpl<$Res, SignInState>;
  @useResult
  $Res call({InfoSignIn? input, Status status});

  $StatusCopyWith<$Res> get status;
}

/// @nodoc
class _$SignInStateCopyWithImpl<$Res, $Val extends SignInState>
    implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? input = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      input: freezed == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as InfoSignIn?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
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
abstract class _$$SignInStateImplCopyWith<$Res>
    implements $SignInStateCopyWith<$Res> {
  factory _$$SignInStateImplCopyWith(
          _$SignInStateImpl value, $Res Function(_$SignInStateImpl) then) =
      __$$SignInStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({InfoSignIn? input, Status status});

  @override
  $StatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$SignInStateImplCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$SignInStateImpl>
    implements _$$SignInStateImplCopyWith<$Res> {
  __$$SignInStateImplCopyWithImpl(
      _$SignInStateImpl _value, $Res Function(_$SignInStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? input = freezed,
    Object? status = null,
  }) {
    return _then(_$SignInStateImpl(
      input: freezed == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as InfoSignIn?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$SignInStateImpl implements _SignInState {
  const _$SignInStateImpl({this.input, this.status = const Status.idle()});

  @override
  final InfoSignIn? input;
  @override
  @JsonKey()
  final Status status;

  @override
  String toString() {
    return 'SignInState(input: $input, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInStateImpl &&
            (identical(other.input, input) || other.input == input) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, input, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInStateImplCopyWith<_$SignInStateImpl> get copyWith =>
      __$$SignInStateImplCopyWithImpl<_$SignInStateImpl>(this, _$identity);
}

abstract class _SignInState implements SignInState {
  const factory _SignInState({final InfoSignIn? input, final Status status}) =
      _$SignInStateImpl;

  @override
  InfoSignIn? get input;
  @override
  Status get status;
  @override
  @JsonKey(ignore: true)
  _$$SignInStateImplCopyWith<_$SignInStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignInEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clicked,
    required TResult Function(InfoSignIn newInput) inputChanged,
    required TResult Function() signInWithApple,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clicked,
    TResult? Function(InfoSignIn newInput)? inputChanged,
    TResult? Function()? signInWithApple,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clicked,
    TResult Function(InfoSignIn newInput)? inputChanged,
    TResult Function()? signInWithApple,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Clicked value) clicked,
    required TResult Function(_InputChanged value) inputChanged,
    required TResult Function(SignInApple value) signInWithApple,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Clicked value)? clicked,
    TResult? Function(_InputChanged value)? inputChanged,
    TResult? Function(SignInApple value)? signInWithApple,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Clicked value)? clicked,
    TResult Function(_InputChanged value)? inputChanged,
    TResult Function(SignInApple value)? signInWithApple,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInEventCopyWith<$Res> {
  factory $SignInEventCopyWith(
          SignInEvent value, $Res Function(SignInEvent) then) =
      _$SignInEventCopyWithImpl<$Res, SignInEvent>;
}

/// @nodoc
class _$SignInEventCopyWithImpl<$Res, $Val extends SignInEvent>
    implements $SignInEventCopyWith<$Res> {
  _$SignInEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ClickedImplCopyWith<$Res> {
  factory _$$ClickedImplCopyWith(
          _$ClickedImpl value, $Res Function(_$ClickedImpl) then) =
      __$$ClickedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClickedImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$ClickedImpl>
    implements _$$ClickedImplCopyWith<$Res> {
  __$$ClickedImplCopyWithImpl(
      _$ClickedImpl _value, $Res Function(_$ClickedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClickedImpl implements _Clicked {
  const _$ClickedImpl();

  @override
  String toString() {
    return 'SignInEvent.clicked()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClickedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clicked,
    required TResult Function(InfoSignIn newInput) inputChanged,
    required TResult Function() signInWithApple,
  }) {
    return clicked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clicked,
    TResult? Function(InfoSignIn newInput)? inputChanged,
    TResult? Function()? signInWithApple,
  }) {
    return clicked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clicked,
    TResult Function(InfoSignIn newInput)? inputChanged,
    TResult Function()? signInWithApple,
    required TResult orElse(),
  }) {
    if (clicked != null) {
      return clicked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Clicked value) clicked,
    required TResult Function(_InputChanged value) inputChanged,
    required TResult Function(SignInApple value) signInWithApple,
  }) {
    return clicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Clicked value)? clicked,
    TResult? Function(_InputChanged value)? inputChanged,
    TResult? Function(SignInApple value)? signInWithApple,
  }) {
    return clicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Clicked value)? clicked,
    TResult Function(_InputChanged value)? inputChanged,
    TResult Function(SignInApple value)? signInWithApple,
    required TResult orElse(),
  }) {
    if (clicked != null) {
      return clicked(this);
    }
    return orElse();
  }
}

abstract class _Clicked implements SignInEvent {
  const factory _Clicked() = _$ClickedImpl;
}

/// @nodoc
abstract class _$$InputChangedImplCopyWith<$Res> {
  factory _$$InputChangedImplCopyWith(
          _$InputChangedImpl value, $Res Function(_$InputChangedImpl) then) =
      __$$InputChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({InfoSignIn newInput});
}

/// @nodoc
class __$$InputChangedImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$InputChangedImpl>
    implements _$$InputChangedImplCopyWith<$Res> {
  __$$InputChangedImplCopyWithImpl(
      _$InputChangedImpl _value, $Res Function(_$InputChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newInput = null,
  }) {
    return _then(_$InputChangedImpl(
      null == newInput
          ? _value.newInput
          : newInput // ignore: cast_nullable_to_non_nullable
              as InfoSignIn,
    ));
  }
}

/// @nodoc

class _$InputChangedImpl implements _InputChanged {
  const _$InputChangedImpl(this.newInput);

  @override
  final InfoSignIn newInput;

  @override
  String toString() {
    return 'SignInEvent.inputChanged(newInput: $newInput)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputChangedImpl &&
            (identical(other.newInput, newInput) ||
                other.newInput == newInput));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newInput);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InputChangedImplCopyWith<_$InputChangedImpl> get copyWith =>
      __$$InputChangedImplCopyWithImpl<_$InputChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clicked,
    required TResult Function(InfoSignIn newInput) inputChanged,
    required TResult Function() signInWithApple,
  }) {
    return inputChanged(newInput);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clicked,
    TResult? Function(InfoSignIn newInput)? inputChanged,
    TResult? Function()? signInWithApple,
  }) {
    return inputChanged?.call(newInput);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clicked,
    TResult Function(InfoSignIn newInput)? inputChanged,
    TResult Function()? signInWithApple,
    required TResult orElse(),
  }) {
    if (inputChanged != null) {
      return inputChanged(newInput);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Clicked value) clicked,
    required TResult Function(_InputChanged value) inputChanged,
    required TResult Function(SignInApple value) signInWithApple,
  }) {
    return inputChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Clicked value)? clicked,
    TResult? Function(_InputChanged value)? inputChanged,
    TResult? Function(SignInApple value)? signInWithApple,
  }) {
    return inputChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Clicked value)? clicked,
    TResult Function(_InputChanged value)? inputChanged,
    TResult Function(SignInApple value)? signInWithApple,
    required TResult orElse(),
  }) {
    if (inputChanged != null) {
      return inputChanged(this);
    }
    return orElse();
  }
}

abstract class _InputChanged implements SignInEvent {
  const factory _InputChanged(final InfoSignIn newInput) = _$InputChangedImpl;

  InfoSignIn get newInput;
  @JsonKey(ignore: true)
  _$$InputChangedImplCopyWith<_$InputChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignInAppleImplCopyWith<$Res> {
  factory _$$SignInAppleImplCopyWith(
          _$SignInAppleImpl value, $Res Function(_$SignInAppleImpl) then) =
      __$$SignInAppleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInAppleImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$SignInAppleImpl>
    implements _$$SignInAppleImplCopyWith<$Res> {
  __$$SignInAppleImplCopyWithImpl(
      _$SignInAppleImpl _value, $Res Function(_$SignInAppleImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignInAppleImpl implements SignInApple {
  const _$SignInAppleImpl();

  @override
  String toString() {
    return 'SignInEvent.signInWithApple()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignInAppleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() clicked,
    required TResult Function(InfoSignIn newInput) inputChanged,
    required TResult Function() signInWithApple,
  }) {
    return signInWithApple();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? clicked,
    TResult? Function(InfoSignIn newInput)? inputChanged,
    TResult? Function()? signInWithApple,
  }) {
    return signInWithApple?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? clicked,
    TResult Function(InfoSignIn newInput)? inputChanged,
    TResult Function()? signInWithApple,
    required TResult orElse(),
  }) {
    if (signInWithApple != null) {
      return signInWithApple();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Clicked value) clicked,
    required TResult Function(_InputChanged value) inputChanged,
    required TResult Function(SignInApple value) signInWithApple,
  }) {
    return signInWithApple(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Clicked value)? clicked,
    TResult? Function(_InputChanged value)? inputChanged,
    TResult? Function(SignInApple value)? signInWithApple,
  }) {
    return signInWithApple?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Clicked value)? clicked,
    TResult Function(_InputChanged value)? inputChanged,
    TResult Function(SignInApple value)? signInWithApple,
    required TResult orElse(),
  }) {
    if (signInWithApple != null) {
      return signInWithApple(this);
    }
    return orElse();
  }
}

abstract class SignInApple implements SignInEvent {
  const factory SignInApple() = _$SignInAppleImpl;
}
