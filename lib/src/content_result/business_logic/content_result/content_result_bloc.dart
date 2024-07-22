import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:borra_app/app_base/config/app_config.dart';
import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/src/content_detail/business_logic/content_detail/content_detail_bloc.dart';
import 'package:borra_app/src/content_result/data/models/content_detail_model.dart';
import 'package:borra_app/src/home/data/repositories/home_repository.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app_base/generated/locale_keys.g.dart';
import '../../../../app_base/models/status.dart';
import '../../../../app_base/utils/app_utils.dart';
import '../../../content_detail/data/models/content.dart';
import '../../../content_detail/data/repositories/content_repository.dart';
import '../../data/repositories/content_detail_repo.dart';

part 'content_result_state.dart';
part 'content_result_event.dart';
part 'content_result_bloc.freezed.dart';

class ContentResultBloc extends Bloc<ContentResultEvent, ContentResultState>
    with ApiError {
  final ContentResultRepository repo = ContentResultRepository();
  final ContentRepository contentRepo = ContentRepository();
  final HomeRepository homeRepo = HomeRepository();
  ContentResultBloc() : super(ContentResultState.initial()) {
    on<_Initial>(_onInitial);
    on<LikeContent>(_onLikeContent);
    on<CheckLiked>(_onCheckLiked);
    on<LoadShareLink>(_loadShareLink);
  }

  initial(int id, String? shareCode) {
    add(_Initial(id, shareCode));
  }

  FutureOr<void> _onInitial(
      _Initial event, Emitter<ContentResultState> emit) async {
    await apiCallSafety<ContentResult>(
      () async {
        return repo.getContentResultTemp(
            contentId: event.contentId, shareCode: event.shareCode);
      },
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        if (res!.content.type.id == 3) {
          var list = processTarotContent(res);
          emit(state.copyWith(tarotList: list));
        }
        emit(state.copyWith(
            status: Status.success(data: res), contentResult: res));
        if (event.shareCode == null) {
          add(CheckLiked(res.content.id));
          loadShareLink(res.purchase.id);
        }
      },
      onCompleted: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
    );
  }

  FutureOr<void> _onCheckLiked(
      CheckLiked event, Emitter<ContentResultState> emit) async {
    await apiCallSafety<bool>(
      () async {
        return contentRepo.checkLikedContent(ids: [event.contentId]);
      },
      onStart: () async => emit(state.copyWith()),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(status: Status.success(data: res), isLiked: res!));
      },
      onCompleted: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
    );
  }

  clickLikeButton(BuildContext context, int id) {
    add(LikeContent(context, id));
  }

  FutureOr<void> _onLikeContent(
      LikeContent event, Emitter<ContentResultState> emit) async {
    await apiCallSafety<bool>(
      () async {
        return contentRepo.postLikeContent(contentId: event.id);
      },
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(status: Status.success(data: res), isLiked: res!));
        if (res) {
          UiUtils.showInfoSnackBar(event.context,
              message: LocaleKeys.content_detail_like_content_message.tr(),
              position: FlushbarPosition.BOTTOM);
        }
      },
      onCompleted: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
    );
  }

  loadShareLink(int id) {
    add(LoadShareLink(id));
  }

  FutureOr<void> _loadShareLink(
      LoadShareLink event, Emitter<ContentResultState> emit) async {
    await apiCallSafety<String>(
      () async {
        return repo.getShareLink(purchaseId: event.purchaseId);
      },
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        print(error);
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        print(res);
        emit(
            state.copyWith(status: Status.success(data: res), shareLink: res!));
      },
      onCompleted: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
    );
  }
}
