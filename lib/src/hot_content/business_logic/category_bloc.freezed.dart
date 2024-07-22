// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoryState {
  Status get status => throw _privateConstructorUsedError;
  Status get statusGetContentByCat => throw _privateConstructorUsedError;
  Status get statusLoadMore => throw _privateConstructorUsedError;
  List<ContentCategory>? get listCategory => throw _privateConstructorUsedError;
  ContentCategory? get selectedCategory => throw _privateConstructorUsedError;
  List<LikeContent> get listContentByCat => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryStateCopyWith<CategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryStateCopyWith<$Res> {
  factory $CategoryStateCopyWith(
          CategoryState value, $Res Function(CategoryState) then) =
      _$CategoryStateCopyWithImpl<$Res, CategoryState>;
  @useResult
  $Res call(
      {Status status,
      Status statusGetContentByCat,
      Status statusLoadMore,
      List<ContentCategory>? listCategory,
      ContentCategory? selectedCategory,
      List<LikeContent> listContentByCat,
      int page,
      int pageSize});
}

/// @nodoc
class _$CategoryStateCopyWithImpl<$Res, $Val extends CategoryState>
    implements $CategoryStateCopyWith<$Res> {
  _$CategoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? statusGetContentByCat = freezed,
    Object? statusLoadMore = freezed,
    Object? listCategory = freezed,
    Object? selectedCategory = freezed,
    Object? listContentByCat = null,
    Object? page = null,
    Object? pageSize = null,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      statusGetContentByCat: freezed == statusGetContentByCat
          ? _value.statusGetContentByCat
          : statusGetContentByCat // ignore: cast_nullable_to_non_nullable
              as Status,
      statusLoadMore: freezed == statusLoadMore
          ? _value.statusLoadMore
          : statusLoadMore // ignore: cast_nullable_to_non_nullable
              as Status,
      listCategory: freezed == listCategory
          ? _value.listCategory
          : listCategory // ignore: cast_nullable_to_non_nullable
              as List<ContentCategory>?,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as ContentCategory?,
      listContentByCat: null == listContentByCat
          ? _value.listContentByCat
          : listContentByCat // ignore: cast_nullable_to_non_nullable
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
}

/// @nodoc
abstract class _$$CategoryStateImplCopyWith<$Res>
    implements $CategoryStateCopyWith<$Res> {
  factory _$$CategoryStateImplCopyWith(
          _$CategoryStateImpl value, $Res Function(_$CategoryStateImpl) then) =
      __$$CategoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      Status statusGetContentByCat,
      Status statusLoadMore,
      List<ContentCategory>? listCategory,
      ContentCategory? selectedCategory,
      List<LikeContent> listContentByCat,
      int page,
      int pageSize});
}

/// @nodoc
class __$$CategoryStateImplCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res, _$CategoryStateImpl>
    implements _$$CategoryStateImplCopyWith<$Res> {
  __$$CategoryStateImplCopyWithImpl(
      _$CategoryStateImpl _value, $Res Function(_$CategoryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? statusGetContentByCat = freezed,
    Object? statusLoadMore = freezed,
    Object? listCategory = freezed,
    Object? selectedCategory = freezed,
    Object? listContentByCat = null,
    Object? page = null,
    Object? pageSize = null,
  }) {
    return _then(_$CategoryStateImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      statusGetContentByCat: freezed == statusGetContentByCat
          ? _value.statusGetContentByCat
          : statusGetContentByCat // ignore: cast_nullable_to_non_nullable
              as Status,
      statusLoadMore: freezed == statusLoadMore
          ? _value.statusLoadMore
          : statusLoadMore // ignore: cast_nullable_to_non_nullable
              as Status,
      listCategory: freezed == listCategory
          ? _value._listCategory
          : listCategory // ignore: cast_nullable_to_non_nullable
              as List<ContentCategory>?,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as ContentCategory?,
      listContentByCat: null == listContentByCat
          ? _value._listContentByCat
          : listContentByCat // ignore: cast_nullable_to_non_nullable
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

class _$CategoryStateImpl implements _CategoryState {
  const _$CategoryStateImpl(
      {this.status = const Status.idle(),
      this.statusGetContentByCat = const Status.idle(),
      this.statusLoadMore = const Status.idle(),
      final List<ContentCategory>? listCategory,
      this.selectedCategory,
      final List<LikeContent> listContentByCat = const [],
      this.page = 1,
      this.pageSize = 10})
      : _listCategory = listCategory,
        _listContentByCat = listContentByCat;

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final Status statusGetContentByCat;
  @override
  @JsonKey()
  final Status statusLoadMore;
  final List<ContentCategory>? _listCategory;
  @override
  List<ContentCategory>? get listCategory {
    final value = _listCategory;
    if (value == null) return null;
    if (_listCategory is EqualUnmodifiableListView) return _listCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ContentCategory? selectedCategory;
  final List<LikeContent> _listContentByCat;
  @override
  @JsonKey()
  List<LikeContent> get listContentByCat {
    if (_listContentByCat is EqualUnmodifiableListView)
      return _listContentByCat;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listContentByCat);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int pageSize;

  @override
  String toString() {
    return 'CategoryState(status: $status, statusGetContentByCat: $statusGetContentByCat, statusLoadMore: $statusLoadMore, listCategory: $listCategory, selectedCategory: $selectedCategory, listContentByCat: $listContentByCat, page: $page, pageSize: $pageSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryStateImpl &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.statusGetContentByCat, statusGetContentByCat) &&
            const DeepCollectionEquality()
                .equals(other.statusLoadMore, statusLoadMore) &&
            const DeepCollectionEquality()
                .equals(other._listCategory, _listCategory) &&
            const DeepCollectionEquality()
                .equals(other.selectedCategory, selectedCategory) &&
            const DeepCollectionEquality()
                .equals(other._listContentByCat, _listContentByCat) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(statusGetContentByCat),
      const DeepCollectionEquality().hash(statusLoadMore),
      const DeepCollectionEquality().hash(_listCategory),
      const DeepCollectionEquality().hash(selectedCategory),
      const DeepCollectionEquality().hash(_listContentByCat),
      page,
      pageSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryStateImplCopyWith<_$CategoryStateImpl> get copyWith =>
      __$$CategoryStateImplCopyWithImpl<_$CategoryStateImpl>(this, _$identity);
}

abstract class _CategoryState implements CategoryState {
  const factory _CategoryState(
      {final Status status,
      final Status statusGetContentByCat,
      final Status statusLoadMore,
      final List<ContentCategory>? listCategory,
      final ContentCategory? selectedCategory,
      final List<LikeContent> listContentByCat,
      final int page,
      final int pageSize}) = _$CategoryStateImpl;

  @override
  Status get status;
  @override
  Status get statusGetContentByCat;
  @override
  Status get statusLoadMore;
  @override
  List<ContentCategory>? get listCategory;
  @override
  ContentCategory? get selectedCategory;
  @override
  List<LikeContent> get listContentByCat;
  @override
  int get page;
  @override
  int get pageSize;
  @override
  @JsonKey(ignore: true)
  _$$CategoryStateImplCopyWith<_$CategoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CategoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() initialHotContent,
    required TResult Function(ContentCategory category) selectCategory,
    required TResult Function(int id) loadMore,
    required TResult Function() removeAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? initialHotContent,
    TResult? Function(ContentCategory category)? selectCategory,
    TResult? Function(int id)? loadMore,
    TResult? Function()? removeAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialHotContent,
    TResult Function(ContentCategory category)? selectCategory,
    TResult Function(int id)? loadMore,
    TResult Function()? removeAll,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_InitialHotContent value) initialHotContent,
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_RemoveAll value) removeAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_InitialHotContent value)? initialHotContent,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_RemoveAll value)? removeAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_InitialHotContent value)? initialHotContent,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_RemoveAll value)? removeAll,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryEventCopyWith<$Res> {
  factory $CategoryEventCopyWith(
          CategoryEvent value, $Res Function(CategoryEvent) then) =
      _$CategoryEventCopyWithImpl<$Res, CategoryEvent>;
}

/// @nodoc
class _$CategoryEventCopyWithImpl<$Res, $Val extends CategoryEvent>
    implements $CategoryEventCopyWith<$Res> {
  _$CategoryEventCopyWithImpl(this._value, this._then);

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
    extends _$CategoryEventCopyWithImpl<$Res, _$InitialImpl>
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
    return 'CategoryEvent.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() initialHotContent,
    required TResult Function(ContentCategory category) selectCategory,
    required TResult Function(int id) loadMore,
    required TResult Function() removeAll,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? initialHotContent,
    TResult? Function(ContentCategory category)? selectCategory,
    TResult? Function(int id)? loadMore,
    TResult? Function()? removeAll,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialHotContent,
    TResult Function(ContentCategory category)? selectCategory,
    TResult Function(int id)? loadMore,
    TResult Function()? removeAll,
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
    required TResult Function(_InitialHotContent value) initialHotContent,
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_RemoveAll value) removeAll,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_InitialHotContent value)? initialHotContent,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_RemoveAll value)? removeAll,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_InitialHotContent value)? initialHotContent,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_RemoveAll value)? removeAll,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CategoryEvent {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$InitialHotContentImplCopyWith<$Res> {
  factory _$$InitialHotContentImplCopyWith(_$InitialHotContentImpl value,
          $Res Function(_$InitialHotContentImpl) then) =
      __$$InitialHotContentImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialHotContentImplCopyWithImpl<$Res>
    extends _$CategoryEventCopyWithImpl<$Res, _$InitialHotContentImpl>
    implements _$$InitialHotContentImplCopyWith<$Res> {
  __$$InitialHotContentImplCopyWithImpl(_$InitialHotContentImpl _value,
      $Res Function(_$InitialHotContentImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialHotContentImpl implements _InitialHotContent {
  const _$InitialHotContentImpl();

  @override
  String toString() {
    return 'CategoryEvent.initialHotContent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialHotContentImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() initialHotContent,
    required TResult Function(ContentCategory category) selectCategory,
    required TResult Function(int id) loadMore,
    required TResult Function() removeAll,
  }) {
    return initialHotContent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? initialHotContent,
    TResult? Function(ContentCategory category)? selectCategory,
    TResult? Function(int id)? loadMore,
    TResult? Function()? removeAll,
  }) {
    return initialHotContent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialHotContent,
    TResult Function(ContentCategory category)? selectCategory,
    TResult Function(int id)? loadMore,
    TResult Function()? removeAll,
    required TResult orElse(),
  }) {
    if (initialHotContent != null) {
      return initialHotContent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_InitialHotContent value) initialHotContent,
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_RemoveAll value) removeAll,
  }) {
    return initialHotContent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_InitialHotContent value)? initialHotContent,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_RemoveAll value)? removeAll,
  }) {
    return initialHotContent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_InitialHotContent value)? initialHotContent,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_RemoveAll value)? removeAll,
    required TResult orElse(),
  }) {
    if (initialHotContent != null) {
      return initialHotContent(this);
    }
    return orElse();
  }
}

abstract class _InitialHotContent implements CategoryEvent {
  const factory _InitialHotContent() = _$InitialHotContentImpl;
}

/// @nodoc
abstract class _$$SelectCategoryImplCopyWith<$Res> {
  factory _$$SelectCategoryImplCopyWith(_$SelectCategoryImpl value,
          $Res Function(_$SelectCategoryImpl) then) =
      __$$SelectCategoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ContentCategory category});
}

/// @nodoc
class __$$SelectCategoryImplCopyWithImpl<$Res>
    extends _$CategoryEventCopyWithImpl<$Res, _$SelectCategoryImpl>
    implements _$$SelectCategoryImplCopyWith<$Res> {
  __$$SelectCategoryImplCopyWithImpl(
      _$SelectCategoryImpl _value, $Res Function(_$SelectCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
  }) {
    return _then(_$SelectCategoryImpl(
      freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ContentCategory,
    ));
  }
}

/// @nodoc

class _$SelectCategoryImpl implements SelectCategory {
  const _$SelectCategoryImpl(this.category);

  @override
  final ContentCategory category;

  @override
  String toString() {
    return 'CategoryEvent.selectCategory(category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectCategoryImpl &&
            const DeepCollectionEquality().equals(other.category, category));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(category));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectCategoryImplCopyWith<_$SelectCategoryImpl> get copyWith =>
      __$$SelectCategoryImplCopyWithImpl<_$SelectCategoryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() initialHotContent,
    required TResult Function(ContentCategory category) selectCategory,
    required TResult Function(int id) loadMore,
    required TResult Function() removeAll,
  }) {
    return selectCategory(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? initialHotContent,
    TResult? Function(ContentCategory category)? selectCategory,
    TResult? Function(int id)? loadMore,
    TResult? Function()? removeAll,
  }) {
    return selectCategory?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialHotContent,
    TResult Function(ContentCategory category)? selectCategory,
    TResult Function(int id)? loadMore,
    TResult Function()? removeAll,
    required TResult orElse(),
  }) {
    if (selectCategory != null) {
      return selectCategory(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_InitialHotContent value) initialHotContent,
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_RemoveAll value) removeAll,
  }) {
    return selectCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_InitialHotContent value)? initialHotContent,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_RemoveAll value)? removeAll,
  }) {
    return selectCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_InitialHotContent value)? initialHotContent,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_RemoveAll value)? removeAll,
    required TResult orElse(),
  }) {
    if (selectCategory != null) {
      return selectCategory(this);
    }
    return orElse();
  }
}

abstract class SelectCategory implements CategoryEvent {
  const factory SelectCategory(final ContentCategory category) =
      _$SelectCategoryImpl;

  ContentCategory get category;
  @JsonKey(ignore: true)
  _$$SelectCategoryImplCopyWith<_$SelectCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreImplCopyWith<$Res> {
  factory _$$LoadMoreImplCopyWith(
          _$LoadMoreImpl value, $Res Function(_$LoadMoreImpl) then) =
      __$$LoadMoreImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$LoadMoreImplCopyWithImpl<$Res>
    extends _$CategoryEventCopyWithImpl<$Res, _$LoadMoreImpl>
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
    return 'CategoryEvent.loadMore(id: $id)';
  }

  @override
  bool operator ==(Object other) {
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
    required TResult Function() initial,
    required TResult Function() initialHotContent,
    required TResult Function(ContentCategory category) selectCategory,
    required TResult Function(int id) loadMore,
    required TResult Function() removeAll,
  }) {
    return loadMore(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? initialHotContent,
    TResult? Function(ContentCategory category)? selectCategory,
    TResult? Function(int id)? loadMore,
    TResult? Function()? removeAll,
  }) {
    return loadMore?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialHotContent,
    TResult Function(ContentCategory category)? selectCategory,
    TResult Function(int id)? loadMore,
    TResult Function()? removeAll,
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
    required TResult Function(_InitialHotContent value) initialHotContent,
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_RemoveAll value) removeAll,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_InitialHotContent value)? initialHotContent,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_RemoveAll value)? removeAll,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_InitialHotContent value)? initialHotContent,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_RemoveAll value)? removeAll,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements CategoryEvent {
  const factory _LoadMore(final int id) = _$LoadMoreImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$LoadMoreImplCopyWith<_$LoadMoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveAllImplCopyWith<$Res> {
  factory _$$RemoveAllImplCopyWith(
          _$RemoveAllImpl value, $Res Function(_$RemoveAllImpl) then) =
      __$$RemoveAllImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RemoveAllImplCopyWithImpl<$Res>
    extends _$CategoryEventCopyWithImpl<$Res, _$RemoveAllImpl>
    implements _$$RemoveAllImplCopyWith<$Res> {
  __$$RemoveAllImplCopyWithImpl(
      _$RemoveAllImpl _value, $Res Function(_$RemoveAllImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RemoveAllImpl implements _RemoveAll {
  const _$RemoveAllImpl();

  @override
  String toString() {
    return 'CategoryEvent.removeAll()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RemoveAllImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() initialHotContent,
    required TResult Function(ContentCategory category) selectCategory,
    required TResult Function(int id) loadMore,
    required TResult Function() removeAll,
  }) {
    return removeAll();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? initialHotContent,
    TResult? Function(ContentCategory category)? selectCategory,
    TResult? Function(int id)? loadMore,
    TResult? Function()? removeAll,
  }) {
    return removeAll?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initialHotContent,
    TResult Function(ContentCategory category)? selectCategory,
    TResult Function(int id)? loadMore,
    TResult Function()? removeAll,
    required TResult orElse(),
  }) {
    if (removeAll != null) {
      return removeAll();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_InitialHotContent value) initialHotContent,
    required TResult Function(SelectCategory value) selectCategory,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_RemoveAll value) removeAll,
  }) {
    return removeAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_InitialHotContent value)? initialHotContent,
    TResult? Function(SelectCategory value)? selectCategory,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_RemoveAll value)? removeAll,
  }) {
    return removeAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_InitialHotContent value)? initialHotContent,
    TResult Function(SelectCategory value)? selectCategory,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_RemoveAll value)? removeAll,
    required TResult orElse(),
  }) {
    if (removeAll != null) {
      return removeAll(this);
    }
    return orElse();
  }
}

abstract class _RemoveAll implements CategoryEvent {
  const factory _RemoveAll() = _$RemoveAllImpl;
}
