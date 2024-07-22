// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommend_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecommendState {
  Status get status => throw _privateConstructorUsedError;
  List<AppMainContent> get listRecommend => throw _privateConstructorUsedError;
  List<int> get listLikedIds => throw _privateConstructorUsedError;
  int? get feedbackResult => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecommendStateCopyWith<RecommendState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendStateCopyWith<$Res> {
  factory $RecommendStateCopyWith(
          RecommendState value, $Res Function(RecommendState) then) =
      _$RecommendStateCopyWithImpl<$Res, RecommendState>;
  @useResult
  $Res call(
      {Status status,
      List<AppMainContent> listRecommend,
      List<int> listLikedIds,
      int? feedbackResult});

  $StatusCopyWith<$Res> get status;
}

/// @nodoc
class _$RecommendStateCopyWithImpl<$Res, $Val extends RecommendState>
    implements $RecommendStateCopyWith<$Res> {
  _$RecommendStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? listRecommend = null,
    Object? listLikedIds = null,
    Object? feedbackResult = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      listRecommend: null == listRecommend
          ? _value.listRecommend
          : listRecommend // ignore: cast_nullable_to_non_nullable
              as List<AppMainContent>,
      listLikedIds: null == listLikedIds
          ? _value.listLikedIds
          : listLikedIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      feedbackResult: freezed == feedbackResult
          ? _value.feedbackResult
          : feedbackResult // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$RecommendStateImplCopyWith<$Res>
    implements $RecommendStateCopyWith<$Res> {
  factory _$$RecommendStateImplCopyWith(_$RecommendStateImpl value,
          $Res Function(_$RecommendStateImpl) then) =
      __$$RecommendStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      List<AppMainContent> listRecommend,
      List<int> listLikedIds,
      int? feedbackResult});

  @override
  $StatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$RecommendStateImplCopyWithImpl<$Res>
    extends _$RecommendStateCopyWithImpl<$Res, _$RecommendStateImpl>
    implements _$$RecommendStateImplCopyWith<$Res> {
  __$$RecommendStateImplCopyWithImpl(
      _$RecommendStateImpl _value, $Res Function(_$RecommendStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? listRecommend = null,
    Object? listLikedIds = null,
    Object? feedbackResult = freezed,
  }) {
    return _then(_$RecommendStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      listRecommend: null == listRecommend
          ? _value._listRecommend
          : listRecommend // ignore: cast_nullable_to_non_nullable
              as List<AppMainContent>,
      listLikedIds: null == listLikedIds
          ? _value._listLikedIds
          : listLikedIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      feedbackResult: freezed == feedbackResult
          ? _value.feedbackResult
          : feedbackResult // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$RecommendStateImpl implements _RecommendState {
  const _$RecommendStateImpl(
      {this.status = const Status.idle(),
      final List<AppMainContent> listRecommend = const [],
      final List<int> listLikedIds = const [],
      this.feedbackResult})
      : _listRecommend = listRecommend,
        _listLikedIds = listLikedIds;

  @override
  @JsonKey()
  final Status status;
  final List<AppMainContent> _listRecommend;
  @override
  @JsonKey()
  List<AppMainContent> get listRecommend {
    if (_listRecommend is EqualUnmodifiableListView) return _listRecommend;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listRecommend);
  }

  final List<int> _listLikedIds;
  @override
  @JsonKey()
  List<int> get listLikedIds {
    if (_listLikedIds is EqualUnmodifiableListView) return _listLikedIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listLikedIds);
  }

  @override
  final int? feedbackResult;

  @override
  String toString() {
    return 'RecommendState(status: $status, listRecommend: $listRecommend, listLikedIds: $listLikedIds, feedbackResult: $feedbackResult)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._listRecommend, _listRecommend) &&
            const DeepCollectionEquality()
                .equals(other._listLikedIds, _listLikedIds) &&
            (identical(other.feedbackResult, feedbackResult) ||
                other.feedbackResult == feedbackResult));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_listRecommend),
      const DeepCollectionEquality().hash(_listLikedIds),
      feedbackResult);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendStateImplCopyWith<_$RecommendStateImpl> get copyWith =>
      __$$RecommendStateImplCopyWithImpl<_$RecommendStateImpl>(
          this, _$identity);
}

abstract class _RecommendState implements RecommendState {
  const factory _RecommendState(
      {final Status status,
      final List<AppMainContent> listRecommend,
      final List<int> listLikedIds,
      final int? feedbackResult}) = _$RecommendStateImpl;

  @override
  Status get status;
  @override
  List<AppMainContent> get listRecommend;
  @override
  List<int> get listLikedIds;
  @override
  int? get feedbackResult;
  @override
  @JsonKey(ignore: true)
  _$$RecommendStateImplCopyWith<_$RecommendStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RecommendEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendEventCopyWith<$Res> {
  factory $RecommendEventCopyWith(
          RecommendEvent value, $Res Function(RecommendEvent) then) =
      _$RecommendEventCopyWithImpl<$Res, RecommendEvent>;
}

/// @nodoc
class _$RecommendEventCopyWithImpl<$Res, $Val extends RecommendEvent>
    implements $RecommendEventCopyWith<$Res> {
  _$RecommendEventCopyWithImpl(this._value, this._then);

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
    extends _$RecommendEventCopyWithImpl<$Res, _$InitialImpl>
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
    return 'RecommendEvent.initial()';
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
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
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
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RecommendEvent {
  const factory _Initial() = _$InitialImpl;
}
