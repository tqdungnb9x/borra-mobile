import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/common/main_bloc.dart';
import 'package:borra_app/src/content_detail/data/models/content.dart';
import 'package:borra_app/src/content_detail/data/models/content_input_argument.dart';
import 'package:borra_app/src/content_detail/data/models/content_type.dart';
import 'package:borra_app/src/content_detail/data/models/preview.dart';
import 'package:borra_app/src/content_detail/data/repositories/content_repository.dart';
import 'package:borra_app/src/content_result/data/models/content_detail_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app_base/generated/locale_keys.g.dart';
import '../../../../app_base/models/status.dart';
import '../../../../app_base/utils/app_utils.dart';

part 'content_detail_state.dart';
part 'content_detail_event.dart';
part 'content_detail_bloc.freezed.dart';

class ContentDetailBloc extends Bloc<ContentDetailEvent, ContentDetailState>
    with ApiError {
  final ContentRepository repo = ContentRepository();
  ContentDetailBloc() : super(ContentDetailState.initial()) {
    on<_Initial>(_onInitial);
    on<LoadPreview>(_onLoadPreview);
    on<LikeContent>(_onLikeContent);
    on<CheckLiked>(_onCheckLiked);
    on<ValidateInput>(_onValidateInput);
    on<LoadResultJuyeog>(_onLoadJuyeogResult);
    on<ResetInput>(_onResetInput);
    on<UpdateInput>(_onUpdateInput);
  }

  FutureOr<void> _onInitial(
      _Initial event, Emitter<ContentDetailState> emit) async {
    await apiCallSafety<AppContent>(
      () async {
        return repo.getContent(contentId: event.contentId);
      },
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        add(CheckLiked(event.contentId));
        ContentType type = res!.type;
        if (type.id == 1) {
          add(LoadPreview(event.contentId));
          if (MainBloc.authBloc.state.user != null) {
            ContentBasicArgument userArgs =
                ContentBasicArgument.fromUser(MainBloc.authBloc.state.user!);
            emit(state.copyWith(currentUser: userArgs));
          }
        }

        emit(
          state.copyWith(
            status: Status.success(data: res),
            content: res,
          ),
        );
      },
      onCompleted: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
    );
  }

  initial(int contentId) {
    add(_Initial(contentId));
  }

  FutureOr<void> _onLoadPreview(
      LoadPreview event, Emitter<ContentDetailState> emit) async {
    await apiCallSafety<List<ContentPreview>>(
      () async {
        return repo.getPreview(contentId: event.contentId);
      },
      onStart: () async =>
          emit(state.copyWith(statusLoadPreview: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(statusLoadPreview: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
            statusLoadPreview: Status.success(data: res), listPreview: res!));
      },
      onCompleted: () async {
        emit(state.copyWith(statusLoadPreview: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(statusLoadPreview: const Status.idle()));
      },
    );
  }

  FutureOr<void> _onLoadJuyeogResult(
      LoadResultJuyeog event, Emitter<ContentDetailState> emit) async {
    await apiCallSafety<ContentResult>(
      () async {
        return repo.submitPurchaseContent(
          contentId: event.contentId,
          name: event.name,
          gender: event.gender,
          value: event.value,
        );
      },
      onStart: () async =>
          emit(state.copyWith(statusLoadResult: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(statusLoadResult: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
            statusLoadResult: Status.success(data: res), contentResult: res!));
      },
      onCompleted: () async {
        emit(state.copyWith(statusLoadResult: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(statusLoadResult: const Status.idle()));
      },
    );
  }

  FutureOr<void> _onValidateInput(
      ValidateInput event, Emitter<ContentDetailState> emit) {
    emit(state.copyWith(isValidInput: event.result));
  }

  FutureOr<void> _onCheckLiked(
      CheckLiked event, Emitter<ContentDetailState> emit) async {
    await apiCallSafety<bool>(
      () async {
        return repo.checkLikedContent(ids: [event.contentId]);
      },
      onStart: () async =>
          emit(state.copyWith(statusLoadResult: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(statusLoadResult: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
            statusLoadResult: Status.success(data: res), isLiked: res!));
      },
      onCompleted: () async {
        emit(state.copyWith(statusLoadResult: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(statusLoadResult: const Status.idle()));
      },
    );
  }

  clickLikeButton(BuildContext context) {
    add(LikeContent(context));
  }

  FutureOr<void> _onLikeContent(
      LikeContent event, Emitter<ContentDetailState> emit) async {
    await apiCallSafety<bool>(
      () async {
        return repo.postLikeContent(contentId: state.content!.id);
      },
      onStart: () async =>
          emit(state.copyWith(statusLoadResult: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(statusLoadResult: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
            statusLoadResult: Status.success(data: res), isLiked: res!));
        if (res) {
          UiUtils.showInfoSnackBar(event.context,
              message: LocaleKeys.content_detail_like_content_message.tr(),
              position: FlushbarPosition.BOTTOM);
        }
      },
      onCompleted: () async {
        emit(state.copyWith(statusLoadResult: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(statusLoadResult: const Status.idle()));
      },
    );
  }

  resetInput() {
    add(const ResetInput());
  }

  FutureOr<void> _onResetInput(
      ResetInput event, Emitter<ContentDetailState> emit) {
    emit(state.copyWith(currentUser: ContentBasicArgument.empty()));
  }

  FutureOr<void> _onUpdateInput(
      UpdateInput event, Emitter<ContentDetailState> emit) {
    if (event.isPartner) {
      emit(state.copyWith(partner: event.input));
    } else {
      emit(state.copyWith(currentUser: event.input));
    }
  }

  updateInput(ContentBasicArgument currentUser, bool isPartner) {
    add(UpdateInput(currentUser, isPartner));
  }
}
