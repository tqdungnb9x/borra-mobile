// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_content_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryContentState {
  Status get status => throw _privateConstructorUsedError;
  Status get loadStatus => throw _privateConstructorUsedError;
  List<LikeContent> get listCategoryContent =>
      throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryContentStateCopyWith<CategoryContentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryContentStateCopyWith<$Res> {
  factory $CategoryContentStateCopyWith(CategoryContentState value,
          $Res Function(CategoryContentState) then) =
      _$CategoryContentStateCopyWithImpl<$Res, CategoryContentState>;
  @useResult
  $Res call(
      {Status status,
      Status loadStatus,
      List<LikeContent> listCategoryContent,
      int page,
      int pageSize});

  $StatusCopyWith<$Res> get status;
  $StatusCopyWith<$Res> get loadStatus;
}

/// @nodoc
class _$CategoryContentStateCopyWithImpl<$Res,
        $Val extends CategoryContentState>
    implements $CategoryContentStateCopyWith<$Res> {
  _$CategoryContentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? loadStatus = null,
    Object? listCategoryContent = null,
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
      listCategoryContent: null == listCategoryContent
          ? _value.listCategoryContent
          : listCategoryContent // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CategoryContentStateImplCopyWith<$Res>
    implements $CategoryContentStateCopyWith<$Res> {
  factory _$$CategoryContentStateImplCopyWith(_$CategoryContentStateImpl value,
          $Res Function(_$CategoryContentStateImpl) then) =
      __$$CategoryContentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      Status loadStatus,
      List<LikeContent> listCategoryContent,
      int page,
      int pageSize});

  @override
  $StatusCopyWith<$Res> get status;
  @override
  $StatusCopyWith<$Res> get loadStatus;
}

/// @nodoc
class __$$CategoryContentStateImplCopyWithImpl<$Res>
    extends _$CategoryContentStateCopyWithImpl<$Res, _$CategoryContentStateImpl>
    implements _$$CategoryContentStateImplCopyWith<$Res> {
  __$$CategoryContentStateImplCopyWithImpl(_$CategoryContentStateImpl _value,
      $Res Function(_$CategoryContentStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? loadStatus = null,
    Object? listCategoryContent = null,
    Object? page = null,
    Object? pageSize = null,
  }) {
    return _then(_$CategoryContentStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      loadStatus: null == loadStatus
          ? _value.loadStatus
          : loadStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      listCategoryContent: null == listCategoryContent
          ? _value._listCategoryContent
          : listCategoryContent // ignore: cast_nullable_to_non_nullable
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

class _$CategoryContentStateImpl implements _CategoryContentState {
  const _$CategoryContentStateImpl(
      {this.status = const Status.idle(),
      this.loadStatus = const Status.idle(),
      final List<LikeContent> listCategoryContent = const [],
      this.page = 1,
      this.pageSize = 10})
      : _listCategoryContent = listCategoryContent;

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final Status loadStatus;
  final List<LikeContent> _listCategoryContent;
  @override
  @JsonKey()
  List<LikeContent> get listCategoryContent {
    if (_listCategoryContent is EqualUnmodifiableListView)
      return _listCategoryContent;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listCategoryContent);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int pageSize;

  @override
  String toString() {
    return 'CategoryContentState(status: $status, loadStatus: $loadStatus, listCategoryContent: $listCategoryContent, page: $page, pageSize: $pageSize)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryContentStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.loadStatus, loadStatus) ||
                other.loadStatus == loadStatus) &&
            const DeepCollectionEquality()
                .equals(other._listCategoryContent, _listCategoryContent) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      loadStatus,
      const DeepCollectionEquality().hash(_listCategoryContent),
      page,
      pageSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryContentStateImplCopyWith<_$CategoryContentStateImpl>
      get copyWith =>
          __$$CategoryContentStateImplCopyWithImpl<_$CategoryContentStateImpl>(
              this, _$identity);
}

abstract class _CategoryContentState implements CategoryContentState {
  const factory _CategoryContentState(
      {final Status status,
      final Status loadStatus,
      final List<LikeContent> listCategoryContent,
      final int page,
      final int pageSize}) = _$CategoryContentStateImpl;

  @override
  Status get status;
  @override
  Status get loadStatus;
  @override
  List<LikeContent> get listCategoryContent;
  @override
  int get page;
  @override
  int get pageSize;
  @override
  @JsonKey(ignore: true)
  _$$CategoryContentStateImplCopyWith<_$CategoryContentStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CategoryContentEvent {
  int get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) initial,
    required TResult Function(int id) loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? initial,
    TResult? Function(int id)? loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? initial,
    TResult Function(int id)? loadMore,
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

  @JsonKey(ignore: true)
  $CategoryContentEventCopyWith<CategoryContentEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryContentEventCopyWith<$Res> {
  factory $CategoryContentEventCopyWith(CategoryContentEvent value,
          $Res Function(CategoryContentEvent) then) =
      _$CategoryContentEventCopyWithImpl<$Res, CategoryContentEvent>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$CategoryContentEventCopyWithImpl<$Res,
        $Val extends CategoryContentEvent>
    implements $CategoryContentEventCopyWith<$Res> {
  _$CategoryContentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $CategoryContentEventCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CategoryContentEventCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$InitialImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'CategoryContentEvent.initial(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) initial,
    required TResult Function(int id) loadMore,
  }) {
    return initial(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? initial,
    TResult? Function(int id)? loadMore,
  }) {
    return initial?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? initial,
    TResult Function(int id)? loadMore,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(id);
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

abstract class _Initial implements CategoryContentEvent {
  const factory _Initial(final int id) = _$InitialImpl;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreImplCopyWith<$Res>
    implements $CategoryContentEventCopyWith<$Res> {
  factory _$$LoadMoreImplCopyWith(
          _$LoadMoreImpl value, $Res Function(_$LoadMoreImpl) then) =
      __$$LoadMoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$LoadMoreImplCopyWithImpl<$Res>
    extends _$CategoryContentEventCopyWithImpl<$Res, _$LoadMoreImpl>
    implements _$$LoadMoreImplCopyWith<$Res> {
  __$$LoadMoreImplCopyWithImpl(
      _$LoadMoreImpl _value, $Res Function(_$LoadMoreImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$LoadMoreImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadMoreImpl implements _LoadMore {
  const _$LoadMoreImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'CategoryContentEvent.loadMore(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMoreImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadMoreImplCopyWith<_$LoadMoreImpl> get copyWith =>
      __$$LoadMoreImplCopyWithImpl<_$LoadMoreImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) initial,
    required TResult Function(int id) loadMore,
  }) {
    return loadMore(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? initial,
    TResult? Function(int id)? loadMore,
  }) {
    return loadMore?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? initial,
    TResult Function(int id)? loadMore,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(id);
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

abstract class _LoadMore implements CategoryContentEvent {
  const factory _LoadMore(final int id) = _$LoadMoreImpl;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$LoadMoreImplCopyWith<_$LoadMoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
