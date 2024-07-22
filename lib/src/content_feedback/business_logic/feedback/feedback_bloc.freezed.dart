// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FeedbackState {
  Status get status => throw _privateConstructorUsedError;
  Status get statusPost => throw _privateConstructorUsedError;
  List<ContentFeedback> get listFeedback => throw _privateConstructorUsedError;
  FeedbackResult? get feedbackContent => throw _privateConstructorUsedError;
  int? get feedbackResult => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FeedbackStateCopyWith<FeedbackState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackStateCopyWith<$Res> {
  factory $FeedbackStateCopyWith(
          FeedbackState value, $Res Function(FeedbackState) then) =
      _$FeedbackStateCopyWithImpl<$Res, FeedbackState>;
  @useResult
  $Res call(
      {Status status,
      Status statusPost,
      List<ContentFeedback> listFeedback,
      FeedbackResult? feedbackContent,
      int? feedbackResult});

  $StatusCopyWith<$Res> get status;
  $StatusCopyWith<$Res> get statusPost;
}

/// @nodoc
class _$FeedbackStateCopyWithImpl<$Res, $Val extends FeedbackState>
    implements $FeedbackStateCopyWith<$Res> {
  _$FeedbackStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusPost = null,
    Object? listFeedback = null,
    Object? feedbackContent = freezed,
    Object? feedbackResult = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      statusPost: null == statusPost
          ? _value.statusPost
          : statusPost // ignore: cast_nullable_to_non_nullable
              as Status,
      listFeedback: null == listFeedback
          ? _value.listFeedback
          : listFeedback // ignore: cast_nullable_to_non_nullable
              as List<ContentFeedback>,
      feedbackContent: freezed == feedbackContent
          ? _value.feedbackContent
          : feedbackContent // ignore: cast_nullable_to_non_nullable
              as FeedbackResult?,
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

  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get statusPost {
    return $StatusCopyWith<$Res>(_value.statusPost, (value) {
      return _then(_value.copyWith(statusPost: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FeedbackStateImplCopyWith<$Res>
    implements $FeedbackStateCopyWith<$Res> {
  factory _$$FeedbackStateImplCopyWith(
          _$FeedbackStateImpl value, $Res Function(_$FeedbackStateImpl) then) =
      __$$FeedbackStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      Status statusPost,
      List<ContentFeedback> listFeedback,
      FeedbackResult? feedbackContent,
      int? feedbackResult});

  @override
  $StatusCopyWith<$Res> get status;
  @override
  $StatusCopyWith<$Res> get statusPost;
}

/// @nodoc
class __$$FeedbackStateImplCopyWithImpl<$Res>
    extends _$FeedbackStateCopyWithImpl<$Res, _$FeedbackStateImpl>
    implements _$$FeedbackStateImplCopyWith<$Res> {
  __$$FeedbackStateImplCopyWithImpl(
      _$FeedbackStateImpl _value, $Res Function(_$FeedbackStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusPost = null,
    Object? listFeedback = null,
    Object? feedbackContent = freezed,
    Object? feedbackResult = freezed,
  }) {
    return _then(_$FeedbackStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      statusPost: null == statusPost
          ? _value.statusPost
          : statusPost // ignore: cast_nullable_to_non_nullable
              as Status,
      listFeedback: null == listFeedback
          ? _value._listFeedback
          : listFeedback // ignore: cast_nullable_to_non_nullable
              as List<ContentFeedback>,
      feedbackContent: freezed == feedbackContent
          ? _value.feedbackContent
          : feedbackContent // ignore: cast_nullable_to_non_nullable
              as FeedbackResult?,
      feedbackResult: freezed == feedbackResult
          ? _value.feedbackResult
          : feedbackResult // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$FeedbackStateImpl implements _FeedbackState {
  const _$FeedbackStateImpl(
      {this.status = const Status.idle(),
      this.statusPost = const Status.idle(),
      final List<ContentFeedback> listFeedback = const [],
      this.feedbackContent,
      this.feedbackResult})
      : _listFeedback = listFeedback;

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final Status statusPost;
  final List<ContentFeedback> _listFeedback;
  @override
  @JsonKey()
  List<ContentFeedback> get listFeedback {
    if (_listFeedback is EqualUnmodifiableListView) return _listFeedback;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listFeedback);
  }

  @override
  final FeedbackResult? feedbackContent;
  @override
  final int? feedbackResult;

  @override
  String toString() {
    return 'FeedbackState(status: $status, statusPost: $statusPost, listFeedback: $listFeedback, feedbackContent: $feedbackContent, feedbackResult: $feedbackResult)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusPost, statusPost) ||
                other.statusPost == statusPost) &&
            const DeepCollectionEquality()
                .equals(other._listFeedback, _listFeedback) &&
            (identical(other.feedbackContent, feedbackContent) ||
                other.feedbackContent == feedbackContent) &&
            (identical(other.feedbackResult, feedbackResult) ||
                other.feedbackResult == feedbackResult));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      statusPost,
      const DeepCollectionEquality().hash(_listFeedback),
      feedbackContent,
      feedbackResult);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackStateImplCopyWith<_$FeedbackStateImpl> get copyWith =>
      __$$FeedbackStateImplCopyWithImpl<_$FeedbackStateImpl>(this, _$identity);
}

abstract class _FeedbackState implements FeedbackState {
  const factory _FeedbackState(
      {final Status status,
      final Status statusPost,
      final List<ContentFeedback> listFeedback,
      final FeedbackResult? feedbackContent,
      final int? feedbackResult}) = _$FeedbackStateImpl;

  @override
  Status get status;
  @override
  Status get statusPost;
  @override
  List<ContentFeedback> get listFeedback;
  @override
  FeedbackResult? get feedbackContent;
  @override
  int? get feedbackResult;
  @override
  @JsonKey(ignore: true)
  _$$FeedbackStateImplCopyWith<_$FeedbackStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FeedbackEvent {
  int get contentId => throw _privateConstructorUsedError;
  int? get purchaseId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int contentId, int? purchaseId) initial,
    required TResult Function(
            int selectedFeedback, int contentId, int purchaseId)
        postFeedback,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int contentId, int? purchaseId)? initial,
    TResult? Function(int selectedFeedback, int contentId, int purchaseId)?
        postFeedback,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int contentId, int? purchaseId)? initial,
    TResult Function(int selectedFeedback, int contentId, int purchaseId)?
        postFeedback,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(PostFeedback value) postFeedback,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(PostFeedback value)? postFeedback,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(PostFeedback value)? postFeedback,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FeedbackEventCopyWith<FeedbackEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackEventCopyWith<$Res> {
  factory $FeedbackEventCopyWith(
          FeedbackEvent value, $Res Function(FeedbackEvent) then) =
      _$FeedbackEventCopyWithImpl<$Res, FeedbackEvent>;
  @useResult
  $Res call({int contentId, int purchaseId});
}

/// @nodoc
class _$FeedbackEventCopyWithImpl<$Res, $Val extends FeedbackEvent>
    implements $FeedbackEventCopyWith<$Res> {
  _$FeedbackEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? purchaseId = null,
  }) {
    return _then(_value.copyWith(
      contentId: null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int,
      purchaseId: null == purchaseId
          ? _value.purchaseId!
          : purchaseId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $FeedbackEventCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int contentId, int? purchaseId});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$FeedbackEventCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? purchaseId = freezed,
  }) {
    return _then(_$InitialImpl(
      null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int,
      freezed == purchaseId
          ? _value.purchaseId
          : purchaseId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(this.contentId, this.purchaseId);

  @override
  final int contentId;
  @override
  final int? purchaseId;

  @override
  String toString() {
    return 'FeedbackEvent.initial(contentId: $contentId, purchaseId: $purchaseId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId) &&
            (identical(other.purchaseId, purchaseId) ||
                other.purchaseId == purchaseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, contentId, purchaseId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int contentId, int? purchaseId) initial,
    required TResult Function(
            int selectedFeedback, int contentId, int purchaseId)
        postFeedback,
  }) {
    return initial(contentId, purchaseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int contentId, int? purchaseId)? initial,
    TResult? Function(int selectedFeedback, int contentId, int purchaseId)?
        postFeedback,
  }) {
    return initial?.call(contentId, purchaseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int contentId, int? purchaseId)? initial,
    TResult Function(int selectedFeedback, int contentId, int purchaseId)?
        postFeedback,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(contentId, purchaseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(PostFeedback value) postFeedback,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(PostFeedback value)? postFeedback,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(PostFeedback value)? postFeedback,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements FeedbackEvent {
  const factory _Initial(final int contentId, final int? purchaseId) =
      _$InitialImpl;

  @override
  int get contentId;
  @override
  int? get purchaseId;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostFeedbackImplCopyWith<$Res>
    implements $FeedbackEventCopyWith<$Res> {
  factory _$$PostFeedbackImplCopyWith(
          _$PostFeedbackImpl value, $Res Function(_$PostFeedbackImpl) then) =
      __$$PostFeedbackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int selectedFeedback, int contentId, int purchaseId});
}

/// @nodoc
class __$$PostFeedbackImplCopyWithImpl<$Res>
    extends _$FeedbackEventCopyWithImpl<$Res, _$PostFeedbackImpl>
    implements _$$PostFeedbackImplCopyWith<$Res> {
  __$$PostFeedbackImplCopyWithImpl(
      _$PostFeedbackImpl _value, $Res Function(_$PostFeedbackImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedFeedback = null,
    Object? contentId = null,
    Object? purchaseId = null,
  }) {
    return _then(_$PostFeedbackImpl(
      null == selectedFeedback
          ? _value.selectedFeedback
          : selectedFeedback // ignore: cast_nullable_to_non_nullable
              as int,
      null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int,
      null == purchaseId
          ? _value.purchaseId
          : purchaseId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PostFeedbackImpl implements PostFeedback {
  const _$PostFeedbackImpl(
      this.selectedFeedback, this.contentId, this.purchaseId);

  @override
  final int selectedFeedback;
  @override
  final int contentId;
  @override
  final int purchaseId;

  @override
  String toString() {
    return 'FeedbackEvent.postFeedback(selectedFeedback: $selectedFeedback, contentId: $contentId, purchaseId: $purchaseId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostFeedbackImpl &&
            (identical(other.selectedFeedback, selectedFeedback) ||
                other.selectedFeedback == selectedFeedback) &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId) &&
            (identical(other.purchaseId, purchaseId) ||
                other.purchaseId == purchaseId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedFeedback, contentId, purchaseId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostFeedbackImplCopyWith<_$PostFeedbackImpl> get copyWith =>
      __$$PostFeedbackImplCopyWithImpl<_$PostFeedbackImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int contentId, int? purchaseId) initial,
    required TResult Function(
            int selectedFeedback, int contentId, int purchaseId)
        postFeedback,
  }) {
    return postFeedback(selectedFeedback, contentId, purchaseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int contentId, int? purchaseId)? initial,
    TResult? Function(int selectedFeedback, int contentId, int purchaseId)?
        postFeedback,
  }) {
    return postFeedback?.call(selectedFeedback, contentId, purchaseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int contentId, int? purchaseId)? initial,
    TResult Function(int selectedFeedback, int contentId, int purchaseId)?
        postFeedback,
    required TResult orElse(),
  }) {
    if (postFeedback != null) {
      return postFeedback(selectedFeedback, contentId, purchaseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(PostFeedback value) postFeedback,
  }) {
    return postFeedback(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(PostFeedback value)? postFeedback,
  }) {
    return postFeedback?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(PostFeedback value)? postFeedback,
    required TResult orElse(),
  }) {
    if (postFeedback != null) {
      return postFeedback(this);
    }
    return orElse();
  }
}

abstract class PostFeedback implements FeedbackEvent {
  const factory PostFeedback(final int selectedFeedback, final int contentId,
      final int purchaseId) = _$PostFeedbackImpl;

  int get selectedFeedback;
  @override
  int get contentId;
  @override
  int get purchaseId;
  @override
  @JsonKey(ignore: true)
  _$$PostFeedbackImplCopyWith<_$PostFeedbackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
