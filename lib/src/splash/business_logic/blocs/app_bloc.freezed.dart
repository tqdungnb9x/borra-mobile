// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool input) setOpenedDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool input)? setOpenedDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool input)? setOpenedDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppEventInitial value) initial,
    required TResult Function(AppEventSetOpen value) setOpenedDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppEventInitial value)? initial,
    TResult? Function(AppEventSetOpen value)? setOpenedDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppEventInitial value)? initial,
    TResult Function(AppEventSetOpen value)? setOpenedDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEventCopyWith<$Res> {
  factory $AppEventCopyWith(AppEvent value, $Res Function(AppEvent) then) =
      _$AppEventCopyWithImpl<$Res, AppEvent>;
}

/// @nodoc
class _$AppEventCopyWithImpl<$Res, $Val extends AppEvent>
    implements $AppEventCopyWith<$Res> {
  _$AppEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AppEventInitialImplCopyWith<$Res> {
  factory _$$AppEventInitialImplCopyWith(_$AppEventInitialImpl value,
          $Res Function(_$AppEventInitialImpl) then) =
      __$$AppEventInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppEventInitialImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$AppEventInitialImpl>
    implements _$$AppEventInitialImplCopyWith<$Res> {
  __$$AppEventInitialImplCopyWithImpl(
      _$AppEventInitialImpl _value, $Res Function(_$AppEventInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppEventInitialImpl implements AppEventInitial {
  const _$AppEventInitialImpl();

  @override
  String toString() {
    return 'AppEvent.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppEventInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool input) setOpenedDetail,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool input)? setOpenedDetail,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool input)? setOpenedDetail,
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
    required TResult Function(AppEventInitial value) initial,
    required TResult Function(AppEventSetOpen value) setOpenedDetail,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppEventInitial value)? initial,
    TResult? Function(AppEventSetOpen value)? setOpenedDetail,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppEventInitial value)? initial,
    TResult Function(AppEventSetOpen value)? setOpenedDetail,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AppEventInitial implements AppEvent {
  const factory AppEventInitial() = _$AppEventInitialImpl;
}

/// @nodoc
abstract class _$$AppEventSetOpenImplCopyWith<$Res> {
  factory _$$AppEventSetOpenImplCopyWith(_$AppEventSetOpenImpl value,
          $Res Function(_$AppEventSetOpenImpl) then) =
      __$$AppEventSetOpenImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool input});
}

/// @nodoc
class __$$AppEventSetOpenImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$AppEventSetOpenImpl>
    implements _$$AppEventSetOpenImplCopyWith<$Res> {
  __$$AppEventSetOpenImplCopyWithImpl(
      _$AppEventSetOpenImpl _value, $Res Function(_$AppEventSetOpenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? input = null,
  }) {
    return _then(_$AppEventSetOpenImpl(
      null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AppEventSetOpenImpl implements AppEventSetOpen {
  const _$AppEventSetOpenImpl(this.input);

  @override
  final bool input;

  @override
  String toString() {
    return 'AppEvent.setOpenedDetail(input: $input)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppEventSetOpenImpl &&
            (identical(other.input, input) || other.input == input));
  }

  @override
  int get hashCode => Object.hash(runtimeType, input);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppEventSetOpenImplCopyWith<_$AppEventSetOpenImpl> get copyWith =>
      __$$AppEventSetOpenImplCopyWithImpl<_$AppEventSetOpenImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool input) setOpenedDetail,
  }) {
    return setOpenedDetail(input);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool input)? setOpenedDetail,
  }) {
    return setOpenedDetail?.call(input);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool input)? setOpenedDetail,
    required TResult orElse(),
  }) {
    if (setOpenedDetail != null) {
      return setOpenedDetail(input);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppEventInitial value) initial,
    required TResult Function(AppEventSetOpen value) setOpenedDetail,
  }) {
    return setOpenedDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppEventInitial value)? initial,
    TResult? Function(AppEventSetOpen value)? setOpenedDetail,
  }) {
    return setOpenedDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppEventInitial value)? initial,
    TResult Function(AppEventSetOpen value)? setOpenedDetail,
    required TResult orElse(),
  }) {
    if (setOpenedDetail != null) {
      return setOpenedDetail(this);
    }
    return orElse();
  }
}

abstract class AppEventSetOpen implements AppEvent {
  const factory AppEventSetOpen(final bool input) = _$AppEventSetOpenImpl;

  bool get input;
  @JsonKey(ignore: true)
  _$$AppEventSetOpenImplCopyWith<_$AppEventSetOpenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppState {
  Locale get locale => throw _privateConstructorUsedError;
  ThemeMode get mode => throw _privateConstructorUsedError;
  bool get hasCredential => throw _privateConstructorUsedError;
  AppModel get appModel => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  List<AppTag> get listTags => throw _privateConstructorUsedError;
  bool get isContentDetailOpen => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {Locale locale,
      ThemeMode mode,
      bool hasCredential,
      AppModel appModel,
      Status status,
      List<AppTag> listTags,
      bool isContentDetailOpen});

  $StatusCopyWith<$Res> get status;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
    Object? mode = null,
    Object? hasCredential = null,
    Object? appModel = null,
    Object? status = null,
    Object? listTags = null,
    Object? isContentDetailOpen = null,
  }) {
    return _then(_value.copyWith(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      hasCredential: null == hasCredential
          ? _value.hasCredential
          : hasCredential // ignore: cast_nullable_to_non_nullable
              as bool,
      appModel: null == appModel
          ? _value.appModel
          : appModel // ignore: cast_nullable_to_non_nullable
              as AppModel,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      listTags: null == listTags
          ? _value.listTags
          : listTags // ignore: cast_nullable_to_non_nullable
              as List<AppTag>,
      isContentDetailOpen: null == isContentDetailOpen
          ? _value.isContentDetailOpen
          : isContentDetailOpen // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$AppStateImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$AppStateImplCopyWith(
          _$AppStateImpl value, $Res Function(_$AppStateImpl) then) =
      __$$AppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Locale locale,
      ThemeMode mode,
      bool hasCredential,
      AppModel appModel,
      Status status,
      List<AppTag> listTags,
      bool isContentDetailOpen});

  @override
  $StatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$AppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateImpl>
    implements _$$AppStateImplCopyWith<$Res> {
  __$$AppStateImplCopyWithImpl(
      _$AppStateImpl _value, $Res Function(_$AppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
    Object? mode = null,
    Object? hasCredential = null,
    Object? appModel = null,
    Object? status = null,
    Object? listTags = null,
    Object? isContentDetailOpen = null,
  }) {
    return _then(_$AppStateImpl(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      hasCredential: null == hasCredential
          ? _value.hasCredential
          : hasCredential // ignore: cast_nullable_to_non_nullable
              as bool,
      appModel: null == appModel
          ? _value.appModel
          : appModel // ignore: cast_nullable_to_non_nullable
              as AppModel,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      listTags: null == listTags
          ? _value._listTags
          : listTags // ignore: cast_nullable_to_non_nullable
              as List<AppTag>,
      isContentDetailOpen: null == isContentDetailOpen
          ? _value.isContentDetailOpen
          : isContentDetailOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AppStateImpl implements _AppState {
  const _$AppStateImpl(
      {required this.locale,
      required this.mode,
      required this.hasCredential,
      required this.appModel,
      this.status = const Status.idle(),
      final List<AppTag> listTags = const [],
      this.isContentDetailOpen = false})
      : _listTags = listTags;

  @override
  final Locale locale;
  @override
  final ThemeMode mode;
  @override
  final bool hasCredential;
  @override
  final AppModel appModel;
  @override
  @JsonKey()
  final Status status;
  final List<AppTag> _listTags;
  @override
  @JsonKey()
  List<AppTag> get listTags {
    if (_listTags is EqualUnmodifiableListView) return _listTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listTags);
  }

  @override
  @JsonKey()
  final bool isContentDetailOpen;

  @override
  String toString() {
    return 'AppState(locale: $locale, mode: $mode, hasCredential: $hasCredential, appModel: $appModel, status: $status, listTags: $listTags, isContentDetailOpen: $isContentDetailOpen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateImpl &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.hasCredential, hasCredential) ||
                other.hasCredential == hasCredential) &&
            (identical(other.appModel, appModel) ||
                other.appModel == appModel) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._listTags, _listTags) &&
            (identical(other.isContentDetailOpen, isContentDetailOpen) ||
                other.isContentDetailOpen == isContentDetailOpen));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      locale,
      mode,
      hasCredential,
      appModel,
      status,
      const DeepCollectionEquality().hash(_listTags),
      isContentDetailOpen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      __$$AppStateImplCopyWithImpl<_$AppStateImpl>(this, _$identity);
}

abstract class _AppState implements AppState {
  const factory _AppState(
      {required final Locale locale,
      required final ThemeMode mode,
      required final bool hasCredential,
      required final AppModel appModel,
      final Status status,
      final List<AppTag> listTags,
      final bool isContentDetailOpen}) = _$AppStateImpl;

  @override
  Locale get locale;
  @override
  ThemeMode get mode;
  @override
  bool get hasCredential;
  @override
  AppModel get appModel;
  @override
  Status get status;
  @override
  List<AppTag> get listTags;
  @override
  bool get isContentDetailOpen;
  @override
  @JsonKey(ignore: true)
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
