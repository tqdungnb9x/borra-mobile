import 'dart:async';

import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/src/like/data/repositories/like_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app_base/models/status.dart';
import '../data/models/user_liked_content_model.dart';

part 'like_state.dart';
part 'like_event.dart';
part 'like_bloc.freezed.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> with ApiError {
  final LikeRepository repo = LikeRepository();
  LikeBloc() : super(LikeState.initial()) {
    on<_Initial>(_onInitial);
    on<_LoadMore>(_onLoadMore);
  }

  FutureOr<void> _onInitial(event, Emitter<LikeState> emit) async {
    await apiCallSafety<List<UserLikedContent>>(
      () async {
        return repo.getListLiked(page: state.page);
      },
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
            status: Status.success(data: res!.length >= state.pageSize),
            listLikedContent: res,
            page: 1));
      },
      onCompleted: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
    );
  }

  initial() {
    add(const _Initial());
  }

  loadMore() {
    add(const _LoadMore());
  }

  FutureOr<void> _onLoadMore(_LoadMore event, Emitter<LikeState> emit) async {
    await apiCallSafety<List<UserLikedContent>>(
      () async {
        return repo.getListLiked(page: state.page + 1);
      },
      onStart: () async =>
          emit(state.copyWith(statusLoadMore: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(statusLoadMore: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        List<UserLikedContent> list = state.listLikedContent!.toList();
        if (res != null) {
          list.addAll(res);
          if (res.length >= state.pageSize) {
            emit(state.copyWith(listLikedContent: list, page: state.page + 1));
          } else {
            emit(state.copyWith(listLikedContent: list));
          }
          emit(state.copyWith(
            statusLoadMore: Status.success(data: res.length >= state.pageSize),
          ));

          emit(state.copyWith(statusLoadMore: const Status.idle()));
        }
      },
      onCompleted: () async {
        emit(state.copyWith(statusLoadMore: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(statusLoadMore: const Status.idle()));
      },
    );
  }
}
