import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/src/content_detail/data/models/content_input_argument.dart';
import 'package:borra_app/src/content_result/data/repositories/content_detail_repo.dart';
import 'package:borra_app/src/home/data/models/app_main_content.dart';
import 'package:borra_app/src/home/data/repositories/home_repository.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../../app_base/generated/locale_keys.g.dart';
import '../../../../app_base/models/status.dart';
import '../../../../app_base/utils/app_utils.dart';
import '../../../../common/main_bloc.dart';
import '../../../content_result/data/models/content_detail_model.dart';
import '../../data/models/content.dart';
import '../../data/models/content_type.dart';
import '../../data/models/preview.dart';
import '../../data/repositories/content_repository.dart';
import '../content_detail/content_detail_bloc.dart';

part 'content_purchased_state.dart';
part 'content_purchased_event.dart';
part 'content_purchased_bloc.freezed.dart';

class ContentPurchasedBloc
    extends Bloc<ContentPurchasedEvent, ContentPurchasedState> with ApiError {
  final ContentRepository repo = ContentRepository();
  final HomeRepository homeRepo = HomeRepository();
  final ContentResultRepository resultRepo = ContentResultRepository();
  ContentPurchasedBloc() : super(ContentPurchasedState.initial()) {
    on<_Initial>(_onInitial);
    on<LoadPreview>(_onLoadPreview);
    on<CheckLiked>(_onCheckLiked);
    on<LoadFeedback>(_onLoadFeedback);
    on<LoadRecommend>(_onLoadRecommend);
    on<GetListLikedIds>(_getListLikeIds);
    on<LikeContent>(_onLikeContent);
    on<GetContentDetail>(_onGetUserInfo);
    on<LoadShareLink>(_loadShareLink);
  }

  initial(ContentInputArgument input) {
    add(_Initial(input));
  }

  FutureOr<void> _onInitial(
      _Initial event, Emitter<ContentPurchasedState> emit) async {
    var contentType = event.input.content.type.id;
    await apiCallSafety<ContentResult>(
      () async {
        if (contentType != 1) {
          return repo.submitPurchaseContent(
            contentId: event.input.content.id,
            name: event.input.user!.name,
            gender: event.input.user!.gender.toString(),
            value: event.input.user!.value!,
          );
        }
        return repo.submitPurchaseContentSaju(
          contentId: event.input.content.id,
          user: event.input.user!,
          partner: event.input.partner,
        );
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
        // add(GetContentDetail(event.input.content.id));
        // try {
        //   var result =
        //       await resultRepo.getShareLink(purchaseId: res.purchase.id);
        //   if (result.success) {
        //     emit(state.copyWith(shareLink: result.data ?? ''));
        //   }
        // } on TypeError catch (e) {
        //   print(e);
        // }
        getUserInfo(event.input.content.id);
        emit(state.copyWith(
            status: Status.success(data: res), contentResult: res));
      },
      onCompleted: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
    );
  }

  FutureOr<void> _onLoadPreview(
      LoadPreview event, Emitter<ContentPurchasedState> emit) async {
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

  FutureOr<void> _onLoadFeedback(
      LoadFeedback event, Emitter<ContentPurchasedState> emit) async {
    await apiCallSafety<List<AppMainContent>>(
      () async {
        return homeRepo.getRecommend();
      },
      onStart: () async =>
          emit(state.copyWith(statusLoadPreview: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(statusLoadPreview: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
            statusLoadPreview: Status.success(data: res), listRecommend: res!));
      },
      onCompleted: () async {
        emit(state.copyWith(statusLoadPreview: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(statusLoadPreview: const Status.idle()));
      },
    );
  }

  checkLike(int id) {
    add(CheckLiked(id));
  }

  FutureOr<void> _onCheckLiked(
      CheckLiked event, Emitter<ContentPurchasedState> emit) async {
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
            statusLoadResult: Status.success(data: res),
            isLiked: res ?? false));
      },
      onCompleted: () async {
        emit(state.copyWith(statusLoadResult: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(statusLoadResult: const Status.idle()));
      },
    );
  }

  clickLikeButton(BuildContext context, int id) {
    add(LikeContent(context, id));
  }

  FutureOr<void> _onLikeContent(
      LikeContent event, Emitter<ContentPurchasedState> emit) async {
    await apiCallSafety<bool>(
      () async {
        return repo.postLikeContent(contentId: event.id);
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

  getUserInfo(int id) {
    add(GetContentDetail(id));
  }

  FutureOr<void> _onGetUserInfo(
      GetContentDetail event, Emitter<ContentPurchasedState> emit) async {
    await apiCallSafety<AppContent>(
      () async {
        return repo.getContent(contentId: event.contentId);
      },
      onStart: () async =>
          emit(state.copyWith(statusLoadResult: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(statusLoadResult: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(
          state.copyWith(
            statusLoadResult: Status.success(data: res),
            content: res,
          ),
        );
      },
      onCompleted: () async {
        emit(state.copyWith(statusLoadResult: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
    );
  }

  FutureOr<void> _onLoadRecommend(
      LoadRecommend event, Emitter<ContentPurchasedState> emit) {}

  FutureOr<void> _getListLikeIds(
      GetListLikedIds event, Emitter<ContentPurchasedState> emit) async {
    await apiCallSafety<List<int>>(
      () async {
        return homeRepo.getListLikeId(ids: event.ids);
      },
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
          status: Status.success(data: res),
          listLikedIds: res!,
        ));
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
      LoadShareLink event, Emitter<ContentPurchasedState> emit) async {
    await apiCallSafety<String>(
      () async {
        return resultRepo.getShareLink(purchaseId: event.purchaseId);
      },
      onStart: () async =>
          emit(state.copyWith(statusLoadFeedback: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(statusLoadFeedback: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
            statusLoadFeedback: Status.success(data: res), shareLink: res!));
      },
      onCompleted: () async {
        emit(state.copyWith(statusLoadFeedback: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(statusLoadFeedback: const Status.idle()));
      },
    );
  }
}
