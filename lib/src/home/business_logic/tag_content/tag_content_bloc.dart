import 'dart:async';

import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/common/main_bloc.dart';
import 'package:borra_app/src/authentication/auth/data/models/auth_status.dart';
import 'package:borra_app/src/home/business_logic/blocs/home_bloc.dart';
import 'package:borra_app/src/home/data/models/tag.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app_base/models/status.dart';
import '../../../like/data/models/like_content_model.dart';
import '../../data/repositories/home_repository.dart';

part 'tag_content_state.dart';
part 'tag_content_event.dart';
part 'tag_content_bloc.freezed.dart';

class TagContentBloc extends Bloc<TagContentEvent, TagContentState>
    with ApiError {
  final HomeRepository repo = HomeRepository();
  TagContentBloc() : super(TagContentState.initial()) {
    on<_Initial>(_onHandleInitial);
    on<SelectTag>(_onSelectTag);
    on<_LoadMore>(_onHandleLoadMore);
  }

  FutureOr<void> _onHandleInitial(
      _Initial event, Emitter<TagContentState> emit) async {
    if (event.id != null) {
      emit(state.copyWith(tagId: event.id!));
    }
    // get list tag
    await apiCallSafety<List<AppTag>>(
      () async => repo.getTagList(),
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        if (res?.isNotEmpty ?? true) {
          final authStatus = MainBloc.authBloc.state.authStatus;

          if (authStatus != const AuthStatus.unauthenticated()) {
            Map<int, int> indexMap = {
              for (int i = 0;
                  i < MainBloc.authBloc.state.user!.tags.length;
                  i++)
                MainBloc.authBloc.state.user!.tags[i]: i
            };
            // sort user tag in first
            res?.sort((x, y) {
              int indexX =
                  indexMap[x.id] ?? MainBloc.authBloc.state.user!.tags.length;
              int indexY =
                  indexMap[y.id] ?? MainBloc.authBloc.state.user!.tags.length;
              return indexX.compareTo(indexY);
            });
            emit(state.copyWith(
                status: Status.success(data: res), listTag: res));

            final userFirstTag = MainBloc.authBloc.state.user!.tags.isNotEmpty
                ? res!.firstWhere(
                    (element) =>
                        element.id == MainBloc.authBloc.state.user!.tags.first,
                  )
                : res!.first;
            emit(state.copyWith(listTag: res));
            emit(state.copyWith(tagId: userFirstTag.id));
            // add(SelectTag(userFirstTag.id));
            // return;
          } else {
            final temp = List<AppTag>.from(res!);
            temp.sort((a, b) => a.id.compareTo(b.id));
            emit(state.copyWith(
                status: Status.success(data: temp), listTag: temp));
            emit(state.copyWith(tagId: temp.first.id));
            // add(SelectTag(temp.first.id));
          }
        }
      },
      onCompleted: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
    );
    await apiCallSafety<List<LikeContent>?>(
      () async => repo.getTagAllContent(
        page: state.page,
        tagId: event.id ?? state.tagId,
        categoryId: event.categoryId ?? 3,
        priceType: event.priceType,
      ),
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
            status: Status.success(data: res!.length >= state.pageSize),
            page: 1,
            listTagAllContent: res));
      },
      onCompleted: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
    );
  }

  FutureOr<void> _onHandleLoadMore(
      _LoadMore event, Emitter<TagContentState> emit) async {
    await apiCallSafety<List<LikeContent>?>(
        () async => repo.getTagAllContent(
              page: state.page + 1,
              tagId: event.id ?? state.tagId,
              priceType: event.priceType,
              categoryId: event.categoryId,
            ),
        onStart: () async =>
            emit(state.copyWith(loadStatus: const Status.loading())),
        onError: (error) async {
          addError(error);
          emit(state.copyWith(loadStatus: Status.failure(error: error)));
        },
        onSuccess: (res) async {
          List<LikeContent> list = state.listTagAllContent.toList();
          if (res != null) {
            list.addAll(res);
            if (res.length >= state.pageSize) {
              emit(state.copyWith(
                  listTagAllContent: list, page: state.page + 1));
            } else {
              emit(state.copyWith(listTagAllContent: list));
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

  initial(int? id, String? priceType, int? categoryId) {
    add(_Initial(
      id,
      categoryId,
      priceType,
    ));
  }

  loadMore(
    int? id,
    String? priceType,
    int? categoryId,
  ) {
    add(_LoadMore(id, categoryId, priceType));
  }

  FutureOr<void> _onSelectTag(
      SelectTag event, Emitter<TagContentState> emit) async {
    emit(state.copyWith(tagId: event.id ?? state.tagId));
    // add(_Initial(event.id));
    await apiCallSafety<List<LikeContent>?>(
      () async => repo.getTagAllContent(
        page: state.page,
        tagId: event.id ?? state.tagId,
        categoryId: event.categoryId ?? 3,
        priceType: event.priceType,
      ),
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
            status: Status.success(data: res!.length >= state.pageSize),
            page: 1,
            listTagAllContent: res));
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
