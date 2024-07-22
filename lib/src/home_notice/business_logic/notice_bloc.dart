import 'dart:async';

import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/src/home_notice/data/models/notice_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app_base/models/status.dart';
import '../data/repositories/notice_repository.dart';

part 'notice_state.dart';
part 'notice_event.dart';
part 'notice_bloc.freezed.dart';

class NoticeBloc extends Bloc<NoticeEvent, NoticeState> with ApiError {
  final NoticeRepository repo = NoticeRepository();
  NoticeBloc() : super(NoticeState.initial()) {
    on<_Initial>(_onInitial);
    on<_LoadMore>(_onLoadMore);
  }

  FutureOr<void> _onInitial(_Initial event, Emitter<NoticeState> emit) async {
    await apiCallSafety<List<AppNotice>>(
      () async {
        return repo.getListNotice(page: state.page, type: event.type);
      },
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
            status: Status.success(data: res!.length >= state.pageSize),
            listNotice: res,
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

  initial(String type) {
    add(_Initial(type));
  }

  loadMore(String type) {
    add(_LoadMore(type));
  }

  Future<AppNotice?> getNotice({required int id}) async {
    final AppNotice? notice = await repo.getNoticeDetail(id: id);
    return notice;
  }

  FutureOr<void> _onLoadMore(_LoadMore event, Emitter<NoticeState> emit) async {
    await apiCallSafety<List<AppNotice>>(
      () async {
        return repo.getListNotice(page: state.page + 1, type: event.type);
      },
      onStart: () async =>
          emit(state.copyWith(statusLoadMore: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(statusLoadMore: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        List<AppNotice> list = state.listNotice!.toList();
        if (res != null) {
          list.addAll(res);
          if (res.length >= state.pageSize) {
            emit(state.copyWith(listNotice: list, page: state.page + 1));
          } else {
            emit(state.copyWith(listNotice: list));
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
