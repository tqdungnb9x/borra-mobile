// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_result_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ContentResultState {
  Status get status => throw _privateConstructorUsedError;
  Status get statusLoadRecommend => throw _privateConstructorUsedError;
  ContentResult? get contentResult => throw _privateConstructorUsedError;
  List<Map<String, dynamic>>? get tarotList =>
      throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;
  String get shareLink => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContentResultStateCopyWith<ContentResultState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentResultStateCopyWith<$Res> {
  factory $ContentResultStateCopyWith(
          ContentResultState value, $Res Function(ContentResultState) then) =
      _$ContentResultStateCopyWithImpl<$Res, ContentResultState>;
  @useResult
  $Res call(
      {Status status,
      Status statusLoadRecommend,
      ContentResult? contentResult,
      List<Map<String, dynamic>>? tarotList,
      bool isLiked,
      String shareLink});

  $StatusCopyWith<$Res> get status;
  $StatusCopyWith<$Res> get statusLoadRecommend;
}

/// @nodoc
class _$ContentResultStateCopyWithImpl<$Res, $Val extends ContentResultState>
    implements $ContentResultStateCopyWith<$Res> {
  _$ContentResultStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusLoadRecommend = null,
    Object? contentResult = freezed,
    Object? tarotList = freezed,
    Object? isLiked = null,
    Object? shareLink = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      statusLoadRecommend: null == statusLoadRecommend
          ? _value.statusLoadRecommend
          : statusLoadRecommend // ignore: cast_nullable_to_non_nullable
              as Status,
      contentResult: freezed == contentResult
          ? _value.contentResult
          : contentResult // ignore: cast_nullable_to_non_nullable
              as ContentResult?,
      tarotList: freezed == tarotList
          ? _value.tarotList
          : tarotList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      shareLink: null == shareLink
          ? _value.shareLink
          : shareLink // ignore: cast_nullable_to_non_nullable
              as String,
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
  $StatusCopyWith<$Res> get statusLoadRecommend {
    return $StatusCopyWith<$Res>(_value.statusLoadRecommend, (value) {
      return _then(_value.copyWith(statusLoadRecommend: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContentResultStateImplCopyWith<$Res>
    implements $ContentResultStateCopyWith<$Res> {
  factory _$$ContentResultStateImplCopyWith(_$ContentResultStateImpl value,
          $Res Function(_$ContentResultStateImpl) then) =
      __$$ContentResultStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      Status statusLoadRecommend,
      ContentResult? contentResult,
      List<Map<String, dynamic>>? tarotList,
      bool isLiked,
      String shareLink});

  @override
  $StatusCopyWith<$Res> get status;
  @override
  $StatusCopyWith<$Res> get statusLoadRecommend;
}

/// @nodoc
class __$$ContentResultStateImplCopyWithImpl<$Res>
    extends _$ContentResultStateCopyWithImpl<$Res, _$ContentResultStateImpl>
    implements _$$ContentResultStateImplCopyWith<$Res> {
  __$$ContentResultStateImplCopyWithImpl(_$ContentResultStateImpl _value,
      $Res Function(_$ContentResultStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusLoadRecommend = null,
    Object? contentResult = freezed,
    Object? tarotList = freezed,
    Object? isLiked = null,
    Object? shareLink = null,
  }) {
    return _then(_$ContentResultStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      statusLoadRecommend: null == statusLoadRecommend
          ? _value.statusLoadRecommend
          : statusLoadRecommend // ignore: cast_nullable_to_non_nullable
              as Status,
      contentResult: freezed == contentResult
          ? _value.contentResult
          : contentResult // ignore: cast_nullable_to_non_nullable
              as ContentResult?,
      tarotList: freezed == tarotList
          ? _value._tarotList
          : tarotList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      shareLink: null == shareLink
          ? _value.shareLink
          : shareLink // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ContentResultStateImpl implements _ContentResultState {
  const _$ContentResultStateImpl(
      {this.status = const Status.idle(),
      this.statusLoadRecommend = const Status.idle(),
      this.contentResult,
      final List<Map<String, dynamic>>? tarotList,
      this.isLiked = false,
      this.shareLink = ''})
      : _tarotList = tarotList;

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final Status statusLoadRecommend;
  @override
  final ContentResult? contentResult;
  final List<Map<String, dynamic>>? _tarotList;
  @override
  List<Map<String, dynamic>>? get tarotList {
    final value = _tarotList;
    if (value == null) return null;
    if (_tarotList is EqualUnmodifiableListView) return _tarotList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool isLiked;
  @override
  @JsonKey()
  final String shareLink;

  @override
  String toString() {
    return 'ContentResultState(status: $status, statusLoadRecommend: $statusLoadRecommend, contentResult: $contentResult, tarotList: $tarotList, isLiked: $isLiked, shareLink: $shareLink)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentResultStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusLoadRecommend, statusLoadRecommend) ||
                other.statusLoadRecommend == statusLoadRecommend) &&
            (identical(other.contentResult, contentResult) ||
                other.contentResult == contentResult) &&
            const DeepCollectionEquality()
                .equals(other._tarotList, _tarotList) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.shareLink, shareLink) ||
                other.shareLink == shareLink));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      statusLoadRecommend,
      contentResult,
      const DeepCollectionEquality().hash(_tarotList),
      isLiked,
      shareLink);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentResultStateImplCopyWith<_$ContentResultStateImpl> get copyWith =>
      __$$ContentResultStateImplCopyWithImpl<_$ContentResultStateImpl>(
          this, _$identity);
}

abstract class _ContentResultState implements ContentResultState {
  const factory _ContentResultState(
      {final Status status,
      final Status statusLoadRecommend,
      final ContentResult? contentResult,
      final List<Map<String, dynamic>>? tarotList,
      final bool isLiked,
      final String shareLink}) = _$ContentResultStateImpl;

  @override
  Status get status;
  @override
  Status get statusLoadRecommend;
  @override
  ContentResult? get contentResult;
  @override
  List<Map<String, dynamic>>? get tarotList;
  @override
  bool get isLiked;
  @override
  String get shareLink;
  @override
  @JsonKey(ignore: true)
  _$$ContentResultStateImplCopyWith<_$ContentResultStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ContentResultEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int contentId, String? shareCode) initial,
    required TResult Function(int contentId) checkLiked,
    required TResult Function(BuildContext context, int id) likeContent,
    required TResult Function(int purchaseId) loadShareLink,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int contentId, String? shareCode)? initial,
    TResult? Function(int contentId)? checkLiked,
    TResult? Function(BuildContext context, int id)? likeContent,
    TResult? Function(int purchaseId)? loadShareLink,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int contentId, String? shareCode)? initial,
    TResult Function(int contentId)? checkLiked,
    TResult Function(BuildContext context, int id)? likeContent,
    TResult Function(int purchaseId)? loadShareLink,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CheckLiked value) checkLiked,
    required TResult Function(LikeContent value) likeContent,
    required TResult Function(LoadShareLink value) loadShareLink,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CheckLiked value)? checkLiked,
    TResult? Function(LikeContent value)? likeContent,
    TResult? Function(LoadShareLink value)? loadShareLink,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CheckLiked value)? checkLiked,
    TResult Function(LikeContent value)? likeContent,
    TResult Function(LoadShareLink value)? loadShareLink,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentResultEventCopyWith<$Res> {
  factory $ContentResultEventCopyWith(
          ContentResultEvent value, $Res Function(ContentResultEvent) then) =
      _$ContentResultEventCopyWithImpl<$Res, ContentResultEvent>;
}

/// @nodoc
class _$ContentResultEventCopyWithImpl<$Res, $Val extends ContentResultEvent>
    implements $ContentResultEventCopyWith<$Res> {
  _$ContentResultEventCopyWithImpl(this._value, this._then);

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
  @useResult
  $Res call({int contentId, String? shareCode});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ContentResultEventCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? shareCode = freezed,
  }) {
    return _then(_$InitialImpl(
      null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int,
      freezed == shareCode
          ? _value.shareCode
          : shareCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(this.contentId, this.shareCode);

  @override
  final int contentId;
  @override
  final String? shareCode;

  @override
  String toString() {
    return 'ContentResultEvent.initial(contentId: $contentId, shareCode: $shareCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId) &&
            (identical(other.shareCode, shareCode) ||
                other.shareCode == shareCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, contentId, shareCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int contentId, String? shareCode) initial,
    required TResult Function(int contentId) checkLiked,
    required TResult Function(BuildContext context, int id) likeContent,
    required TResult Function(int purchaseId) loadShareLink,
  }) {
    return initial(contentId, shareCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int contentId, String? shareCode)? initial,
    TResult? Function(int contentId)? checkLiked,
    TResult? Function(BuildContext context, int id)? likeContent,
    TResult? Function(int purchaseId)? loadShareLink,
  }) {
    return initial?.call(contentId, shareCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int contentId, String? shareCode)? initial,
    TResult Function(int contentId)? checkLiked,
    TResult Function(BuildContext context, int id)? likeContent,
    TResult Function(int purchaseId)? loadShareLink,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(contentId, shareCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CheckLiked value) checkLiked,
    required TResult Function(LikeContent value) likeContent,
    required TResult Function(LoadShareLink value) loadShareLink,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CheckLiked value)? checkLiked,
    TResult? Function(LikeContent value)? likeContent,
    TResult? Function(LoadShareLink value)? loadShareLink,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CheckLiked value)? checkLiked,
    TResult Function(LikeContent value)? likeContent,
    TResult Function(LoadShareLink value)? loadShareLink,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ContentResultEvent {
  const factory _Initial(final int contentId, final String? shareCode) =
      _$InitialImpl;

  int get contentId;
  String? get shareCode;
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckLikedImplCopyWith<$Res> {
  factory _$$CheckLikedImplCopyWith(
          _$CheckLikedImpl value, $Res Function(_$CheckLikedImpl) then) =
      __$$CheckLikedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int contentId});
}

/// @nodoc
class __$$CheckLikedImplCopyWithImpl<$Res>
    extends _$ContentResultEventCopyWithImpl<$Res, _$CheckLikedImpl>
    implements _$$CheckLikedImplCopyWith<$Res> {
  __$$CheckLikedImplCopyWithImpl(
      _$CheckLikedImpl _value, $Res Function(_$CheckLikedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
  }) {
    return _then(_$CheckLikedImpl(
      null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CheckLikedImpl implements CheckLiked {
  const _$CheckLikedImpl(this.contentId);

  @override
  final int contentId;

  @override
  String toString() {
    return 'ContentResultEvent.checkLiked(contentId: $contentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckLikedImpl &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, contentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckLikedImplCopyWith<_$CheckLikedImpl> get copyWith =>
      __$$CheckLikedImplCopyWithImpl<_$CheckLikedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int contentId, String? shareCode) initial,
    required TResult Function(int contentId) checkLiked,
    required TResult Function(BuildContext context, int id) likeContent,
    required TResult Function(int purchaseId) loadShareLink,
  }) {
    return checkLiked(contentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int contentId, String? shareCode)? initial,
    TResult? Function(int contentId)? checkLiked,
    TResult? Function(BuildContext context, int id)? likeContent,
    TResult? Function(int purchaseId)? loadShareLink,
  }) {
    return checkLiked?.call(contentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int contentId, String? shareCode)? initial,
    TResult Function(int contentId)? checkLiked,
    TResult Function(BuildContext context, int id)? likeContent,
    TResult Function(int purchaseId)? loadShareLink,
    required TResult orElse(),
  }) {
    if (checkLiked != null) {
      return checkLiked(contentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CheckLiked value) checkLiked,
    required TResult Function(LikeContent value) likeContent,
    required TResult Function(LoadShareLink value) loadShareLink,
  }) {
    return checkLiked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CheckLiked value)? checkLiked,
    TResult? Function(LikeContent value)? likeContent,
    TResult? Function(LoadShareLink value)? loadShareLink,
  }) {
    return checkLiked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CheckLiked value)? checkLiked,
    TResult Function(LikeContent value)? likeContent,
    TResult Function(LoadShareLink value)? loadShareLink,
    required TResult orElse(),
  }) {
    if (checkLiked != null) {
      return checkLiked(this);
    }
    return orElse();
  }
}

abstract class CheckLiked implements ContentResultEvent {
  const factory CheckLiked(final int contentId) = _$CheckLikedImpl;

  int get contentId;
  @JsonKey(ignore: true)
  _$$CheckLikedImplCopyWith<_$CheckLikedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LikeContentImplCopyWith<$Res> {
  factory _$$LikeContentImplCopyWith(
          _$LikeContentImpl value, $Res Function(_$LikeContentImpl) then) =
      __$$LikeContentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context, int id});
}

/// @nodoc
class __$$LikeContentImplCopyWithImpl<$Res>
    extends _$ContentResultEventCopyWithImpl<$Res, _$LikeContentImpl>
    implements _$$LikeContentImplCopyWith<$Res> {
  __$$LikeContentImplCopyWithImpl(
      _$LikeContentImpl _value, $Res Function(_$LikeContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? id = null,
  }) {
    return _then(_$LikeContentImpl(
      null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LikeContentImpl implements LikeContent {
  const _$LikeContentImpl(this.context, this.id);

  @override
  final BuildContext context;
  @override
  final int id;

  @override
  String toString() {
    return 'ContentResultEvent.likeContent(context: $context, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikeContentImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LikeContentImplCopyWith<_$LikeContentImpl> get copyWith =>
      __$$LikeContentImplCopyWithImpl<_$LikeContentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int contentId, String? shareCode) initial,
    required TResult Function(int contentId) checkLiked,
    required TResult Function(BuildContext context, int id) likeContent,
    required TResult Function(int purchaseId) loadShareLink,
  }) {
    return likeContent(context, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int contentId, String? shareCode)? initial,
    TResult? Function(int contentId)? checkLiked,
    TResult? Function(BuildContext context, int id)? likeContent,
    TResult? Function(int purchaseId)? loadShareLink,
  }) {
    return likeContent?.call(context, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int contentId, String? shareCode)? initial,
    TResult Function(int contentId)? checkLiked,
    TResult Function(BuildContext context, int id)? likeContent,
    TResult Function(int purchaseId)? loadShareLink,
    required TResult orElse(),
  }) {
    if (likeContent != null) {
      return likeContent(context, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CheckLiked value) checkLiked,
    required TResult Function(LikeContent value) likeContent,
    required TResult Function(LoadShareLink value) loadShareLink,
  }) {
    return likeContent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CheckLiked value)? checkLiked,
    TResult? Function(LikeContent value)? likeContent,
    TResult? Function(LoadShareLink value)? loadShareLink,
  }) {
    return likeContent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CheckLiked value)? checkLiked,
    TResult Function(LikeContent value)? likeContent,
    TResult Function(LoadShareLink value)? loadShareLink,
    required TResult orElse(),
  }) {
    if (likeContent != null) {
      return likeContent(this);
    }
    return orElse();
  }
}

abstract class LikeContent implements ContentResultEvent {
  const factory LikeContent(final BuildContext context, final int id) =
      _$LikeContentImpl;

  BuildContext get context;
  int get id;
  @JsonKey(ignore: true)
  _$$LikeContentImplCopyWith<_$LikeContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadShareLinkImplCopyWith<$Res> {
  factory _$$LoadShareLinkImplCopyWith(
          _$LoadShareLinkImpl value, $Res Function(_$LoadShareLinkImpl) then) =
      __$$LoadShareLinkImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int purchaseId});
}

/// @nodoc
class __$$LoadShareLinkImplCopyWithImpl<$Res>
    extends _$ContentResultEventCopyWithImpl<$Res, _$LoadShareLinkImpl>
    implements _$$LoadShareLinkImplCopyWith<$Res> {
  __$$LoadShareLinkImplCopyWithImpl(
      _$LoadShareLinkImpl _value, $Res Function(_$LoadShareLinkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseId = null,
  }) {
    return _then(_$LoadShareLinkImpl(
      null == purchaseId
          ? _value.purchaseId
          : purchaseId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadShareLinkImpl implements LoadShareLink {
  const _$LoadShareLinkImpl(this.purchaseId);

  @override
  final int purchaseId;

  @override
  String toString() {
    return 'ContentResultEvent.loadShareLink(purchaseId: $purchaseId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadShareLinkImpl &&
            (identical(other.purchaseId, purchaseId) ||
                other.purchaseId == purchaseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, purchaseId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadShareLinkImplCopyWith<_$LoadShareLinkImpl> get copyWith =>
      __$$LoadShareLinkImplCopyWithImpl<_$LoadShareLinkImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int contentId, String? shareCode) initial,
    required TResult Function(int contentId) checkLiked,
    required TResult Function(BuildContext context, int id) likeContent,
    required TResult Function(int purchaseId) loadShareLink,
  }) {
    return loadShareLink(purchaseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int contentId, String? shareCode)? initial,
    TResult? Function(int contentId)? checkLiked,
    TResult? Function(BuildContext context, int id)? likeContent,
    TResult? Function(int purchaseId)? loadShareLink,
  }) {
    return loadShareLink?.call(purchaseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int contentId, String? shareCode)? initial,
    TResult Function(int contentId)? checkLiked,
    TResult Function(BuildContext context, int id)? likeContent,
    TResult Function(int purchaseId)? loadShareLink,
    required TResult orElse(),
  }) {
    if (loadShareLink != null) {
      return loadShareLink(purchaseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CheckLiked value) checkLiked,
    required TResult Function(LikeContent value) likeContent,
    required TResult Function(LoadShareLink value) loadShareLink,
  }) {
    return loadShareLink(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CheckLiked value)? checkLiked,
    TResult? Function(LikeContent value)? likeContent,
    TResult? Function(LoadShareLink value)? loadShareLink,
  }) {
    return loadShareLink?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CheckLiked value)? checkLiked,
    TResult Function(LikeContent value)? likeContent,
    TResult Function(LoadShareLink value)? loadShareLink,
    required TResult orElse(),
  }) {
    if (loadShareLink != null) {
      return loadShareLink(this);
    }
    return orElse();
  }
}

abstract class LoadShareLink implements ContentResultEvent {
  const factory LoadShareLink(final int purchaseId) = _$LoadShareLinkImpl;

  int get purchaseId;
  @JsonKey(ignore: true)
  _$$LoadShareLinkImplCopyWith<_$LoadShareLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
