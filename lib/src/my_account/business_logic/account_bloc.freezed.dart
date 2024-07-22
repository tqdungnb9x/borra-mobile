// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountState {
  Status get status => throw _privateConstructorUsedError;
  Status get statusUpdateProfile => throw _privateConstructorUsedError;
  List<UserContent>? get listLikedContent => throw _privateConstructorUsedError;
  List<UserContent>? get listReplaysContent =>
      throw _privateConstructorUsedError;
  List<UserLikedContent>? get listUserLiked =>
      throw _privateConstructorUsedError;
  List<UserLikedContent>? get listUserReplays =>
      throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  List<int> get listLikedId => throw _privateConstructorUsedError;
  List<AppTag>? get listTag => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountStateCopyWith<AccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountStateCopyWith<$Res> {
  factory $AccountStateCopyWith(
          AccountState value, $Res Function(AccountState) then) =
      _$AccountStateCopyWithImpl<$Res, AccountState>;
  @useResult
  $Res call(
      {Status status,
      Status statusUpdateProfile,
      List<UserContent>? listLikedContent,
      List<UserContent>? listReplaysContent,
      List<UserLikedContent>? listUserLiked,
      List<UserLikedContent>? listUserReplays,
      int page,
      int pageSize,
      List<int> listLikedId,
      List<AppTag>? listTag});

  $StatusCopyWith<$Res> get status;
  $StatusCopyWith<$Res> get statusUpdateProfile;
}

/// @nodoc
class _$AccountStateCopyWithImpl<$Res, $Val extends AccountState>
    implements $AccountStateCopyWith<$Res> {
  _$AccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusUpdateProfile = null,
    Object? listLikedContent = freezed,
    Object? listReplaysContent = freezed,
    Object? listUserLiked = freezed,
    Object? listUserReplays = freezed,
    Object? page = null,
    Object? pageSize = null,
    Object? listLikedId = null,
    Object? listTag = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      statusUpdateProfile: null == statusUpdateProfile
          ? _value.statusUpdateProfile
          : statusUpdateProfile // ignore: cast_nullable_to_non_nullable
              as Status,
      listLikedContent: freezed == listLikedContent
          ? _value.listLikedContent
          : listLikedContent // ignore: cast_nullable_to_non_nullable
              as List<UserContent>?,
      listReplaysContent: freezed == listReplaysContent
          ? _value.listReplaysContent
          : listReplaysContent // ignore: cast_nullable_to_non_nullable
              as List<UserContent>?,
      listUserLiked: freezed == listUserLiked
          ? _value.listUserLiked
          : listUserLiked // ignore: cast_nullable_to_non_nullable
              as List<UserLikedContent>?,
      listUserReplays: freezed == listUserReplays
          ? _value.listUserReplays
          : listUserReplays // ignore: cast_nullable_to_non_nullable
              as List<UserLikedContent>?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      listLikedId: null == listLikedId
          ? _value.listLikedId
          : listLikedId // ignore: cast_nullable_to_non_nullable
              as List<int>,
      listTag: freezed == listTag
          ? _value.listTag
          : listTag // ignore: cast_nullable_to_non_nullable
              as List<AppTag>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get status {
    return $StatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get statusUpdateProfile {
    return $StatusCopyWith<$Res>(_value.statusUpdateProfile, (value) {
      return _then(_value.copyWith(statusUpdateProfile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AccountStateImplCopyWith<$Res>
    implements $AccountStateCopyWith<$Res> {
  factory _$$AccountStateImplCopyWith(
          _$AccountStateImpl value, $Res Function(_$AccountStateImpl) then) =
      __$$AccountStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      Status statusUpdateProfile,
      List<UserContent>? listLikedContent,
      List<UserContent>? listReplaysContent,
      List<UserLikedContent>? listUserLiked,
      List<UserLikedContent>? listUserReplays,
      int page,
      int pageSize,
      List<int> listLikedId,
      List<AppTag>? listTag});

  @override
  $StatusCopyWith<$Res> get status;
  @override
  $StatusCopyWith<$Res> get statusUpdateProfile;
}

/// @nodoc
class __$$AccountStateImplCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$AccountStateImpl>
    implements _$$AccountStateImplCopyWith<$Res> {
  __$$AccountStateImplCopyWithImpl(
      _$AccountStateImpl _value, $Res Function(_$AccountStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusUpdateProfile = null,
    Object? listLikedContent = freezed,
    Object? listReplaysContent = freezed,
    Object? listUserLiked = freezed,
    Object? listUserReplays = freezed,
    Object? page = null,
    Object? pageSize = null,
    Object? listLikedId = null,
    Object? listTag = freezed,
  }) {
    return _then(_$AccountStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      statusUpdateProfile: null == statusUpdateProfile
          ? _value.statusUpdateProfile
          : statusUpdateProfile // ignore: cast_nullable_to_non_nullable
              as Status,
      listLikedContent: freezed == listLikedContent
          ? _value._listLikedContent
          : listLikedContent // ignore: cast_nullable_to_non_nullable
              as List<UserContent>?,
      listReplaysContent: freezed == listReplaysContent
          ? _value._listReplaysContent
          : listReplaysContent // ignore: cast_nullable_to_non_nullable
              as List<UserContent>?,
      listUserLiked: freezed == listUserLiked
          ? _value._listUserLiked
          : listUserLiked // ignore: cast_nullable_to_non_nullable
              as List<UserLikedContent>?,
      listUserReplays: freezed == listUserReplays
          ? _value._listUserReplays
          : listUserReplays // ignore: cast_nullable_to_non_nullable
              as List<UserLikedContent>?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      listLikedId: null == listLikedId
          ? _value._listLikedId
          : listLikedId // ignore: cast_nullable_to_non_nullable
              as List<int>,
      listTag: freezed == listTag
          ? _value._listTag
          : listTag // ignore: cast_nullable_to_non_nullable
              as List<AppTag>?,
    ));
  }
}

/// @nodoc

class _$AccountStateImpl implements _AccountState {
  const _$AccountStateImpl(
      {this.status = const Status.idle(),
      this.statusUpdateProfile = const Status.idle(),
      final List<UserContent>? listLikedContent,
      final List<UserContent>? listReplaysContent,
      final List<UserLikedContent>? listUserLiked,
      final List<UserLikedContent>? listUserReplays,
      this.page = 1,
      this.pageSize = 10,
      final List<int> listLikedId = const [],
      final List<AppTag>? listTag})
      : _listLikedContent = listLikedContent,
        _listReplaysContent = listReplaysContent,
        _listUserLiked = listUserLiked,
        _listUserReplays = listUserReplays,
        _listLikedId = listLikedId,
        _listTag = listTag;

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final Status statusUpdateProfile;
  final List<UserContent>? _listLikedContent;
  @override
  List<UserContent>? get listLikedContent {
    final value = _listLikedContent;
    if (value == null) return null;
    if (_listLikedContent is EqualUnmodifiableListView)
      return _listLikedContent;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<UserContent>? _listReplaysContent;
  @override
  List<UserContent>? get listReplaysContent {
    final value = _listReplaysContent;
    if (value == null) return null;
    if (_listReplaysContent is EqualUnmodifiableListView)
      return _listReplaysContent;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<UserLikedContent>? _listUserLiked;
  @override
  List<UserLikedContent>? get listUserLiked {
    final value = _listUserLiked;
    if (value == null) return null;
    if (_listUserLiked is EqualUnmodifiableListView) return _listUserLiked;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<UserLikedContent>? _listUserReplays;
  @override
  List<UserLikedContent>? get listUserReplays {
    final value = _listUserReplays;
    if (value == null) return null;
    if (_listUserReplays is EqualUnmodifiableListView) return _listUserReplays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int pageSize;
  final List<int> _listLikedId;
  @override
  @JsonKey()
  List<int> get listLikedId {
    if (_listLikedId is EqualUnmodifiableListView) return _listLikedId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listLikedId);
  }

  final List<AppTag>? _listTag;
  @override
  List<AppTag>? get listTag {
    final value = _listTag;
    if (value == null) return null;
    if (_listTag is EqualUnmodifiableListView) return _listTag;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AccountState(status: $status, statusUpdateProfile: $statusUpdateProfile, listLikedContent: $listLikedContent, listReplaysContent: $listReplaysContent, listUserLiked: $listUserLiked, listUserReplays: $listUserReplays, page: $page, pageSize: $pageSize, listLikedId: $listLikedId, listTag: $listTag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusUpdateProfile, statusUpdateProfile) ||
                other.statusUpdateProfile == statusUpdateProfile) &&
            const DeepCollectionEquality()
                .equals(other._listLikedContent, _listLikedContent) &&
            const DeepCollectionEquality()
                .equals(other._listReplaysContent, _listReplaysContent) &&
            const DeepCollectionEquality()
                .equals(other._listUserLiked, _listUserLiked) &&
            const DeepCollectionEquality()
                .equals(other._listUserReplays, _listUserReplays) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            const DeepCollectionEquality()
                .equals(other._listLikedId, _listLikedId) &&
            const DeepCollectionEquality().equals(other._listTag, _listTag));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      statusUpdateProfile,
      const DeepCollectionEquality().hash(_listLikedContent),
      const DeepCollectionEquality().hash(_listReplaysContent),
      const DeepCollectionEquality().hash(_listUserLiked),
      const DeepCollectionEquality().hash(_listUserReplays),
      page,
      pageSize,
      const DeepCollectionEquality().hash(_listLikedId),
      const DeepCollectionEquality().hash(_listTag));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountStateImplCopyWith<_$AccountStateImpl> get copyWith =>
      __$$AccountStateImplCopyWithImpl<_$AccountStateImpl>(this, _$identity);
}

abstract class _AccountState implements AccountState {
  const factory _AccountState(
      {final Status status,
      final Status statusUpdateProfile,
      final List<UserContent>? listLikedContent,
      final List<UserContent>? listReplaysContent,
      final List<UserLikedContent>? listUserLiked,
      final List<UserLikedContent>? listUserReplays,
      final int page,
      final int pageSize,
      final List<int> listLikedId,
      final List<AppTag>? listTag}) = _$AccountStateImpl;

  @override
  Status get status;
  @override
  Status get statusUpdateProfile;
  @override
  List<UserContent>? get listLikedContent;
  @override
  List<UserContent>? get listReplaysContent;
  @override
  List<UserLikedContent>? get listUserLiked;
  @override
  List<UserLikedContent>? get listUserReplays;
  @override
  int get page;
  @override
  int get pageSize;
  @override
  List<int> get listLikedId;
  @override
  List<AppTag>? get listTag;
  @override
  @JsonKey(ignore: true)
  _$$AccountStateImplCopyWith<_$AccountStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AccountEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadListLike,
    required TResult Function() loadListLikeMore,
    required TResult Function() loadListReplay,
    required TResult Function() loadListReplayMore,
    required TResult Function(List<int> ids) loadLikedIds,
    required TResult Function() loadListTag,
    required TResult Function(User user) updateProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadListLike,
    TResult? Function()? loadListLikeMore,
    TResult? Function()? loadListReplay,
    TResult? Function()? loadListReplayMore,
    TResult? Function(List<int> ids)? loadLikedIds,
    TResult? Function()? loadListTag,
    TResult? Function(User user)? updateProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadListLike,
    TResult Function()? loadListLikeMore,
    TResult Function()? loadListReplay,
    TResult Function()? loadListReplayMore,
    TResult Function(List<int> ids)? loadLikedIds,
    TResult Function()? loadListTag,
    TResult Function(User user)? updateProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadListLiked value) loadListLike,
    required TResult Function(_LoadListLikedMore value) loadListLikeMore,
    required TResult Function(_LoadListReplay value) loadListReplay,
    required TResult Function(_LoadListReplayMore value) loadListReplayMore,
    required TResult Function(_LoadLikedIds value) loadLikedIds,
    required TResult Function(_LoadListTag value) loadListTag,
    required TResult Function(_UpdateProfile value) updateProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadListLiked value)? loadListLike,
    TResult? Function(_LoadListLikedMore value)? loadListLikeMore,
    TResult? Function(_LoadListReplay value)? loadListReplay,
    TResult? Function(_LoadListReplayMore value)? loadListReplayMore,
    TResult? Function(_LoadLikedIds value)? loadLikedIds,
    TResult? Function(_LoadListTag value)? loadListTag,
    TResult? Function(_UpdateProfile value)? updateProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadListLiked value)? loadListLike,
    TResult Function(_LoadListLikedMore value)? loadListLikeMore,
    TResult Function(_LoadListReplay value)? loadListReplay,
    TResult Function(_LoadListReplayMore value)? loadListReplayMore,
    TResult Function(_LoadLikedIds value)? loadLikedIds,
    TResult Function(_LoadListTag value)? loadListTag,
    TResult Function(_UpdateProfile value)? updateProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountEventCopyWith<$Res> {
  factory $AccountEventCopyWith(
          AccountEvent value, $Res Function(AccountEvent) then) =
      _$AccountEventCopyWithImpl<$Res, AccountEvent>;
}

/// @nodoc
class _$AccountEventCopyWithImpl<$Res, $Val extends AccountEvent>
    implements $AccountEventCopyWith<$Res> {
  _$AccountEventCopyWithImpl(this._value, this._then);

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
    extends _$AccountEventCopyWithImpl<$Res, _$InitialImpl>
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
    return 'AccountEvent.initial()';
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
    required TResult Function() loadListLike,
    required TResult Function() loadListLikeMore,
    required TResult Function() loadListReplay,
    required TResult Function() loadListReplayMore,
    required TResult Function(List<int> ids) loadLikedIds,
    required TResult Function() loadListTag,
    required TResult Function(User user) updateProfile,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadListLike,
    TResult? Function()? loadListLikeMore,
    TResult? Function()? loadListReplay,
    TResult? Function()? loadListReplayMore,
    TResult? Function(List<int> ids)? loadLikedIds,
    TResult? Function()? loadListTag,
    TResult? Function(User user)? updateProfile,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadListLike,
    TResult Function()? loadListLikeMore,
    TResult Function()? loadListReplay,
    TResult Function()? loadListReplayMore,
    TResult Function(List<int> ids)? loadLikedIds,
    TResult Function()? loadListTag,
    TResult Function(User user)? updateProfile,
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
    required TResult Function(_LoadListLiked value) loadListLike,
    required TResult Function(_LoadListLikedMore value) loadListLikeMore,
    required TResult Function(_LoadListReplay value) loadListReplay,
    required TResult Function(_LoadListReplayMore value) loadListReplayMore,
    required TResult Function(_LoadLikedIds value) loadLikedIds,
    required TResult Function(_LoadListTag value) loadListTag,
    required TResult Function(_UpdateProfile value) updateProfile,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadListLiked value)? loadListLike,
    TResult? Function(_LoadListLikedMore value)? loadListLikeMore,
    TResult? Function(_LoadListReplay value)? loadListReplay,
    TResult? Function(_LoadListReplayMore value)? loadListReplayMore,
    TResult? Function(_LoadLikedIds value)? loadLikedIds,
    TResult? Function(_LoadListTag value)? loadListTag,
    TResult? Function(_UpdateProfile value)? updateProfile,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadListLiked value)? loadListLike,
    TResult Function(_LoadListLikedMore value)? loadListLikeMore,
    TResult Function(_LoadListReplay value)? loadListReplay,
    TResult Function(_LoadListReplayMore value)? loadListReplayMore,
    TResult Function(_LoadLikedIds value)? loadLikedIds,
    TResult Function(_LoadListTag value)? loadListTag,
    TResult Function(_UpdateProfile value)? updateProfile,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AccountEvent {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadListLikedImplCopyWith<$Res> {
  factory _$$LoadListLikedImplCopyWith(
          _$LoadListLikedImpl value, $Res Function(_$LoadListLikedImpl) then) =
      __$$LoadListLikedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadListLikedImplCopyWithImpl<$Res>
    extends _$AccountEventCopyWithImpl<$Res, _$LoadListLikedImpl>
    implements _$$LoadListLikedImplCopyWith<$Res> {
  __$$LoadListLikedImplCopyWithImpl(
      _$LoadListLikedImpl _value, $Res Function(_$LoadListLikedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadListLikedImpl implements _LoadListLiked {
  const _$LoadListLikedImpl();

  @override
  String toString() {
    return 'AccountEvent.loadListLike()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadListLikedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadListLike,
    required TResult Function() loadListLikeMore,
    required TResult Function() loadListReplay,
    required TResult Function() loadListReplayMore,
    required TResult Function(List<int> ids) loadLikedIds,
    required TResult Function() loadListTag,
    required TResult Function(User user) updateProfile,
  }) {
    return loadListLike();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadListLike,
    TResult? Function()? loadListLikeMore,
    TResult? Function()? loadListReplay,
    TResult? Function()? loadListReplayMore,
    TResult? Function(List<int> ids)? loadLikedIds,
    TResult? Function()? loadListTag,
    TResult? Function(User user)? updateProfile,
  }) {
    return loadListLike?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadListLike,
    TResult Function()? loadListLikeMore,
    TResult Function()? loadListReplay,
    TResult Function()? loadListReplayMore,
    TResult Function(List<int> ids)? loadLikedIds,
    TResult Function()? loadListTag,
    TResult Function(User user)? updateProfile,
    required TResult orElse(),
  }) {
    if (loadListLike != null) {
      return loadListLike();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadListLiked value) loadListLike,
    required TResult Function(_LoadListLikedMore value) loadListLikeMore,
    required TResult Function(_LoadListReplay value) loadListReplay,
    required TResult Function(_LoadListReplayMore value) loadListReplayMore,
    required TResult Function(_LoadLikedIds value) loadLikedIds,
    required TResult Function(_LoadListTag value) loadListTag,
    required TResult Function(_UpdateProfile value) updateProfile,
  }) {
    return loadListLike(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadListLiked value)? loadListLike,
    TResult? Function(_LoadListLikedMore value)? loadListLikeMore,
    TResult? Function(_LoadListReplay value)? loadListReplay,
    TResult? Function(_LoadListReplayMore value)? loadListReplayMore,
    TResult? Function(_LoadLikedIds value)? loadLikedIds,
    TResult? Function(_LoadListTag value)? loadListTag,
    TResult? Function(_UpdateProfile value)? updateProfile,
  }) {
    return loadListLike?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadListLiked value)? loadListLike,
    TResult Function(_LoadListLikedMore value)? loadListLikeMore,
    TResult Function(_LoadListReplay value)? loadListReplay,
    TResult Function(_LoadListReplayMore value)? loadListReplayMore,
    TResult Function(_LoadLikedIds value)? loadLikedIds,
    TResult Function(_LoadListTag value)? loadListTag,
    TResult Function(_UpdateProfile value)? updateProfile,
    required TResult orElse(),
  }) {
    if (loadListLike != null) {
      return loadListLike(this);
    }
    return orElse();
  }
}

abstract class _LoadListLiked implements AccountEvent {
  const factory _LoadListLiked() = _$LoadListLikedImpl;
}

/// @nodoc
abstract class _$$LoadListLikedMoreImplCopyWith<$Res> {
  factory _$$LoadListLikedMoreImplCopyWith(_$LoadListLikedMoreImpl value,
          $Res Function(_$LoadListLikedMoreImpl) then) =
      __$$LoadListLikedMoreImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadListLikedMoreImplCopyWithImpl<$Res>
    extends _$AccountEventCopyWithImpl<$Res, _$LoadListLikedMoreImpl>
    implements _$$LoadListLikedMoreImplCopyWith<$Res> {
  __$$LoadListLikedMoreImplCopyWithImpl(_$LoadListLikedMoreImpl _value,
      $Res Function(_$LoadListLikedMoreImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadListLikedMoreImpl implements _LoadListLikedMore {
  const _$LoadListLikedMoreImpl();

  @override
  String toString() {
    return 'AccountEvent.loadListLikeMore()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadListLikedMoreImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadListLike,
    required TResult Function() loadListLikeMore,
    required TResult Function() loadListReplay,
    required TResult Function() loadListReplayMore,
    required TResult Function(List<int> ids) loadLikedIds,
    required TResult Function() loadListTag,
    required TResult Function(User user) updateProfile,
  }) {
    return loadListLikeMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadListLike,
    TResult? Function()? loadListLikeMore,
    TResult? Function()? loadListReplay,
    TResult? Function()? loadListReplayMore,
    TResult? Function(List<int> ids)? loadLikedIds,
    TResult? Function()? loadListTag,
    TResult? Function(User user)? updateProfile,
  }) {
    return loadListLikeMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadListLike,
    TResult Function()? loadListLikeMore,
    TResult Function()? loadListReplay,
    TResult Function()? loadListReplayMore,
    TResult Function(List<int> ids)? loadLikedIds,
    TResult Function()? loadListTag,
    TResult Function(User user)? updateProfile,
    required TResult orElse(),
  }) {
    if (loadListLikeMore != null) {
      return loadListLikeMore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadListLiked value) loadListLike,
    required TResult Function(_LoadListLikedMore value) loadListLikeMore,
    required TResult Function(_LoadListReplay value) loadListReplay,
    required TResult Function(_LoadListReplayMore value) loadListReplayMore,
    required TResult Function(_LoadLikedIds value) loadLikedIds,
    required TResult Function(_LoadListTag value) loadListTag,
    required TResult Function(_UpdateProfile value) updateProfile,
  }) {
    return loadListLikeMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadListLiked value)? loadListLike,
    TResult? Function(_LoadListLikedMore value)? loadListLikeMore,
    TResult? Function(_LoadListReplay value)? loadListReplay,
    TResult? Function(_LoadListReplayMore value)? loadListReplayMore,
    TResult? Function(_LoadLikedIds value)? loadLikedIds,
    TResult? Function(_LoadListTag value)? loadListTag,
    TResult? Function(_UpdateProfile value)? updateProfile,
  }) {
    return loadListLikeMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadListLiked value)? loadListLike,
    TResult Function(_LoadListLikedMore value)? loadListLikeMore,
    TResult Function(_LoadListReplay value)? loadListReplay,
    TResult Function(_LoadListReplayMore value)? loadListReplayMore,
    TResult Function(_LoadLikedIds value)? loadLikedIds,
    TResult Function(_LoadListTag value)? loadListTag,
    TResult Function(_UpdateProfile value)? updateProfile,
    required TResult orElse(),
  }) {
    if (loadListLikeMore != null) {
      return loadListLikeMore(this);
    }
    return orElse();
  }
}

abstract class _LoadListLikedMore implements AccountEvent {
  const factory _LoadListLikedMore() = _$LoadListLikedMoreImpl;
}

/// @nodoc
abstract class _$$LoadListReplayImplCopyWith<$Res> {
  factory _$$LoadListReplayImplCopyWith(_$LoadListReplayImpl value,
          $Res Function(_$LoadListReplayImpl) then) =
      __$$LoadListReplayImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadListReplayImplCopyWithImpl<$Res>
    extends _$AccountEventCopyWithImpl<$Res, _$LoadListReplayImpl>
    implements _$$LoadListReplayImplCopyWith<$Res> {
  __$$LoadListReplayImplCopyWithImpl(
      _$LoadListReplayImpl _value, $Res Function(_$LoadListReplayImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadListReplayImpl implements _LoadListReplay {
  const _$LoadListReplayImpl();

  @override
  String toString() {
    return 'AccountEvent.loadListReplay()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadListReplayImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadListLike,
    required TResult Function() loadListLikeMore,
    required TResult Function() loadListReplay,
    required TResult Function() loadListReplayMore,
    required TResult Function(List<int> ids) loadLikedIds,
    required TResult Function() loadListTag,
    required TResult Function(User user) updateProfile,
  }) {
    return loadListReplay();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadListLike,
    TResult? Function()? loadListLikeMore,
    TResult? Function()? loadListReplay,
    TResult? Function()? loadListReplayMore,
    TResult? Function(List<int> ids)? loadLikedIds,
    TResult? Function()? loadListTag,
    TResult? Function(User user)? updateProfile,
  }) {
    return loadListReplay?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadListLike,
    TResult Function()? loadListLikeMore,
    TResult Function()? loadListReplay,
    TResult Function()? loadListReplayMore,
    TResult Function(List<int> ids)? loadLikedIds,
    TResult Function()? loadListTag,
    TResult Function(User user)? updateProfile,
    required TResult orElse(),
  }) {
    if (loadListReplay != null) {
      return loadListReplay();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadListLiked value) loadListLike,
    required TResult Function(_LoadListLikedMore value) loadListLikeMore,
    required TResult Function(_LoadListReplay value) loadListReplay,
    required TResult Function(_LoadListReplayMore value) loadListReplayMore,
    required TResult Function(_LoadLikedIds value) loadLikedIds,
    required TResult Function(_LoadListTag value) loadListTag,
    required TResult Function(_UpdateProfile value) updateProfile,
  }) {
    return loadListReplay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadListLiked value)? loadListLike,
    TResult? Function(_LoadListLikedMore value)? loadListLikeMore,
    TResult? Function(_LoadListReplay value)? loadListReplay,
    TResult? Function(_LoadListReplayMore value)? loadListReplayMore,
    TResult? Function(_LoadLikedIds value)? loadLikedIds,
    TResult? Function(_LoadListTag value)? loadListTag,
    TResult? Function(_UpdateProfile value)? updateProfile,
  }) {
    return loadListReplay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadListLiked value)? loadListLike,
    TResult Function(_LoadListLikedMore value)? loadListLikeMore,
    TResult Function(_LoadListReplay value)? loadListReplay,
    TResult Function(_LoadListReplayMore value)? loadListReplayMore,
    TResult Function(_LoadLikedIds value)? loadLikedIds,
    TResult Function(_LoadListTag value)? loadListTag,
    TResult Function(_UpdateProfile value)? updateProfile,
    required TResult orElse(),
  }) {
    if (loadListReplay != null) {
      return loadListReplay(this);
    }
    return orElse();
  }
}

abstract class _LoadListReplay implements AccountEvent {
  const factory _LoadListReplay() = _$LoadListReplayImpl;
}

/// @nodoc
abstract class _$$LoadListReplayMoreImplCopyWith<$Res> {
  factory _$$LoadListReplayMoreImplCopyWith(_$LoadListReplayMoreImpl value,
          $Res Function(_$LoadListReplayMoreImpl) then) =
      __$$LoadListReplayMoreImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadListReplayMoreImplCopyWithImpl<$Res>
    extends _$AccountEventCopyWithImpl<$Res, _$LoadListReplayMoreImpl>
    implements _$$LoadListReplayMoreImplCopyWith<$Res> {
  __$$LoadListReplayMoreImplCopyWithImpl(_$LoadListReplayMoreImpl _value,
      $Res Function(_$LoadListReplayMoreImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadListReplayMoreImpl implements _LoadListReplayMore {
  const _$LoadListReplayMoreImpl();

  @override
  String toString() {
    return 'AccountEvent.loadListReplayMore()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadListReplayMoreImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadListLike,
    required TResult Function() loadListLikeMore,
    required TResult Function() loadListReplay,
    required TResult Function() loadListReplayMore,
    required TResult Function(List<int> ids) loadLikedIds,
    required TResult Function() loadListTag,
    required TResult Function(User user) updateProfile,
  }) {
    return loadListReplayMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadListLike,
    TResult? Function()? loadListLikeMore,
    TResult? Function()? loadListReplay,
    TResult? Function()? loadListReplayMore,
    TResult? Function(List<int> ids)? loadLikedIds,
    TResult? Function()? loadListTag,
    TResult? Function(User user)? updateProfile,
  }) {
    return loadListReplayMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadListLike,
    TResult Function()? loadListLikeMore,
    TResult Function()? loadListReplay,
    TResult Function()? loadListReplayMore,
    TResult Function(List<int> ids)? loadLikedIds,
    TResult Function()? loadListTag,
    TResult Function(User user)? updateProfile,
    required TResult orElse(),
  }) {
    if (loadListReplayMore != null) {
      return loadListReplayMore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadListLiked value) loadListLike,
    required TResult Function(_LoadListLikedMore value) loadListLikeMore,
    required TResult Function(_LoadListReplay value) loadListReplay,
    required TResult Function(_LoadListReplayMore value) loadListReplayMore,
    required TResult Function(_LoadLikedIds value) loadLikedIds,
    required TResult Function(_LoadListTag value) loadListTag,
    required TResult Function(_UpdateProfile value) updateProfile,
  }) {
    return loadListReplayMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadListLiked value)? loadListLike,
    TResult? Function(_LoadListLikedMore value)? loadListLikeMore,
    TResult? Function(_LoadListReplay value)? loadListReplay,
    TResult? Function(_LoadListReplayMore value)? loadListReplayMore,
    TResult? Function(_LoadLikedIds value)? loadLikedIds,
    TResult? Function(_LoadListTag value)? loadListTag,
    TResult? Function(_UpdateProfile value)? updateProfile,
  }) {
    return loadListReplayMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadListLiked value)? loadListLike,
    TResult Function(_LoadListLikedMore value)? loadListLikeMore,
    TResult Function(_LoadListReplay value)? loadListReplay,
    TResult Function(_LoadListReplayMore value)? loadListReplayMore,
    TResult Function(_LoadLikedIds value)? loadLikedIds,
    TResult Function(_LoadListTag value)? loadListTag,
    TResult Function(_UpdateProfile value)? updateProfile,
    required TResult orElse(),
  }) {
    if (loadListReplayMore != null) {
      return loadListReplayMore(this);
    }
    return orElse();
  }
}

abstract class _LoadListReplayMore implements AccountEvent {
  const factory _LoadListReplayMore() = _$LoadListReplayMoreImpl;
}

/// @nodoc
abstract class _$$LoadLikedIdsImplCopyWith<$Res> {
  factory _$$LoadLikedIdsImplCopyWith(
          _$LoadLikedIdsImpl value, $Res Function(_$LoadLikedIdsImpl) then) =
      __$$LoadLikedIdsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<int> ids});
}

/// @nodoc
class __$$LoadLikedIdsImplCopyWithImpl<$Res>
    extends _$AccountEventCopyWithImpl<$Res, _$LoadLikedIdsImpl>
    implements _$$LoadLikedIdsImplCopyWith<$Res> {
  __$$LoadLikedIdsImplCopyWithImpl(
      _$LoadLikedIdsImpl _value, $Res Function(_$LoadLikedIdsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = null,
  }) {
    return _then(_$LoadLikedIdsImpl(
      null == ids
          ? _value._ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$LoadLikedIdsImpl implements _LoadLikedIds {
  const _$LoadLikedIdsImpl(final List<int> ids) : _ids = ids;

  final List<int> _ids;
  @override
  List<int> get ids {
    if (_ids is EqualUnmodifiableListView) return _ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ids);
  }

  @override
  String toString() {
    return 'AccountEvent.loadLikedIds(ids: $ids)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadLikedIdsImpl &&
            const DeepCollectionEquality().equals(other._ids, _ids));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_ids));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadLikedIdsImplCopyWith<_$LoadLikedIdsImpl> get copyWith =>
      __$$LoadLikedIdsImplCopyWithImpl<_$LoadLikedIdsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadListLike,
    required TResult Function() loadListLikeMore,
    required TResult Function() loadListReplay,
    required TResult Function() loadListReplayMore,
    required TResult Function(List<int> ids) loadLikedIds,
    required TResult Function() loadListTag,
    required TResult Function(User user) updateProfile,
  }) {
    return loadLikedIds(ids);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadListLike,
    TResult? Function()? loadListLikeMore,
    TResult? Function()? loadListReplay,
    TResult? Function()? loadListReplayMore,
    TResult? Function(List<int> ids)? loadLikedIds,
    TResult? Function()? loadListTag,
    TResult? Function(User user)? updateProfile,
  }) {
    return loadLikedIds?.call(ids);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadListLike,
    TResult Function()? loadListLikeMore,
    TResult Function()? loadListReplay,
    TResult Function()? loadListReplayMore,
    TResult Function(List<int> ids)? loadLikedIds,
    TResult Function()? loadListTag,
    TResult Function(User user)? updateProfile,
    required TResult orElse(),
  }) {
    if (loadLikedIds != null) {
      return loadLikedIds(ids);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadListLiked value) loadListLike,
    required TResult Function(_LoadListLikedMore value) loadListLikeMore,
    required TResult Function(_LoadListReplay value) loadListReplay,
    required TResult Function(_LoadListReplayMore value) loadListReplayMore,
    required TResult Function(_LoadLikedIds value) loadLikedIds,
    required TResult Function(_LoadListTag value) loadListTag,
    required TResult Function(_UpdateProfile value) updateProfile,
  }) {
    return loadLikedIds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadListLiked value)? loadListLike,
    TResult? Function(_LoadListLikedMore value)? loadListLikeMore,
    TResult? Function(_LoadListReplay value)? loadListReplay,
    TResult? Function(_LoadListReplayMore value)? loadListReplayMore,
    TResult? Function(_LoadLikedIds value)? loadLikedIds,
    TResult? Function(_LoadListTag value)? loadListTag,
    TResult? Function(_UpdateProfile value)? updateProfile,
  }) {
    return loadLikedIds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadListLiked value)? loadListLike,
    TResult Function(_LoadListLikedMore value)? loadListLikeMore,
    TResult Function(_LoadListReplay value)? loadListReplay,
    TResult Function(_LoadListReplayMore value)? loadListReplayMore,
    TResult Function(_LoadLikedIds value)? loadLikedIds,
    TResult Function(_LoadListTag value)? loadListTag,
    TResult Function(_UpdateProfile value)? updateProfile,
    required TResult orElse(),
  }) {
    if (loadLikedIds != null) {
      return loadLikedIds(this);
    }
    return orElse();
  }
}

abstract class _LoadLikedIds implements AccountEvent {
  const factory _LoadLikedIds(final List<int> ids) = _$LoadLikedIdsImpl;

  List<int> get ids;
  @JsonKey(ignore: true)
  _$$LoadLikedIdsImplCopyWith<_$LoadLikedIdsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadListTagImplCopyWith<$Res> {
  factory _$$LoadListTagImplCopyWith(
          _$LoadListTagImpl value, $Res Function(_$LoadListTagImpl) then) =
      __$$LoadListTagImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadListTagImplCopyWithImpl<$Res>
    extends _$AccountEventCopyWithImpl<$Res, _$LoadListTagImpl>
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
    return 'AccountEvent.loadListTag()';
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
    required TResult Function() loadListLike,
    required TResult Function() loadListLikeMore,
    required TResult Function() loadListReplay,
    required TResult Function() loadListReplayMore,
    required TResult Function(List<int> ids) loadLikedIds,
    required TResult Function() loadListTag,
    required TResult Function(User user) updateProfile,
  }) {
    return loadListTag();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadListLike,
    TResult? Function()? loadListLikeMore,
    TResult? Function()? loadListReplay,
    TResult? Function()? loadListReplayMore,
    TResult? Function(List<int> ids)? loadLikedIds,
    TResult? Function()? loadListTag,
    TResult? Function(User user)? updateProfile,
  }) {
    return loadListTag?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadListLike,
    TResult Function()? loadListLikeMore,
    TResult Function()? loadListReplay,
    TResult Function()? loadListReplayMore,
    TResult Function(List<int> ids)? loadLikedIds,
    TResult Function()? loadListTag,
    TResult Function(User user)? updateProfile,
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
    required TResult Function(_LoadListLiked value) loadListLike,
    required TResult Function(_LoadListLikedMore value) loadListLikeMore,
    required TResult Function(_LoadListReplay value) loadListReplay,
    required TResult Function(_LoadListReplayMore value) loadListReplayMore,
    required TResult Function(_LoadLikedIds value) loadLikedIds,
    required TResult Function(_LoadListTag value) loadListTag,
    required TResult Function(_UpdateProfile value) updateProfile,
  }) {
    return loadListTag(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadListLiked value)? loadListLike,
    TResult? Function(_LoadListLikedMore value)? loadListLikeMore,
    TResult? Function(_LoadListReplay value)? loadListReplay,
    TResult? Function(_LoadListReplayMore value)? loadListReplayMore,
    TResult? Function(_LoadLikedIds value)? loadLikedIds,
    TResult? Function(_LoadListTag value)? loadListTag,
    TResult? Function(_UpdateProfile value)? updateProfile,
  }) {
    return loadListTag?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadListLiked value)? loadListLike,
    TResult Function(_LoadListLikedMore value)? loadListLikeMore,
    TResult Function(_LoadListReplay value)? loadListReplay,
    TResult Function(_LoadListReplayMore value)? loadListReplayMore,
    TResult Function(_LoadLikedIds value)? loadLikedIds,
    TResult Function(_LoadListTag value)? loadListTag,
    TResult Function(_UpdateProfile value)? updateProfile,
    required TResult orElse(),
  }) {
    if (loadListTag != null) {
      return loadListTag(this);
    }
    return orElse();
  }
}

abstract class _LoadListTag implements AccountEvent {
  const factory _LoadListTag() = _$LoadListTagImpl;
}

/// @nodoc
abstract class _$$UpdateProfileImplCopyWith<$Res> {
  factory _$$UpdateProfileImplCopyWith(
          _$UpdateProfileImpl value, $Res Function(_$UpdateProfileImpl) then) =
      __$$UpdateProfileImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});
}

/// @nodoc
class __$$UpdateProfileImplCopyWithImpl<$Res>
    extends _$AccountEventCopyWithImpl<$Res, _$UpdateProfileImpl>
    implements _$$UpdateProfileImplCopyWith<$Res> {
  __$$UpdateProfileImplCopyWithImpl(
      _$UpdateProfileImpl _value, $Res Function(_$UpdateProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$UpdateProfileImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$UpdateProfileImpl implements _UpdateProfile {
  const _$UpdateProfileImpl(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'AccountEvent.updateProfile(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProfileImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProfileImplCopyWith<_$UpdateProfileImpl> get copyWith =>
      __$$UpdateProfileImplCopyWithImpl<_$UpdateProfileImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadListLike,
    required TResult Function() loadListLikeMore,
    required TResult Function() loadListReplay,
    required TResult Function() loadListReplayMore,
    required TResult Function(List<int> ids) loadLikedIds,
    required TResult Function() loadListTag,
    required TResult Function(User user) updateProfile,
  }) {
    return updateProfile(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadListLike,
    TResult? Function()? loadListLikeMore,
    TResult? Function()? loadListReplay,
    TResult? Function()? loadListReplayMore,
    TResult? Function(List<int> ids)? loadLikedIds,
    TResult? Function()? loadListTag,
    TResult? Function(User user)? updateProfile,
  }) {
    return updateProfile?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadListLike,
    TResult Function()? loadListLikeMore,
    TResult Function()? loadListReplay,
    TResult Function()? loadListReplayMore,
    TResult Function(List<int> ids)? loadLikedIds,
    TResult Function()? loadListTag,
    TResult Function(User user)? updateProfile,
    required TResult orElse(),
  }) {
    if (updateProfile != null) {
      return updateProfile(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadListLiked value) loadListLike,
    required TResult Function(_LoadListLikedMore value) loadListLikeMore,
    required TResult Function(_LoadListReplay value) loadListReplay,
    required TResult Function(_LoadListReplayMore value) loadListReplayMore,
    required TResult Function(_LoadLikedIds value) loadLikedIds,
    required TResult Function(_LoadListTag value) loadListTag,
    required TResult Function(_UpdateProfile value) updateProfile,
  }) {
    return updateProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadListLiked value)? loadListLike,
    TResult? Function(_LoadListLikedMore value)? loadListLikeMore,
    TResult? Function(_LoadListReplay value)? loadListReplay,
    TResult? Function(_LoadListReplayMore value)? loadListReplayMore,
    TResult? Function(_LoadLikedIds value)? loadLikedIds,
    TResult? Function(_LoadListTag value)? loadListTag,
    TResult? Function(_UpdateProfile value)? updateProfile,
  }) {
    return updateProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadListLiked value)? loadListLike,
    TResult Function(_LoadListLikedMore value)? loadListLikeMore,
    TResult Function(_LoadListReplay value)? loadListReplay,
    TResult Function(_LoadListReplayMore value)? loadListReplayMore,
    TResult Function(_LoadLikedIds value)? loadLikedIds,
    TResult Function(_LoadListTag value)? loadListTag,
    TResult Function(_UpdateProfile value)? updateProfile,
    required TResult orElse(),
  }) {
    if (updateProfile != null) {
      return updateProfile(this);
    }
    return orElse();
  }
}

abstract class _UpdateProfile implements AccountEvent {
  const factory _UpdateProfile(final User user) = _$UpdateProfileImpl;

  User get user;
  @JsonKey(ignore: true)
  _$$UpdateProfileImplCopyWith<_$UpdateProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
