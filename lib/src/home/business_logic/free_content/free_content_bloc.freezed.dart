// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'free_content_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FreeContentState {
  Status get status => throw _privateConstructorUsedError;
  Status get loadStatus => throw _privateConstructorUsedError;
  List<LikeContent> get listFreeContent => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FreeContentStateCopyWith<FreeContentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreeContentStateCopyWith<$Res> {
  factory $FreeContentStateCopyWith(
          FreeContentState value, $Res Function(FreeContentState) then) =
      _$FreeContentStateCopyWithImpl<$Res, FreeContentState>;
  @useResult
  $Res call(
      {Status status,
      Status loadStatus,
      List<LikeContent> listFreeContent,
      int page,
      int pageSize});

  $StatusCopyWith<$Res> get status;
  $StatusCopyWith<$Res> get loadStatus;
}

/// @nodoc
class _$FreeContentStateCopyWithImpl<$Res, $Val extends FreeContentState>
    implements $FreeContentStateCopyWith<$Res> {
  _$FreeContentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? loadStatus = null,
    Object? listFreeContent = null,
    Object? page = null,
    Object? pageSize = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      loadStatus: null == loadStatus
          ? _value.loadStatus
          : loadStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      listFreeContent: null == listFreeContent
          ? _value.listFreeContent
          : listFreeContent // ignore: cast_nullable_to_non_nullable
              as List<LikeContent>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
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
  $StatusCopyWith<$Res> get loadStatus {
    return $StatusCopyWith<$Res>(_value.loadStatus, (value) {
      return _then(_value.copyWith(loadStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FreeContentStateImplCopyWith<$Res>
    implements $FreeContentStateCopyWith<$Res> {
  factory _$$FreeContentStateImplCopyWith(_$FreeContentStateImpl value,
          $Res Function(_$FreeContentStateImpl) then) =
      __$$FreeContentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      Status loadStatus,
      List<LikeContent> listFreeContent,
      int page,
      int pageSize});

  @override
  $StatusCopyWith<$Res> get status;
  @override
  $StatusCopyWith<$Res> get loadStatus;
}

/// @nodoc
class __$$FreeContentStateImplCopyWithImpl<$Res>
    extends _$FreeContentStateCopyWithImpl<$Res, _$FreeContentStateImpl>
    implements _$$FreeContentStateImplCopyWith<$Res> {
  __$$FreeContentStateImplCopyWithImpl(_$FreeContentStateImpl _value,
      $Res Function(_$FreeContentStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? loadStatus = null,
    Object? listFreeContent = null,
    Object? page = null,
    Object? pageSize = null,
  }) {
    return _then(_$FreeContentStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      loadStatus: null == loadStatus
          ? _value.loadStatus
          : loadStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      listFreeContent: null == listFreeContent
          ? _value._listFreeContent
          : listFreeContent // ignore: cast_nullable_to_non_nullable
              as List<LikeContent>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FreeContentStateImpl implements _FreeContentState {
  const _$FreeContentStateImpl(
      {this.status = const Status.idle(),
      this.loadStatus = const Status.idle(),
      final List<LikeContent> listFreeContent = const [],
      this.page = 1,
      this.pageSize = 10})
      : _listFreeContent = listFreeContent;

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final Status loadStatus;
  final List<LikeContent> _listFreeContent;
  @override
  @JsonKey()
  List<LikeContent> get listFreeContent {
    if (_listFreeContent is EqualUnmodifiableListView) return _listFreeContent;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listFreeContent);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int pageSize;

  @override
  String toString() {
    return 'FreeContentState(status: $status, loadStatus: $loadStatus, listFreeContent: $listFreeContent, page: $page, pageSize: $pageSize)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FreeContentStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.loadStatus, loadStatus) ||
                other.loadStatus == loadStatus) &&
            const DeepCollectionEquality()
                .equals(other._listFreeContent, _listFreeContent) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, loadStatus,
      const DeepCollectionEquality().hash(_listFreeContent), page, pageSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FreeContentStateImplCopyWith<_$FreeContentStateImpl> get copyWith =>
      __$$FreeContentStateImplCopyWithImpl<_$FreeContentStateImpl>(
          this, _$identity);
}

abstract class _FreeContentState implements FreeContentState {
  const factory _FreeContentState(
      {final Status status,
      final Status loadStatus,
      final List<LikeContent> listFreeContent,
      final int page,
      final int pageSize}) = _$FreeContentStateImpl;

  @override
  Status get status;
  @override
  Status get loadStatus;
  @override
  List<LikeContent> get listFreeContent;
  @override
  int get page;
  @override
  int get pageSize;
  @override
  @JsonKey(ignore: true)
  _$$FreeContentStateImplCopyWith<_$FreeContentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FreeContentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadMore value) loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadMore value)? loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreeContentEventCopyWith<$Res> {
  factory $FreeContentEventCopyWith(
          FreeContentEvent value, $Res Function(FreeContentEvent) then) =
      _$FreeContentEventCopyWithImpl<$Res, FreeContentEvent>;
}

/// @nodoc
class _$FreeContentEventCopyWithImpl<$Res, $Val extends FreeContentEvent>
    implements $FreeContentEventCopyWith<$Res> {
  _$FreeContentEventCopyWithImpl(this._value, this._then);

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
    extends _$FreeContentEventCopyWithImpl<$Res, _$InitialImpl>
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
    return 'FreeContentEvent.initial()';
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
    required TResult Function() loadMore,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadMore,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadMore,
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
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements FreeContentEvent {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadMoreImplCopyWith<$Res> {
  factory _$$LoadMoreImplCopyWith(
          _$LoadMoreImpl value, $Res Function(_$LoadMoreImpl) then) =
      __$$LoadMoreImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreImplCopyWithImpl<$Res>
    extends _$FreeContentEventCopyWithImpl<$Res, _$LoadMoreImpl>
    implements _$$LoadMoreImplCopyWith<$Res> {
  __$$LoadMoreImplCopyWithImpl(
      _$LoadMoreImpl _value, $Res Function(_$LoadMoreImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadMoreImpl implements _LoadMore {
  const _$LoadMoreImpl();

  @override
  String toString() {
    return 'FreeContentEvent.loadMore()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadMoreImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadMore,
  }) {
    return loadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadMore,
  }) {
    return loadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements FreeContentEvent {
  const factory _LoadMore() = _$LoadMoreImpl;
}
