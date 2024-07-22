import 'dart:async';

import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app_base/models/status.dart';
import '../../../like/data/models/like_content_model.dart';
import '../../data/repositories/home_repository.dart';

part 'hot_content_state.dart';
part 'hot_content_event.dart';
part 'hot_content_bloc.freezed.dart';

class HotContentBloc extends Bloc<HotContentEvent, HotContentState>
    with ApiError {
  final HomeRepository repo = HomeRepository();
  HotContentBloc() : super(HotContentState.initial()) {
    on<_Initial>(_onHandleInitial);
    on<_LoadMore>(_onHandleLoadMore);
  }

  FutureOr<void> _onHandleInitial(
      _Initial event, Emitter<HotContentState> emit) async {
    await apiCallSafety<List<LikeContent>?>(
        () async => repo.getListLiked(
              page: state.page,
            ),
        onStart: () async =>
            emit(state.copyWith(status: const Status.loading())),
        onError: (error) async {
          addError(error);
          emit(state.copyWith(status: Status.failure(error: error)));
        },
        onSuccess: (res) async {
          emit(state.copyWith(
              status: Status.success(data: res!.length >= state.pageSize),
              page: 1,
              listHotContent: res));
        },
        onCompleted: () async {
          emit(state.copyWith(status: const Status.idle()));
        },
        onFinally: () async {
          emit(state.copyWith(status: const Status.idle()));
        });
  }

  initial() {
    add(const _Initial());
  }

  loadMore() {
    add(const _LoadMore());
  }

  FutureOr<void> _onHandleLoadMore(
      _LoadMore event, Emitter<HotContentState> emit) async {
    await apiCallSafety<List<LikeContent>?>(
        () async => repo.getListLiked(
              page: state.page + 1,
            ),
        onStart: () async =>
            emit(state.copyWith(loadStatus: const Status.loading())),
        onError: (error) async {
          addError(error);
          emit(state.copyWith(loadStatus: Status.failure(error: error)));
        },
        onSuccess: (res) async {
          List<LikeContent> list = state.listHotContent.toList();
          if (res != null) {
            list.addAll(res);
            if (res.length >= state.pageSize) {
              emit(state.copyWith(listHotContent: list, page: state.page + 1));
            } else {
              emit(state.copyWith(listHotContent: list));
            }
            emit(state.copyWith(
              status: Status.success(data: res.length >= state.pageSize),
            ));

            emit(state.copyWith(loadStatus: const Status.idle()));
          }
        },
        onCompleted: () async {
          emit(state.copyWith(loadStatus: const Status.idle()));
        },
        onFinally: () async {
          emit(state.copyWith(loadStatus: const Status.idle()));
        });
  }
}
