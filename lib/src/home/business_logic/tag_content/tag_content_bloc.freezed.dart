// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_content_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TagContentState {
  Status get status => throw _privateConstructorUsedError;
  Status get loadStatus => throw _privateConstructorUsedError;
  List<LikeContent> get listTagAllContent => throw _privateConstructorUsedError;
  int get tagId => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  List<AppTag>? get listTag => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TagContentStateCopyWith<TagContentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagContentStateCopyWith<$Res> {
  factory $TagContentStateCopyWith(
          TagContentState value, $Res Function(TagContentState) then) =
      _$TagContentStateCopyWithImpl<$Res, TagContentState>;
  @useResult
  $Res call(
      {Status status,
      Status loadStatus,
      List<LikeContent> listTagAllContent,
      int tagId,
      int page,
      int pageSize,
      List<AppTag>? listTag});
}

/// @nodoc
class _$TagContentStateCopyWithImpl<$Res, $Val extends TagContentState>
    implements $TagContentStateCopyWith<$Res> {
  _$TagContentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? loadStatus = freezed,
    Object? listTagAllContent = null,
    Object? tagId = null,
    Object? page = null,
    Object? pageSize = null,
    Object? listTag = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      loadStatus: freezed == loadStatus
          ? _value.loadStatus
          : loadStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      listTagAllContent: null == listTagAllContent
          ? _value.listTagAllContent
          : listTagAllContent // ignore: cast_nullable_to_non_nullable
              as List<LikeContent>,
      tagId: null == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      listTag: freezed == listTag
          ? _value.listTag
          : listTag // ignore: cast_nullable_to_non_nullable
              as List<AppTag>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TagContentStateImplCopyWith<$Res>
    implements $TagContentStateCopyWith<$Res> {
  factory _$$TagContentStateImplCopyWith(_$TagContentStateImpl value,
          $Res Function(_$TagContentStateImpl) then) =
      __$$TagContentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      Status loadStatus,
      List<LikeContent> listTagAllContent,
      int tagId,
      int page,
      int pageSize,
      List<AppTag>? listTag});
}

/// @nodoc
class __$$TagContentStateImplCopyWithImpl<$Res>
    extends _$TagContentStateCopyWithImpl<$Res, _$TagContentStateImpl>
    implements _$$TagContentStateImplCopyWith<$Res> {
  __$$TagContentStateImplCopyWithImpl(
      _$TagContentStateImpl _value, $Res Function(_$TagContentStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? loadStatus = freezed,
    Object? listTagAllContent = null,
    Object? tagId = null,
    Object? page = null,
    Object? pageSize = null,
    Object? listTag = freezed,
  }) {
    return _then(_$TagContentStateImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      loadStatus: freezed == loadStatus
          ? _value.loadStatus
          : loadStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      listTagAllContent: null == listTagAllContent
          ? _value._listTagAllContent
          : listTagAllContent // ignore: cast_nullable_to_non_nullable
              as List<LikeContent>,
      tagId: null == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      listTag: freezed == listTag
          ? _value._listTag
          : listTag // ignore: cast_nullable_to_non_nullable
              as List<AppTag>?,
    ));
  }
}

/// @nodoc

class _$TagContentStateImpl implements _TagContentState {
  const _$TagContentStateImpl(
      {this.status = const Status.idle(),
      this.loadStatus = const Status.idle(),
      final List<LikeContent> listTagAllContent = const [],
      this.tagId = 1,
      this.page = 1,
      this.pageSize = 10,
      final List<AppTag>? listTag})
      : _listTagAllContent = listTagAllContent,
        _listTag = listTag;

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final Status loadStatus;
  final List<LikeContent> _listTagAllContent;
  @override
  @JsonKey()
  List<LikeContent> get listTagAllContent {
    if (_listTagAllContent is EqualUnmodifiableListView)
      return _listTagAllContent;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listTagAllContent);
  }

  @override
  @JsonKey()
  final int tagId;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int pageSize;
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
    return 'TagContentState(status: $status, loadStatus: $loadStatus, listTagAllContent: $listTagAllContent, tagId: $tagId, page: $page, pageSize: $pageSize, listTag: $listTag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagContentStateImpl &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.loadStatus, loadStatus) &&
            const DeepCollectionEquality()
                .equals(other._listTagAllContent, _listTagAllContent) &&
            (identical(other.tagId, tagId) || other.tagId == tagId) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            const DeepCollectionEquality().equals(other._listTag, _listTag));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(loadStatus),
      const DeepCollectionEquality().hash(_listTagAllContent),
      tagId,
      page,
      pageSize,
      const DeepCollectionEquality().hash(_listTag));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TagContentStateImplCopyWith<_$TagContentStateImpl> get copyWith =>
      __$$TagContentStateImplCopyWithImpl<_$TagContentStateImpl>(
          this, _$identity);
}

abstract class _TagContentState implements TagContentState {
  const factory _TagContentState(
      {final Status status,
      final Status loadStatus,
      final List<LikeContent> listTagAllContent,
      final int tagId,
      final int page,
      final int pageSize,
      final List<AppTag>? listTag}) = _$TagContentStateImpl;

  @override
  Status get status;
  @override
  Status get loadStatus;
  @override
  List<LikeContent> get listTagAllContent;
  @override
  int get tagId;
  @override
  int get page;
  @override
  int get pageSize;
  @override
  List<AppTag>? get listTag;
  @override
  @JsonKey(ignore: true)
  _$$TagContentStateImplCopyWith<_$TagContentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TagContentEvent {
  int? get id => throw _privateConstructorUsedError;
  int? get categoryId => throw _privateConstructorUsedError;
  String? get priceType => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? id, int? categoryId, String? priceType)
        initial,
    required TResult Function(int? id, int? categoryId, String? priceType)
        onSelectTag,
    required TResult Function(int? id, int? categoryId, String? priceType)
        loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? id, int? categoryId, String? priceType)? initial,
    TResult? Function(int? id, int? categoryId, String? priceType)? onSelectTag,
    TResult? Function(int? id, int? categoryId, String? priceType)? loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? id, int? categoryId, String? priceType)? initial,
    TResult Function(int? id, int? categoryId, String? priceType)? onSelectTag,
    TResult Function(int? id, int? categoryId, String? priceType)? loadMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(SelectTag value) onSelectTag,
    required TResult Function(_LoadMore value) loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(SelectTag value)? onSelectTag,
    TResult? Function(_LoadMore value)? loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(SelectTag value)? onSelectTag,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TagContentEventCopyWith<TagContentEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagContentEventCopyWith<$Res> {
  factory $TagContentEventCopyWith(
          TagContentEvent value, $Res Function(TagContentEvent) then) =
      _$TagContentEventCopyWithImpl<$Res, TagContentEvent>;
  @useResult
  $Res call({int? id, int? categoryId, String? priceType});
}

/// @nodoc
class _$TagContentEventCopyWithImpl<$Res, $Val extends TagContentEvent>
    implements $TagContentEventCopyWith<$Res> {
  _$TagContentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = freezed,
    Object? priceType = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      priceType: freezed == priceType
          ? _value.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $TagContentEventCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? categoryId, String? priceType});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$TagContentEventCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = freezed,
    Object? priceType = freezed,
  }) {
    return _then(_$InitialImpl(
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == priceType
          ? _value.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(this.id, this.categoryId, this.priceType);

  @override
  final int? id;
  @override
  final int? categoryId;
  @override
  final String? priceType;

  @override
  String toString() {
    return 'TagContentEvent.initial(id: $id, categoryId: $categoryId, priceType: $priceType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.priceType, priceType) ||
                other.priceType == priceType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, categoryId, priceType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? id, int? categoryId, String? priceType)
        initial,
    required TResult Function(int? id, int? categoryId, String? priceType)
        onSelectTag,
    required TResult Function(int? id, int? categoryId, String? priceType)
        loadMore,
  }) {
    return initial(id, categoryId, priceType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? id, int? categoryId, String? priceType)? initial,
    TResult? Function(int? id, int? categoryId, String? priceType)? onSelectTag,
    TResult? Function(int? id, int? categoryId, String? priceType)? loadMore,
  }) {
    return initial?.call(id, categoryId, priceType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? id, int? categoryId, String? priceType)? initial,
    TResult Function(int? id, int? categoryId, String? priceType)? onSelectTag,
    TResult Function(int? id, int? categoryId, String? priceType)? loadMore,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(id, categoryId, priceType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(SelectTag value) onSelectTag,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(SelectTag value)? onSelectTag,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(SelectTag value)? onSelectTag,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements TagContentEvent {
  const factory _Initial(
          final int? id, final int? categoryId, final String? priceType) =
      _$InitialImpl;

  @override
  int? get id;
  @override
  int? get categoryId;
  @override
  String? get priceType;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectTagImplCopyWith<$Res>
    implements $TagContentEventCopyWith<$Res> {
  factory _$$SelectTagImplCopyWith(
          _$SelectTagImpl value, $Res Function(_$SelectTagImpl) then) =
      __$$SelectTagImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? categoryId, String? priceType});
}

/// @nodoc
class __$$SelectTagImplCopyWithImpl<$Res>
    extends _$TagContentEventCopyWithImpl<$Res, _$SelectTagImpl>
    implements _$$SelectTagImplCopyWith<$Res> {
  __$$SelectTagImplCopyWithImpl(
      _$SelectTagImpl _value, $Res Function(_$SelectTagImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = freezed,
    Object? priceType = freezed,
  }) {
    return _then(_$SelectTagImpl(
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == priceType
          ? _value.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SelectTagImpl implements SelectTag {
  const _$SelectTagImpl(this.id, this.categoryId, this.priceType);

  @override
  final int? id;
  @override
  final int? categoryId;
  @override
  final String? priceType;

  @override
  String toString() {
    return 'TagContentEvent.onSelectTag(id: $id, categoryId: $categoryId, priceType: $priceType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectTagImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.priceType, priceType) ||
                other.priceType == priceType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, categoryId, priceType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectTagImplCopyWith<_$SelectTagImpl> get copyWith =>
      __$$SelectTagImplCopyWithImpl<_$SelectTagImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? id, int? categoryId, String? priceType)
        initial,
    required TResult Function(int? id, int? categoryId, String? priceType)
        onSelectTag,
    required TResult Function(int? id, int? categoryId, String? priceType)
        loadMore,
  }) {
    return onSelectTag(id, categoryId, priceType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? id, int? categoryId, String? priceType)? initial,
    TResult? Function(int? id, int? categoryId, String? priceType)? onSelectTag,
    TResult? Function(int? id, int? categoryId, String? priceType)? loadMore,
  }) {
    return onSelectTag?.call(id, categoryId, priceType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? id, int? categoryId, String? priceType)? initial,
    TResult Function(int? id, int? categoryId, String? priceType)? onSelectTag,
    TResult Function(int? id, int? categoryId, String? priceType)? loadMore,
    required TResult orElse(),
  }) {
    if (onSelectTag != null) {
      return onSelectTag(id, categoryId, priceType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(SelectTag value) onSelectTag,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return onSelectTag(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(SelectTag value)? onSelectTag,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return onSelectTag?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(SelectTag value)? onSelectTag,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (onSelectTag != null) {
      return onSelectTag(this);
    }
    return orElse();
  }
}

abstract class SelectTag implements TagContentEvent {
  const factory SelectTag(
          final int? id, final int? categoryId, final String? priceType) =
      _$SelectTagImpl;

  @override
  int? get id;
  @override
  int? get categoryId;
  @override
  String? get priceType;
  @override
  @JsonKey(ignore: true)
  _$$SelectTagImplCopyWith<_$SelectTagImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreImplCopyWith<$Res>
    implements $TagContentEventCopyWith<$Res> {
  factory _$$LoadMoreImplCopyWith(
          _$LoadMoreImpl value, $Res Function(_$LoadMoreImpl) then) =
      __$$LoadMoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? categoryId, String? priceType});
}

/// @nodoc
class __$$LoadMoreImplCopyWithImpl<$Res>
    extends _$TagContentEventCopyWithImpl<$Res, _$LoadMoreImpl>
    implements _$$LoadMoreImplCopyWith<$Res> {
  __$$LoadMoreImplCopyWithImpl(
      _$LoadMoreImpl _value, $Res Function(_$LoadMoreImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = freezed,
    Object? priceType = freezed,
  }) {
    return _then(_$LoadMoreImpl(
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == priceType
          ? _value.priceType
          : priceType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadMoreImpl implements _LoadMore {
  const _$LoadMoreImpl(this.id, this.categoryId, this.priceType);

  @override
  final int? id;
  @override
  final int? categoryId;
  @override
  final String? priceType;

  @override
  String toString() {
    return 'TagContentEvent.loadMore(id: $id, categoryId: $categoryId, priceType: $priceType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMoreImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.priceType, priceType) ||
                other.priceType == priceType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, categoryId, priceType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadMoreImplCopyWith<_$LoadMoreImpl> get copyWith =>
      __$$LoadMoreImplCopyWithImpl<_$LoadMoreImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? id, int? categoryId, String? priceType)
        initial,
    required TResult Function(int? id, int? categoryId, String? priceType)
        onSelectTag,
    required TResult Function(int? id, int? categoryId, String? priceType)
        loadMore,
  }) {
    return loadMore(id, categoryId, priceType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? id, int? categoryId, String? priceType)? initial,
    TResult? Function(int? id, int? categoryId, String? priceType)? onSelectTag,
    TResult? Function(int? id, int? categoryId, String? priceType)? loadMore,
  }) {
    return loadMore?.call(id, categoryId, priceType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? id, int? categoryId, String? priceType)? initial,
    TResult Function(int? id, int? categoryId, String? priceType)? onSelectTag,
    TResult Function(int? id, int? categoryId, String? priceType)? loadMore,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(id, categoryId, priceType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(SelectTag value) onSelectTag,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(SelectTag value)? onSelectTag,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(SelectTag value)? onSelectTag,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements TagContentEvent {
  const factory _LoadMore(
          final int? id, final int? categoryId, final String? priceType) =
      _$LoadMoreImpl;

  @override
  int? get id;
  @override
  int? get categoryId;
  @override
  String? get priceType;
  @override
  @JsonKey(ignore: true)
  _$$LoadMoreImplCopyWith<_$LoadMoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
