import 'dart:async';

import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app_base/models/status.dart';
import '../../../like/data/models/like_content_model.dart';
import '../../data/repositories/home_repository.dart';

part 'category_content_state.dart';
part 'category_content_event.dart';
part 'category_content_bloc.freezed.dart';

class CategoryContentBloc
    extends Bloc<CategoryContentEvent, CategoryContentState> with ApiError {
  final HomeRepository repo = HomeRepository();
  CategoryContentBloc() : super(CategoryContentState.initial()) {
    on<_Initial>(_onHandleInitial);
    on<_LoadMore>(_onHandleLoadMore);
  }

  FutureOr<void> _onHandleInitial(
      _Initial event, Emitter<CategoryContentState> emit) async {
    await apiCallSafety<List<LikeContent>?>(
        () async => repo.getCategoryContent(
              page: state.page,
              categoryId: event.id,
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
              listCategoryContent: res));
        },
        onCompleted: () async {
          emit(state.copyWith(status: const Status.idle()));
        },
        onFinally: () async {
          emit(state.copyWith(status: const Status.idle()));
        });
  }

  FutureOr<void> _onHandleLoadMore(
      _LoadMore event, Emitter<CategoryContentState> emit) async {
    await apiCallSafety<List<LikeContent>?>(
        () async => repo.getCategoryContent(
              page: state.page + 1,
              categoryId: event.id,
            ),
        onStart: () async =>
            emit(state.copyWith(loadStatus: const Status.loading())),
        onError: (error) async {
          addError(error);
          emit(state.copyWith(loadStatus: Status.failure(error: error)));
        },
        onSuccess: (res) async {
          List<LikeContent> list = state.listCategoryContent.toList();
          if (res != null) {
            list.addAll(res);
            if (res.length >= state.pageSize) {
              emit(state.copyWith(
                  listCategoryContent: list, page: state.page + 1));
            } else {
              emit(state.copyWith(listCategoryContent: list));
            }
            emit(state.copyWith(
              loadStatus: Status.success(data: res.length >= state.pageSize),
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

  initial(int id) {
    add(_Initial(id));
  }

  loadMore(int id) {
    add(_LoadMore(id));
  }
}
