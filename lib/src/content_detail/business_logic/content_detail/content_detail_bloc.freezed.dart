// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ContentDetailState {
  Status get status => throw _privateConstructorUsedError;
  Status get statusLoadPreview => throw _privateConstructorUsedError;
  Status get statusLoadFeedback => throw _privateConstructorUsedError;
  AppContent? get content => throw _privateConstructorUsedError;
  List<ContentPreview> get listPreview => throw _privateConstructorUsedError;
  bool get isValidInput => throw _privateConstructorUsedError;
  Status get statusLoadResult => throw _privateConstructorUsedError;
  ContentResult? get contentResult => throw _privateConstructorUsedError;
  ContentBasicArgument? get currentUser => throw _privateConstructorUsedError;
  ContentBasicArgument? get partner => throw _privateConstructorUsedError;
  bool get allowSubmitForm => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContentDetailStateCopyWith<ContentDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentDetailStateCopyWith<$Res> {
  factory $ContentDetailStateCopyWith(
          ContentDetailState value, $Res Function(ContentDetailState) then) =
      _$ContentDetailStateCopyWithImpl<$Res, ContentDetailState>;
  @useResult
  $Res call(
      {Status status,
      Status statusLoadPreview,
      Status statusLoadFeedback,
      AppContent? content,
      List<ContentPreview> listPreview,
      bool isValidInput,
      Status statusLoadResult,
      ContentResult? contentResult,
      ContentBasicArgument? currentUser,
      ContentBasicArgument? partner,
      bool allowSubmitForm,
      bool isLiked});

  $StatusCopyWith<$Res> get status;
  $StatusCopyWith<$Res> get statusLoadPreview;
  $StatusCopyWith<$Res> get statusLoadFeedback;
  $StatusCopyWith<$Res> get statusLoadResult;
}

/// @nodoc
class _$ContentDetailStateCopyWithImpl<$Res, $Val extends ContentDetailState>
    implements $ContentDetailStateCopyWith<$Res> {
  _$ContentDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusLoadPreview = null,
    Object? statusLoadFeedback = null,
    Object? content = freezed,
    Object? listPreview = null,
    Object? isValidInput = null,
    Object? statusLoadResult = null,
    Object? contentResult = freezed,
    Object? currentUser = freezed,
    Object? partner = freezed,
    Object? allowSubmitForm = null,
    Object? isLiked = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      statusLoadPreview: null == statusLoadPreview
          ? _value.statusLoadPreview
          : statusLoadPreview // ignore: cast_nullable_to_non_nullable
              as Status,
      statusLoadFeedback: null == statusLoadFeedback
          ? _value.statusLoadFeedback
          : statusLoadFeedback // ignore: cast_nullable_to_non_nullable
              as Status,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as AppContent?,
      listPreview: null == listPreview
          ? _value.listPreview
          : listPreview // ignore: cast_nullable_to_non_nullable
              as List<ContentPreview>,
      isValidInput: null == isValidInput
          ? _value.isValidInput
          : isValidInput // ignore: cast_nullable_to_non_nullable
              as bool,
      statusLoadResult: null == statusLoadResult
          ? _value.statusLoadResult
          : statusLoadResult // ignore: cast_nullable_to_non_nullable
              as Status,
      contentResult: freezed == contentResult
          ? _value.contentResult
          : contentResult // ignore: cast_nullable_to_non_nullable
              as ContentResult?,
      currentUser: freezed == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as ContentBasicArgument?,
      partner: freezed == partner
          ? _value.partner
          : partner // ignore: cast_nullable_to_non_nullable
              as ContentBasicArgument?,
      allowSubmitForm: null == allowSubmitForm
          ? _value.allowSubmitForm
          : allowSubmitForm // ignore: cast_nullable_to_non_nullable
              as bool,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
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

  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get statusLoadPreview {
    return $StatusCopyWith<$Res>(_value.statusLoadPreview, (value) {
      return _then(_value.copyWith(statusLoadPreview: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get statusLoadFeedback {
    return $StatusCopyWith<$Res>(_value.statusLoadFeedback, (value) {
      return _then(_value.copyWith(statusLoadFeedback: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get statusLoadResult {
    return $StatusCopyWith<$Res>(_value.statusLoadResult, (value) {
      return _then(_value.copyWith(statusLoadResult: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContentDetailStateImplCopyWith<$Res>
    implements $ContentDetailStateCopyWith<$Res> {
  factory _$$ContentDetailStateImplCopyWith(_$ContentDetailStateImpl value,
          $Res Function(_$ContentDetailStateImpl) then) =
      __$$ContentDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      Status statusLoadPreview,
      Status statusLoadFeedback,
      AppContent? content,
      List<ContentPreview> listPreview,
      bool isValidInput,
      Status statusLoadResult,
      ContentResult? contentResult,
      ContentBasicArgument? currentUser,
      ContentBasicArgument? partner,
      bool allowSubmitForm,
      bool isLiked});

  @override
  $StatusCopyWith<$Res> get status;
  @override
  $StatusCopyWith<$Res> get statusLoadPreview;
  @override
  $StatusCopyWith<$Res> get statusLoadFeedback;
  @override
  $StatusCopyWith<$Res> get statusLoadResult;
}

/// @nodoc
class __$$ContentDetailStateImplCopyWithImpl<$Res>
    extends _$ContentDetailStateCopyWithImpl<$Res, _$ContentDetailStateImpl>
    implements _$$ContentDetailStateImplCopyWith<$Res> {
  __$$ContentDetailStateImplCopyWithImpl(_$ContentDetailStateImpl _value,
      $Res Function(_$ContentDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? statusLoadPreview = null,
    Object? statusLoadFeedback = null,
    Object? content = freezed,
    Object? listPreview = null,
    Object? isValidInput = null,
    Object? statusLoadResult = null,
    Object? contentResult = freezed,
    Object? currentUser = freezed,
    Object? partner = freezed,
    Object? allowSubmitForm = null,
    Object? isLiked = null,
  }) {
    return _then(_$ContentDetailStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      statusLoadPreview: null == statusLoadPreview
          ? _value.statusLoadPreview
          : statusLoadPreview // ignore: cast_nullable_to_non_nullable
              as Status,
      statusLoadFeedback: null == statusLoadFeedback
          ? _value.statusLoadFeedback
          : statusLoadFeedback // ignore: cast_nullable_to_non_nullable
              as Status,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as AppContent?,
      listPreview: null == listPreview
          ? _value._listPreview
          : listPreview // ignore: cast_nullable_to_non_nullable
              as List<ContentPreview>,
      isValidInput: null == isValidInput
          ? _value.isValidInput
          : isValidInput // ignore: cast_nullable_to_non_nullable
              as bool,
      statusLoadResult: null == statusLoadResult
          ? _value.statusLoadResult
          : statusLoadResult // ignore: cast_nullable_to_non_nullable
              as Status,
      contentResult: freezed == contentResult
          ? _value.contentResult
          : contentResult // ignore: cast_nullable_to_non_nullable
              as ContentResult?,
      currentUser: freezed == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as ContentBasicArgument?,
      partner: freezed == partner
          ? _value.partner
          : partner // ignore: cast_nullable_to_non_nullable
              as ContentBasicArgument?,
      allowSubmitForm: null == allowSubmitForm
          ? _value.allowSubmitForm
          : allowSubmitForm // ignore: cast_nullable_to_non_nullable
              as bool,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ContentDetailStateImpl implements _ContentDetailState {
  const _$ContentDetailStateImpl(
      {this.status = const Status.idle(),
      this.statusLoadPreview = const Status.idle(),
      this.statusLoadFeedback = const Status.idle(),
      this.content,
      final List<ContentPreview> listPreview = const [],
      this.isValidInput = false,
      this.statusLoadResult = const Status.idle(),
      this.contentResult,
      this.currentUser,
      this.partner,
      this.allowSubmitForm = false,
      this.isLiked = false})
      : _listPreview = listPreview;

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final Status statusLoadPreview;
  @override
  @JsonKey()
  final Status statusLoadFeedback;
  @override
  final AppContent? content;
  final List<ContentPreview> _listPreview;
  @override
  @JsonKey()
  List<ContentPreview> get listPreview {
    if (_listPreview is EqualUnmodifiableListView) return _listPreview;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listPreview);
  }

  @override
  @JsonKey()
  final bool isValidInput;
  @override
  @JsonKey()
  final Status statusLoadResult;
  @override
  final ContentResult? contentResult;
  @override
  final ContentBasicArgument? currentUser;
  @override
  final ContentBasicArgument? partner;
  @override
  @JsonKey()
  final bool allowSubmitForm;
  @override
  @JsonKey()
  final bool isLiked;

  @override
  String toString() {
    return 'ContentDetailState(status: $status, statusLoadPreview: $statusLoadPreview, statusLoadFeedback: $statusLoadFeedback, content: $content, listPreview: $listPreview, isValidInput: $isValidInput, statusLoadResult: $statusLoadResult, contentResult: $contentResult, currentUser: $currentUser, partner: $partner, allowSubmitForm: $allowSubmitForm, isLiked: $isLiked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentDetailStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusLoadPreview, statusLoadPreview) ||
                other.statusLoadPreview == statusLoadPreview) &&
            (identical(other.statusLoadFeedback, statusLoadFeedback) ||
                other.statusLoadFeedback == statusLoadFeedback) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other._listPreview, _listPreview) &&
            (identical(other.isValidInput, isValidInput) ||
                other.isValidInput == isValidInput) &&
            (identical(other.statusLoadResult, statusLoadResult) ||
                other.statusLoadResult == statusLoadResult) &&
            (identical(other.contentResult, contentResult) ||
                other.contentResult == contentResult) &&
            (identical(other.currentUser, currentUser) ||
                other.currentUser == currentUser) &&
            (identical(other.partner, partner) || other.partner == partner) &&
            (identical(other.allowSubmitForm, allowSubmitForm) ||
                other.allowSubmitForm == allowSubmitForm) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      statusLoadPreview,
      statusLoadFeedback,
      content,
      const DeepCollectionEquality().hash(_listPreview),
      isValidInput,
      statusLoadResult,
      contentResult,
      currentUser,
      partner,
      allowSubmitForm,
      isLiked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentDetailStateImplCopyWith<_$ContentDetailStateImpl> get copyWith =>
      __$$ContentDetailStateImplCopyWithImpl<_$ContentDetailStateImpl>(
          this, _$identity);
}

abstract class _ContentDetailState implements ContentDetailState {
  const factory _ContentDetailState(
      {final Status status,
      final Status statusLoadPreview,
      final Status statusLoadFeedback,
      final AppContent? content,
      final List<ContentPreview> listPreview,
      final bool isValidInput,
      final Status statusLoadResult,
      final ContentResult? contentResult,
      final ContentBasicArgument? currentUser,
      final ContentBasicArgument? partner,
      final bool allowSubmitForm,
      final bool isLiked}) = _$ContentDetailStateImpl;

  @override
  Status get status;
  @override
  Status get statusLoadPreview;
  @override
  Status get statusLoadFeedback;
  @override
  AppContent? get content;
  @override
  List<ContentPreview> get listPreview;
  @override
  bool get isValidInput;
  @override
  Status get statusLoadResult;
  @override
  ContentResult? get contentResult;
  @override
  ContentBasicArgument? get currentUser;
  @override
  ContentBasicArgument? get partner;
  @override
  bool get allowSubmitForm;
  @override
  bool get isLiked;
  @override
  @JsonKey(ignore: true)
  _$$ContentDetailStateImplCopyWith<_$ContentDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ContentDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int contentId) initial,
    required TResult Function(int contentId) loadPreviews,
    required TResult Function(int contentId) checkLiked,
    required TResult Function(BuildContext context) likeContent,
    required TResult Function(bool result) onValidInput,
    required TResult Function(
            int contentId, String name, String gender, String value)
        loadResultJuyeog,
    required TResult Function() resetInput,
    required TResult Function(ContentBasicArgument input, bool isPartner)
        updateInput,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int contentId)? initial,
    TResult? Function(int contentId)? loadPreviews,
    TResult? Function(int contentId)? checkLiked,
    TResult? Function(BuildContext context)? likeContent,
    TResult? Function(bool result)? onValidInput,
    TResult? Function(int contentId, String name, String gender, String value)?
        loadResultJuyeog,
    TResult? Function()? resetInput,
    TResult? Function(ContentBasicArgument input, bool isPartner)? updateInput,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int contentId)? initial,
    TResult Function(int contentId)? loadPreviews,
    TResult Function(int contentId)? checkLiked,
    TResult Function(BuildContext context)? likeContent,
    TResult Function(bool result)? onValidInput,
    TResult Function(int contentId, String name, String gender, String value)?
        loadResultJuyeog,
    TResult Function()? resetInput,
    TResult Function(ContentBasicArgument input, bool isPartner)? updateInput,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(LoadPreview value) loadPreviews,
    required TResult Function(CheckLiked value) checkLiked,
    required TResult Function(LikeContent value) likeContent,
    required TResult Function(ValidateInput value) onValidInput,
    required TResult Function(LoadResultJuyeog value) loadResultJuyeog,
    required TResult Function(ResetInput value) resetInput,
    required TResult Function(UpdateInput value) updateInput,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(LoadPreview value)? loadPreviews,
    TResult? Function(CheckLiked value)? checkLiked,
    TResult? Function(LikeContent value)? likeContent,
    TResult? Function(ValidateInput value)? onValidInput,
    TResult? Function(LoadResultJuyeog value)? loadResultJuyeog,
    TResult? Function(ResetInput value)? resetInput,
    TResult? Function(UpdateInput value)? updateInput,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadPreview value)? loadPreviews,
    TResult Function(CheckLiked value)? checkLiked,
    TResult Function(LikeContent value)? likeContent,
    TResult Function(ValidateInput value)? onValidInput,
    TResult Function(LoadResultJuyeog value)? loadResultJuyeog,
    TResult Function(ResetInput value)? resetInput,
    TResult Function(UpdateInput value)? updateInput,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentDetailEventCopyWith<$Res> {
  factory $ContentDetailEventCopyWith(
          ContentDetailEvent value, $Res Function(ContentDetailEvent) then) =
      _$ContentDetailEventCopyWithImpl<$Res, ContentDetailEvent>;
}

/// @nodoc
class _$ContentDetailEventCopyWithImpl<$Res, $Val extends ContentDetailEvent>
    implements $ContentDetailEventCopyWith<$Res> {
  _$ContentDetailEventCopyWithImpl(this._value, this._then);

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
  $Res call({int contentId});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ContentDetailEventCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
  }) {
    return _then(_$InitialImpl(
      null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(this.contentId);

  @override
  final int contentId;

  @override
  String toString() {
    return 'ContentDetailEvent.initial(contentId: $contentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, contentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int contentId) initial,
    required TResult Function(int contentId) loadPreviews,
    required TResult Function(int contentId) checkLiked,
    required TResult Function(BuildContext context) likeContent,
    required TResult Function(bool result) onValidInput,
    required TResult Function(
            int contentId, String name, String gender, String value)
        loadResultJuyeog,
    required TResult Function() resetInput,
    required TResult Function(ContentBasicArgument input, bool isPartner)
        updateInput,
  }) {
    return initial(contentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int contentId)? initial,
    TResult? Function(int contentId)? loadPreviews,
    TResult? Function(int contentId)? checkLiked,
    TResult? Function(BuildContext context)? likeContent,
    TResult? Function(bool result)? onValidInput,
    TResult? Function(int contentId, String name, String gender, String value)?
        loadResultJuyeog,
    TResult? Function()? resetInput,
    TResult? Function(ContentBasicArgument input, bool isPartner)? updateInput,
  }) {
    return initial?.call(contentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int contentId)? initial,
    TResult Function(int contentId)? loadPreviews,
    TResult Function(int contentId)? checkLiked,
    TResult Function(BuildContext context)? likeContent,
    TResult Function(bool result)? onValidInput,
    TResult Function(int contentId, String name, String gender, String value)?
        loadResultJuyeog,
    TResult Function()? resetInput,
    TResult Function(ContentBasicArgument input, bool isPartner)? updateInput,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(contentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(LoadPreview value) loadPreviews,
    required TResult Function(CheckLiked value) checkLiked,
    required TResult Function(LikeContent value) likeContent,
    required TResult Function(ValidateInput value) onValidInput,
    required TResult Function(LoadResultJuyeog value) loadResultJuyeog,
    required TResult Function(ResetInput value) resetInput,
    required TResult Function(UpdateInput value) updateInput,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(LoadPreview value)? loadPreviews,
    TResult? Function(CheckLiked value)? checkLiked,
    TResult? Function(LikeContent value)? likeContent,
    TResult? Function(ValidateInput value)? onValidInput,
    TResult? Function(LoadResultJuyeog value)? loadResultJuyeog,
    TResult? Function(ResetInput value)? resetInput,
    TResult? Function(UpdateInput value)? updateInput,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadPreview value)? loadPreviews,
    TResult Function(CheckLiked value)? checkLiked,
    TResult Function(LikeContent value)? likeContent,
    TResult Function(ValidateInput value)? onValidInput,
    TResult Function(LoadResultJuyeog value)? loadResultJuyeog,
    TResult Function(ResetInput value)? resetInput,
    TResult Function(UpdateInput value)? updateInput,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ContentDetailEvent {
  const factory _Initial(final int contentId) = _$InitialImpl;

  int get contentId;
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadPreviewImplCopyWith<$Res> {
  factory _$$LoadPreviewImplCopyWith(
          _$LoadPreviewImpl value, $Res Function(_$LoadPreviewImpl) then) =
      __$$LoadPreviewImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int contentId});
}

/// @nodoc
class __$$LoadPreviewImplCopyWithImpl<$Res>
    extends _$ContentDetailEventCopyWithImpl<$Res, _$LoadPreviewImpl>
    implements _$$LoadPreviewImplCopyWith<$Res> {
  __$$LoadPreviewImplCopyWithImpl(
      _$LoadPreviewImpl _value, $Res Function(_$LoadPreviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
  }) {
    return _then(_$LoadPreviewImpl(
      null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadPreviewImpl implements LoadPreview {
  const _$LoadPreviewImpl(this.contentId);

  @override
  final int contentId;

  @override
  String toString() {
    return 'ContentDetailEvent.loadPreviews(contentId: $contentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadPreviewImpl &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, contentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadPreviewImplCopyWith<_$LoadPreviewImpl> get copyWith =>
      __$$LoadPreviewImplCopyWithImpl<_$LoadPreviewImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int contentId) initial,
    required TResult Function(int contentId) loadPreviews,
    required TResult Function(int contentId) checkLiked,
    required TResult Function(BuildContext context) likeContent,
    required TResult Function(bool result) onValidInput,
    required TResult Function(
            int contentId, String name, String gender, String value)
        loadResultJuyeog,
    required TResult Function() resetInput,
    required TResult Function(ContentBasicArgument input, bool isPartner)
        updateInput,
  }) {
    return loadPreviews(contentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int contentId)? initial,
    TResult? Function(int contentId)? loadPreviews,
    TResult? Function(int contentId)? checkLiked,
    TResult? Function(BuildContext context)? likeContent,
    TResult? Function(bool result)? onValidInput,
    TResult? Function(int contentId, String name, String gender, String value)?
        loadResultJuyeog,
    TResult? Function()? resetInput,
    TResult? Function(ContentBasicArgument input, bool isPartner)? updateInput,
  }) {
    return loadPreviews?.call(contentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int contentId)? initial,
    TResult Function(int contentId)? loadPreviews,
    TResult Function(int contentId)? checkLiked,
    TResult Function(BuildContext context)? likeContent,
    TResult Function(bool result)? onValidInput,
    TResult Function(int contentId, String name, String gender, String value)?
        loadResultJuyeog,
    TResult Function()? resetInput,
    TResult Function(ContentBasicArgument input, bool isPartner)? updateInput,
    required TResult orElse(),
  }) {
    if (loadPreviews != null) {
      return loadPreviews(contentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(LoadPreview value) loadPreviews,
    required TResult Function(CheckLiked value) checkLiked,
    required TResult Function(LikeContent value) likeContent,
    required TResult Function(ValidateInput value) onValidInput,
    required TResult Function(LoadResultJuyeog value) loadResultJuyeog,
    required TResult Function(ResetInput value) resetInput,
    required TResult Function(UpdateInput value) updateInput,
  }) {
    return loadPreviews(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(LoadPreview value)? loadPreviews,
    TResult? Function(CheckLiked value)? checkLiked,
    TResult? Function(LikeContent value)? likeContent,
    TResult? Function(ValidateInput value)? onValidInput,
    TResult? Function(LoadResultJuyeog value)? loadResultJuyeog,
    TResult? Function(ResetInput value)? resetInput,
    TResult? Function(UpdateInput value)? updateInput,
  }) {
    return loadPreviews?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadPreview value)? loadPreviews,
    TResult Function(CheckLiked value)? checkLiked,
    TResult Function(LikeContent value)? likeContent,
    TResult Function(ValidateInput value)? onValidInput,
    TResult Function(LoadResultJuyeog value)? loadResultJuyeog,
    TResult Function(ResetInput value)? resetInput,
    TResult Function(UpdateInput value)? updateInput,
    required TResult orElse(),
  }) {
    if (loadPreviews != null) {
      return loadPreviews(this);
    }
    return orElse();
  }
}

abstract class LoadPreview implements ContentDetailEvent {
  const factory LoadPreview(final int contentId) = _$LoadPreviewImpl;

  int get contentId;
  @JsonKey(ignore: true)
  _$$LoadPreviewImplCopyWith<_$LoadPreviewImpl> get copyWith =>
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
    extends _$ContentDetailEventCopyWithImpl<$Res, _$CheckLikedImpl>
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
    return 'ContentDetailEvent.checkLiked(contentId: $contentId)';
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
    required TResult Function(int contentId) initial,
    required TResult Function(int contentId) loadPreviews,
    required TResult Function(int contentId) checkLiked,
    required TResult Function(BuildContext context) likeContent,
    required TResult Function(bool result) onValidInput,
    required TResult Function(
            int contentId, String name, String gender, String value)
        loadResultJuyeog,
    required TResult Function() resetInput,
    required TResult Function(ContentBasicArgument input, bool isPartner)
        updateInput,
  }) {
    return checkLiked(contentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int contentId)? initial,
    TResult? Function(int contentId)? loadPreviews,
    TResult? Function(int contentId)? checkLiked,
    TResult? Function(BuildContext context)? likeContent,
    TResult? Function(bool result)? onValidInput,
    TResult? Function(int contentId, String name, String gender, String value)?
        loadResultJuyeog,
    TResult? Function()? resetInput,
    TResult? Function(ContentBasicArgument input, bool isPartner)? updateInput,
  }) {
    return checkLiked?.call(contentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int contentId)? initial,
    TResult Function(int contentId)? loadPreviews,
    TResult Function(int contentId)? checkLiked,
    TResult Function(BuildContext context)? likeContent,
    TResult Function(bool result)? onValidInput,
    TResult Function(int contentId, String name, String gender, String value)?
        loadResultJuyeog,
    TResult Function()? resetInput,
    TResult Function(ContentBasicArgument input, bool isPartner)? updateInput,
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
    required TResult Function(LoadPreview value) loadPreviews,
    required TResult Function(CheckLiked value) checkLiked,
    required TResult Function(LikeContent value) likeContent,
    required TResult Function(ValidateInput value) onValidInput,
    required TResult Function(LoadResultJuyeog value) loadResultJuyeog,
    required TResult Function(ResetInput value) resetInput,
    required TResult Function(UpdateInput value) updateInput,
  }) {
    return checkLiked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(LoadPreview value)? loadPreviews,
    TResult? Function(CheckLiked value)? checkLiked,
    TResult? Function(LikeContent value)? likeContent,
    TResult? Function(ValidateInput value)? onValidInput,
    TResult? Function(LoadResultJuyeog value)? loadResultJuyeog,
    TResult? Function(ResetInput value)? resetInput,
    TResult? Function(UpdateInput value)? updateInput,
  }) {
    return checkLiked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadPreview value)? loadPreviews,
    TResult Function(CheckLiked value)? checkLiked,
    TResult Function(LikeContent value)? likeContent,
    TResult Function(ValidateInput value)? onValidInput,
    TResult Function(LoadResultJuyeog value)? loadResultJuyeog,
    TResult Function(ResetInput value)? resetInput,
    TResult Function(UpdateInput value)? updateInput,
    required TResult orElse(),
  }) {
    if (checkLiked != null) {
      return checkLiked(this);
    }
    return orElse();
  }
}

abstract class CheckLiked implements ContentDetailEvent {
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
  $Res call({BuildContext context});
}

/// @nodoc
class __$$LikeContentImplCopyWithImpl<$Res>
    extends _$ContentDetailEventCopyWithImpl<$Res, _$LikeContentImpl>
    implements _$$LikeContentImplCopyWith<$Res> {
  __$$LikeContentImplCopyWithImpl(
      _$LikeContentImpl _value, $Res Function(_$LikeContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
  }) {
    return _then(_$LikeContentImpl(
      null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$LikeContentImpl implements LikeContent {
  const _$LikeContentImpl(this.context);

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'ContentDetailEvent.likeContent(context: $context)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikeContentImpl &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LikeContentImplCopyWith<_$LikeContentImpl> get copyWith =>
      __$$LikeContentImplCopyWithImpl<_$LikeContentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int contentId) initial,
    required TResult Function(int contentId) loadPreviews,
    required TResult Function(int contentId) checkLiked,
    required TResult Function(BuildContext context) likeContent,
    required TResult Function(bool result) onValidInput,
    required TResult Function(
            int contentId, String name, String gender, String value)
        loadResultJuyeog,
    required TResult Function() resetInput,
    required TResult Function(ContentBasicArgument input, bool isPartner)
        updateInput,
  }) {
    return likeContent(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int contentId)? initial,
    TResult? Function(int contentId)? loadPreviews,
    TResult? Function(int contentId)? checkLiked,
    TResult? Function(BuildContext context)? likeContent,
    TResult? Function(bool result)? onValidInput,
    TResult? Function(int contentId, String name, String gender, String value)?
        loadResultJuyeog,
    TResult? Function()? resetInput,
    TResult? Function(ContentBasicArgument input, bool isPartner)? updateInput,
  }) {
    return likeContent?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int contentId)? initial,
    TResult Function(int contentId)? loadPreviews,
    TResult Function(int contentId)? checkLiked,
    TResult Function(BuildContext context)? likeContent,
    TResult Function(bool result)? onValidInput,
    TResult Function(int contentId, String name, String gender, String value)?
        loadResultJuyeog,
    TResult Function()? resetInput,
    TResult Function(ContentBasicArgument input, bool isPartner)? updateInput,
    required TResult orElse(),
  }) {
    if (likeContent != null) {
      return likeContent(context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(LoadPreview value) loadPreviews,
    required TResult Function(CheckLiked value) checkLiked,
    required TResult Function(LikeContent value) likeContent,
    required TResult Function(ValidateInput value) onValidInput,
    required TResult Function(LoadResultJuyeog value) loadResultJuyeog,
    required TResult Function(ResetInput value) resetInput,
    required TResult Function(UpdateInput value) updateInput,
  }) {
    return likeContent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(LoadPreview value)? loadPreviews,
    TResult? Function(CheckLiked value)? checkLiked,
    TResult? Function(LikeContent value)? likeContent,
    TResult? Function(ValidateInput value)? onValidInput,
    TResult? Function(LoadResultJuyeog value)? loadResultJuyeog,
    TResult? Function(ResetInput value)? resetInput,
    TResult? Function(UpdateInput value)? updateInput,
  }) {
    return likeContent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadPreview value)? loadPreviews,
    TResult Function(CheckLiked value)? checkLiked,
    TResult Function(LikeContent value)? likeContent,
    TResult Function(ValidateInput value)? onValidInput,
    TResult Function(LoadResultJuyeog value)? loadResultJuyeog,
    TResult Function(ResetInput value)? resetInput,
    TResult Function(UpdateInput value)? updateInput,
    required TResult orElse(),
  }) {
    if (likeContent != null) {
      return likeContent(this);
    }
    return orElse();
  }
}

abstract class LikeContent implements ContentDetailEvent {
  const factory LikeContent(final BuildContext context) = _$LikeContentImpl;

  BuildContext get context;
  @JsonKey(ignore: true)
  _$$LikeContentImplCopyWith<_$LikeContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidateInputImplCopyWith<$Res> {
  factory _$$ValidateInputImplCopyWith(
          _$ValidateInputImpl value, $Res Function(_$ValidateInputImpl) then) =
      __$$ValidateInputImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool result});
}

/// @nodoc
class __$$ValidateInputImplCopyWithImpl<$Res>
    extends _$ContentDetailEventCopyWithImpl<$Res, _$ValidateInputImpl>
    implements _$$ValidateInputImplCopyWith<$Res> {
  __$$ValidateInputImplCopyWithImpl(
      _$ValidateInputImpl _value, $Res Function(_$ValidateInputImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$ValidateInputImpl(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ValidateInputImpl implements ValidateInput {
  const _$ValidateInputImpl(this.result);

  @override
  final bool result;

  @override
  String toString() {
    return 'ContentDetailEvent.onValidInput(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidateInputImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidateInputImplCopyWith<_$ValidateInputImpl> get copyWith =>
      __$$ValidateInputImplCopyWithImpl<_$ValidateInputImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int contentId) initial,
    required TResult Function(int contentId) loadPreviews,
    required TResult Function(int contentId) checkLiked,
    required TResult Function(BuildContext context) likeContent,
    required TResult Function(bool result) onValidInput,
    required TResult Function(
            int contentId, String name, String gender, String value)
        loadResultJuyeog,
    required TResult Function() resetInput,
    required TResult Function(ContentBasicArgument input, bool isPartner)
        updateInput,
  }) {
    return onValidInput(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int contentId)? initial,
    TResult? Function(int contentId)? loadPreviews,
    TResult? Function(int contentId)? checkLiked,
    TResult? Function(BuildContext context)? likeContent,
    TResult? Function(bool result)? onValidInput,
    TResult? Function(int contentId, String name, String gender, String value)?
        loadResultJuyeog,
    TResult? Function()? resetInput,
    TResult? Function(ContentBasicArgument input, bool isPartner)? updateInput,
  }) {
    return onValidInput?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int contentId)? initial,
    TResult Function(int contentId)? loadPreviews,
    TResult Function(int contentId)? checkLiked,
    TResult Function(BuildContext context)? likeContent,
    TResult Function(bool result)? onValidInput,
    TResult Function(int contentId, String name, String gender, String value)?
        loadResultJuyeog,
    TResult Function()? resetInput,
    TResult Function(ContentBasicArgument input, bool isPartner)? updateInput,
    required TResult orElse(),
  }) {
    if (onValidInput != null) {
      return onValidInput(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(LoadPreview value) loadPreviews,
    required TResult Function(CheckLiked value) checkLiked,
    required TResult Function(LikeContent value) likeContent,
    required TResult Function(ValidateInput value) onValidInput,
    required TResult Function(LoadResultJuyeog value) loadResultJuyeog,
    required TResult Function(ResetInput value) resetInput,
    required TResult Function(UpdateInput value) updateInput,
  }) {
    return onValidInput(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(LoadPreview value)? loadPreviews,
    TResult? Function(CheckLiked value)? checkLiked,
    TResult? Function(LikeContent value)? likeContent,
    TResult? Function(ValidateInput value)? onValidInput,
    TResult? Function(LoadResultJuyeog value)? loadResultJuyeog,
    TResult? Function(ResetInput value)? resetInput,
    TResult? Function(UpdateInput value)? updateInput,
  }) {
    return onValidInput?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadPreview value)? loadPreviews,
    TResult Function(CheckLiked value)? checkLiked,
    TResult Function(LikeContent value)? likeContent,
    TResult Function(ValidateInput value)? onValidInput,
    TResult Function(LoadResultJuyeog value)? loadResultJuyeog,
    TResult Function(ResetInput value)? resetInput,
    TResult Function(UpdateInput value)? updateInput,
    required TResult orElse(),
  }) {
    if (onValidInput != null) {
      return onValidInput(this);
    }
    return orElse();
  }
}

abstract class ValidateInput implements ContentDetailEvent {
  const factory ValidateInput(final bool result) = _$ValidateInputImpl;

  bool get result;
  @JsonKey(ignore: true)
  _$$ValidateInputImplCopyWith<_$ValidateInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadResultJuyeogImplCopyWith<$Res> {
  factory _$$LoadResultJuyeogImplCopyWith(_$LoadResultJuyeogImpl value,
          $Res Function(_$LoadResultJuyeogImpl) then) =
      __$$LoadResultJuyeogImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int contentId, String name, String gender, String value});
}

/// @nodoc
class __$$LoadResultJuyeogImplCopyWithImpl<$Res>
    extends _$ContentDetailEventCopyWithImpl<$Res, _$LoadResultJuyeogImpl>
    implements _$$LoadResultJuyeogImplCopyWith<$Res> {
  __$$LoadResultJuyeogImplCopyWithImpl(_$LoadResultJuyeogImpl _value,
      $Res Function(_$LoadResultJuyeogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentId = null,
    Object? name = null,
    Object? gender = null,
    Object? value = null,
  }) {
    return _then(_$LoadResultJuyeogImpl(
      null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as int,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadResultJuyeogImpl implements LoadResultJuyeog {
  const _$LoadResultJuyeogImpl(
      this.contentId, this.name, this.gender, this.value);

  @override
  final int contentId;
  @override
  final String name;
  @override
  final String gender;
  @override
  final String value;

  @override
  String toString() {
    return 'ContentDetailEvent.loadResultJuyeog(contentId: $contentId, name: $name, gender: $gender, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadResultJuyeogImpl &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, contentId, name, gender, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadResultJuyeogImplCopyWith<_$LoadResultJuyeogImpl> get copyWith =>
      __$$LoadResultJuyeogImplCopyWithImpl<_$LoadResultJuyeogImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int contentId) initial,
    required TResult Function(int contentId) loadPreviews,
    required TResult Function(int contentId) checkLiked,
    required TResult Function(BuildContext context) likeContent,
    required TResult Function(bool result) onValidInput,
    required TResult Function(
            int contentId, String name, String gender, String value)
        loadResultJuyeog,
    required TResult Function() resetInput,
    required TResult Function(ContentBasicArgument input, bool isPartner)
        updateInput,
  }) {
    return loadResultJuyeog(contentId, name, gender, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int contentId)? initial,
    TResult? Function(int contentId)? loadPreviews,
    TResult? Function(int contentId)? checkLiked,
    TResult? Function(BuildContext context)? likeContent,
    TResult? Function(bool result)? onValidInput,
    TResult? Function(int contentId, String name, String gender, String value)?
        loadResultJuyeog,
    TResult? Function()? resetInput,
    TResult? Function(ContentBasicArgument input, bool isPartner)? updateInput,
  }) {
    return loadResultJuyeog?.call(contentId, name, gender, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int contentId)? initial,
    TResult Function(int contentId)? loadPreviews,
    TResult Function(int contentId)? checkLiked,
    TResult Function(BuildContext context)? likeContent,
    TResult Function(bool result)? onValidInput,
    TResult Function(int contentId, String name, String gender, String value)?
        loadResultJuyeog,
    TResult Function()? resetInput,
    TResult Function(ContentBasicArgument input, bool isPartner)? updateInput,
    required TResult orElse(),
  }) {
    if (loadResultJuyeog != null) {
      return loadResultJuyeog(contentId, name, gender, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(LoadPreview value) loadPreviews,
    required TResult Function(CheckLiked value) checkLiked,
    required TResult Function(LikeContent value) likeContent,
    required TResult Function(ValidateInput value) onValidInput,
    required TResult Function(LoadResultJuyeog value) loadResultJuyeog,
    required TResult Function(ResetInput value) resetInput,
    required TResult Function(UpdateInput value) updateInput,
  }) {
    return loadResultJuyeog(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(LoadPreview value)? loadPreviews,
    TResult? Function(CheckLiked value)? checkLiked,
    TResult? Function(LikeContent value)? likeContent,
    TResult? Function(ValidateInput value)? onValidInput,
    TResult? Function(LoadResultJuyeog value)? loadResultJuyeog,
    TResult? Function(ResetInput value)? resetInput,
    TResult? Function(UpdateInput value)? updateInput,
  }) {
    return loadResultJuyeog?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadPreview value)? loadPreviews,
    TResult Function(CheckLiked value)? checkLiked,
    TResult Function(LikeContent value)? likeContent,
    TResult Function(ValidateInput value)? onValidInput,
    TResult Function(LoadResultJuyeog value)? loadResultJuyeog,
    TResult Function(ResetInput value)? resetInput,
    TResult Function(UpdateInput value)? updateInput,
    required TResult orElse(),
  }) {
    if (loadResultJuyeog != null) {
      return loadResultJuyeog(this);
    }
    return orElse();
  }
}

abstract class LoadResultJuyeog implements ContentDetailEvent {
  const factory LoadResultJuyeog(final int contentId, final String name,
      final String gender, final String value) = _$LoadResultJuyeogImpl;

  int get contentId;
  String get name;
  String get gender;
  String get value;
  @JsonKey(ignore: true)
  _$$LoadResultJuyeogImplCopyWith<_$LoadResultJuyeogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetInputImplCopyWith<$Res> {
  factory _$$ResetInputImplCopyWith(
          _$ResetInputImpl value, $Res Function(_$ResetInputImpl) then) =
      __$$ResetInputImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetInputImplCopyWithImpl<$Res>
    extends _$ContentDetailEventCopyWithImpl<$Res, _$ResetInputImpl>
    implements _$$ResetInputImplCopyWith<$Res> {
  __$$ResetInputImplCopyWithImpl(
      _$ResetInputImpl _value, $Res Function(_$ResetInputImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetInputImpl implements ResetInput {
  const _$ResetInputImpl();

  @override
  String toString() {
    return 'ContentDetailEvent.resetInput()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetInputImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int contentId) initial,
    required TResult Function(int contentId) loadPreviews,
    required TResult Function(int contentId) checkLiked,
    required TResult Function(BuildContext context) likeContent,
    required TResult Function(bool result) onValidInput,
    required TResult Function(
            int contentId, String name, String gender, String value)
        loadResultJuyeog,
    required TResult Function() resetInput,
    required TResult Function(ContentBasicArgument input, bool isPartner)
        updateInput,
  }) {
    return resetInput();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int contentId)? initial,
    TResult? Function(int contentId)? loadPreviews,
    TResult? Function(int contentId)? checkLiked,
    TResult? Function(BuildContext context)? likeContent,
    TResult? Function(bool result)? onValidInput,
    TResult? Function(int contentId, String name, String gender, String value)?
        loadResultJuyeog,
    TResult? Function()? resetInput,
    TResult? Function(ContentBasicArgument input, bool isPartner)? updateInput,
  }) {
    return resetInput?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int contentId)? initial,
    TResult Function(int contentId)? loadPreviews,
    TResult Function(int contentId)? checkLiked,
    TResult Function(BuildContext context)? likeContent,
    TResult Function(bool result)? onValidInput,
    TResult Function(int contentId, String name, String gender, String value)?
        loadResultJuyeog,
    TResult Function()? resetInput,
    TResult Function(ContentBasicArgument input, bool isPartner)? updateInput,
    required TResult orElse(),
  }) {
    if (resetInput != null) {
      return resetInput();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(LoadPreview value) loadPreviews,
    required TResult Function(CheckLiked value) checkLiked,
    required TResult Function(LikeContent value) likeContent,
    required TResult Function(ValidateInput value) onValidInput,
    required TResult Function(LoadResultJuyeog value) loadResultJuyeog,
    required TResult Function(ResetInput value) resetInput,
    required TResult Function(UpdateInput value) updateInput,
  }) {
    return resetInput(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(LoadPreview value)? loadPreviews,
    TResult? Function(CheckLiked value)? checkLiked,
    TResult? Function(LikeContent value)? likeContent,
    TResult? Function(ValidateInput value)? onValidInput,
    TResult? Function(LoadResultJuyeog value)? loadResultJuyeog,
    TResult? Function(ResetInput value)? resetInput,
    TResult? Function(UpdateInput value)? updateInput,
  }) {
    return resetInput?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadPreview value)? loadPreviews,
    TResult Function(CheckLiked value)? checkLiked,
    TResult Function(LikeContent value)? likeContent,
    TResult Function(ValidateInput value)? onValidInput,
    TResult Function(LoadResultJuyeog value)? loadResultJuyeog,
    TResult Function(ResetInput value)? resetInput,
    TResult Function(UpdateInput value)? updateInput,
    required TResult orElse(),
  }) {
    if (resetInput != null) {
      return resetInput(this);
    }
    return orElse();
  }
}

abstract class ResetInput implements ContentDetailEvent {
  const factory ResetInput() = _$ResetInputImpl;
}

/// @nodoc
abstract class _$$UpdateInputImplCopyWith<$Res> {
  factory _$$UpdateInputImplCopyWith(
          _$UpdateInputImpl value, $Res Function(_$UpdateInputImpl) then) =
      __$$UpdateInputImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ContentBasicArgument input, bool isPartner});
}

/// @nodoc
class __$$UpdateInputImplCopyWithImpl<$Res>
    extends _$ContentDetailEventCopyWithImpl<$Res, _$UpdateInputImpl>
    implements _$$UpdateInputImplCopyWith<$Res> {
  __$$UpdateInputImplCopyWithImpl(
      _$UpdateInputImpl _value, $Res Function(_$UpdateInputImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? input = null,
    Object? isPartner = null,
  }) {
    return _then(_$UpdateInputImpl(
      null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as ContentBasicArgument,
      null == isPartner
          ? _value.isPartner
          : isPartner // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UpdateInputImpl implements UpdateInput {
  const _$UpdateInputImpl(this.input, this.isPartner);

  @override
  final ContentBasicArgument input;
  @override
  final bool isPartner;

  @override
  String toString() {
    return 'ContentDetailEvent.updateInput(input: $input, isPartner: $isPartner)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateInputImpl &&
            (identical(other.input, input) || other.input == input) &&
            (identical(other.isPartner, isPartner) ||
                other.isPartner == isPartner));
  }

  @override
  int get hashCode => Object.hash(runtimeType, input, isPartner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateInputImplCopyWith<_$UpdateInputImpl> get copyWith =>
      __$$UpdateInputImplCopyWithImpl<_$UpdateInputImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int contentId) initial,
    required TResult Function(int contentId) loadPreviews,
    required TResult Function(int contentId) checkLiked,
    required TResult Function(BuildContext context) likeContent,
    required TResult Function(bool result) onValidInput,
    required TResult Function(
            int contentId, String name, String gender, String value)
        loadResultJuyeog,
    required TResult Function() resetInput,
    required TResult Function(ContentBasicArgument input, bool isPartner)
        updateInput,
  }) {
    return updateInput(input, isPartner);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int contentId)? initial,
    TResult? Function(int contentId)? loadPreviews,
    TResult? Function(int contentId)? checkLiked,
    TResult? Function(BuildContext context)? likeContent,
    TResult? Function(bool result)? onValidInput,
    TResult? Function(int contentId, String name, String gender, String value)?
        loadResultJuyeog,
    TResult? Function()? resetInput,
    TResult? Function(ContentBasicArgument input, bool isPartner)? updateInput,
  }) {
    return updateInput?.call(input, isPartner);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int contentId)? initial,
    TResult Function(int contentId)? loadPreviews,
    TResult Function(int contentId)? checkLiked,
    TResult Function(BuildContext context)? likeContent,
    TResult Function(bool result)? onValidInput,
    TResult Function(int contentId, String name, String gender, String value)?
        loadResultJuyeog,
    TResult Function()? resetInput,
    TResult Function(ContentBasicArgument input, bool isPartner)? updateInput,
    required TResult orElse(),
  }) {
    if (updateInput != null) {
      return updateInput(input, isPartner);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(LoadPreview value) loadPreviews,
    required TResult Function(CheckLiked value) checkLiked,
    required TResult Function(LikeContent value) likeContent,
    required TResult Function(ValidateInput value) onValidInput,
    required TResult Function(LoadResultJuyeog value) loadResultJuyeog,
    required TResult Function(ResetInput value) resetInput,
    required TResult Function(UpdateInput value) updateInput,
  }) {
    return updateInput(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(LoadPreview value)? loadPreviews,
    TResult? Function(CheckLiked value)? checkLiked,
    TResult? Function(LikeContent value)? likeContent,
    TResult? Function(ValidateInput value)? onValidInput,
    TResult? Function(LoadResultJuyeog value)? loadResultJuyeog,
    TResult? Function(ResetInput value)? resetInput,
    TResult? Function(UpdateInput value)? updateInput,
  }) {
    return updateInput?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(LoadPreview value)? loadPreviews,
    TResult Function(CheckLiked value)? checkLiked,
    TResult Function(LikeContent value)? likeContent,
    TResult Function(ValidateInput value)? onValidInput,
    TResult Function(LoadResultJuyeog value)? loadResultJuyeog,
    TResult Function(ResetInput value)? resetInput,
    TResult Function(UpdateInput value)? updateInput,
    required TResult orElse(),
  }) {
    if (updateInput != null) {
      return updateInput(this);
    }
    return orElse();
  }
}

abstract class UpdateInput implements ContentDetailEvent {
  const factory UpdateInput(
          final ContentBasicArgument input, final bool isPartner) =
      _$UpdateInputImpl;

  ContentBasicArgument get input;
  bool get isPartner;
  @JsonKey(ignore: true)
  _$$UpdateInputImplCopyWith<_$UpdateInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
