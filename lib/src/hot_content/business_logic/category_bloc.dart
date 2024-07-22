import 'dart:async';

import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/src/hot_content/data/models/category.dart';
import 'package:borra_app/src/hot_content/data/repositories/category_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app_base/models/status.dart';
import '../../like/data/models/like_content_model.dart';

part 'category_state.dart';
part 'category_event.dart';
part 'category_bloc.freezed.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> with ApiError {
  final CategoryRepository repo = CategoryRepository();
  CategoryBloc() : super(CategoryState.initial()) {
    on<_Initial>(_onInitial);
    on<_InitialHotContent>(_onInitialHotContent);
    on<SelectCategory>(_onSelectCategory);
    on<_LoadMore>(_onLoadMore);
    on<_RemoveAll>(_onRemoveAll);
  }

  FutureOr<void> _onInitial(event, Emitter<CategoryState> emit) async {
    await apiCallSafety<List<ContentCategory>>(
      () async {
        return repo.getListCategory();
      },
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
            status: Status.success(data: res), listCategory: res));
      },
      onCompleted: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
    );
  }

  FutureOr<void> _onInitialHotContent(
      event, Emitter<CategoryState> emit) async {
    await apiCallSafety<List<ContentCategory>>(
      () async {
        return repo.getListCategory();
      },
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        if (res != null && res.isNotEmpty) {
          add(SelectCategory(res.first));
        }
        emit(state.copyWith(
            status: Status.success(data: res), listCategory: res));
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

  initialHotContent() {
    add(const _InitialHotContent());
  }

  selectCategory(ContentCategory category) {
    add(SelectCategory(category));
  }

  loadMore(ContentCategory category) {
    add(_LoadMore(category.id));
  }

  removeAll() {
    add(const _RemoveAll());
  }

  FutureOr<void> _onSelectCategory(
      SelectCategory event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(selectedCategory: event.category));
    await apiCallSafety<List<LikeContent>>(
      () async {
        return repo.getCategoryContent(categoryId: event.category.id);
      },
      onStart: () async =>
          emit(state.copyWith(statusGetContentByCat: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(
            statusGetContentByCat: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
            statusGetContentByCat:
                Status.success(data: res!.length >= state.pageSize),
            listContentByCat: res));
      },
      onCompleted: () async {
        emit(state.copyWith(statusGetContentByCat: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(statusGetContentByCat: const Status.idle()));
      },
    );
  }

  FutureOr<void> _onRemoveAll(
      _RemoveAll event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(statusGetContentByCat: const Status.loading()));
  }

  // FutureOr<void> _onChange(
  //     _RemoveAll event, Emitter<CategoryState> emit) async {
  //   emit(state.copyWith(statusGetContentByCat: const Status.loading()));
  // }

  FutureOr<void> _onLoadMore(
      _LoadMore event, Emitter<CategoryState> emit) async {
    await apiCallSafety<List<LikeContent>?>(
        () async => repo.getCategoryContent(
              page: state.page + 1,
              categoryId: event.id,
            ),
        onStart: () async =>
            emit(state.copyWith(statusLoadMore: const Status.loading())),
        onError: (error) async {
          addError(error);
          emit(state.copyWith(statusLoadMore: Status.failure(error: error)));
        },
        onSuccess: (res) async {
          List<LikeContent> list = state.listContentByCat.toList();
          if (res != null) {
            list.addAll(res);
            if (res.length >= state.pageSize) {
              emit(
                  state.copyWith(listContentByCat: list, page: state.page + 1));
            } else {
              emit(state.copyWith(listContentByCat: list));
            }
            emit(state.copyWith(
              statusLoadMore:
                  Status.success(data: res.length >= state.pageSize),
            ));

            emit(state.copyWith(statusLoadMore: const Status.idle()));
          }
        },
        onCompleted: () async {
          emit(state.copyWith(statusLoadMore: const Status.idle()));
        },
        onFinally: () async {
          emit(state.copyWith(statusLoadMore: const Status.idle()));
        });
  }
}
