import 'dart:async';

import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/src/authentication/auth/data/models/user.dart';
import 'package:borra_app/src/like/data/models/user_liked_content_model.dart';
import 'package:borra_app/src/my_account/data/repositories/account_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app_base/models/status.dart';
import '../../home/data/models/tag.dart';
import '../data/models/user_content.dart';

part 'account_state.dart';
part 'account_event.dart';
part 'account_bloc.freezed.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> with ApiError {
  final AccountRepository repo = AccountRepository();
  AccountBloc() : super(AccountState.initial()) {
    on<_Initial>(_onInitial);
    on<_LoadListLiked>(_onLoadLikedList);
    on<_LoadListLikedMore>(_onLoadLikedMore);
    on<_LoadListReplay>(_onLoadReplayList);
    on<_LoadListReplayMore>(_onLoadReplayMore);
    on<_LoadListTag>(_onLoadListTag);
    on<_UpdateProfile>(_onUpdateProfile);
  }

  initial() {
    add(const _Initial());
  }

  loadLikedList() {
    add(const _LoadListLiked());
  }

  loadLikedListMore() {
    add(const _LoadListLikedMore());
  }

  loadLReplayList() {
    add(const _LoadListReplay());
  }

  loadReplayListMore() {
    add(const _LoadListReplayMore());
  }

  loadListTag() {
    add(const _LoadListTag());
  }

  updateProfile(User user) {
    add(_UpdateProfile(user));
  }

  FutureOr<void> _onInitial(_Initial event, Emitter<AccountState> emit) async {
    await apiCallSafety<List<UserContent>>(
      () async {
        return repo.getListUserLiked();
      },
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
          status: Status.success(data: res),
          listLikedContent: res,
        ));
      },
      onCompleted: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
    );
    await apiCallSafety<List<UserContent>>(
      () async {
        return repo.getListUserReplays();
      },
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        print("getListUserReplays${error}");
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        print("getListUserReplaysSuccess");
        emit(state.copyWith(
          status: Status.success(data: res),
          listReplaysContent: res,
        ));
      },
      onCompleted: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
    );
    await apiCallSafety<List<AppTag>>(
      () async {
        return repo.getTagList();
      },
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(status: Status.success(data: res), listTag: res));
      },
      onCompleted: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
    );
  }

  FutureOr<void> _onLoadLikedList(
      _LoadListLiked event, Emitter<AccountState> emit) async {
    await apiCallSafety<List<UserLikedContent>>(
      () async {
        return repo.getListUserLikedAll(page: state.page);
      },
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
          status: Status.success(data: res!.length >= state.pageSize),
          listUserLiked: res,
          page: 1,
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

  FutureOr<void> _onLoadLikedMore(
      _LoadListLikedMore event, Emitter<AccountState> emit) async {
    await apiCallSafety<List<UserLikedContent>>(
      () async {
        return repo.getListUserLikedAll(page: state.page + 1);
      },
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        List<UserLikedContent> list = state.listUserLiked!.toList();
        if (res != null) {
          list.addAll(res);
          if (res.length >= state.pageSize) {
            emit(state.copyWith(listUserLiked: list, page: state.page + 1));
          } else {
            emit(state.copyWith(listUserLiked: list));
          }
          emit(state.copyWith(
            status: Status.success(data: res.length >= state.pageSize),
          ));

          emit(state.copyWith(status: const Status.idle()));
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

  FutureOr<void> _onLoadReplayList(
      _LoadListReplay event, Emitter<AccountState> emit) async {
    await apiCallSafety<List<UserLikedContent>>(
      () async {
        return repo.getListUserReplayAll(page: state.page);
      },
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
          status: Status.success(data: res!.length >= state.pageSize),
          listUserReplays: res,
          page: 1,
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

  FutureOr<void> _onLoadReplayMore(
      _LoadListReplayMore event, Emitter<AccountState> emit) async {
    await apiCallSafety<List<UserLikedContent>>(
      () async {
        return repo.getListUserReplayAll(page: state.page + 1);
      },
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        List<UserLikedContent> list = state.listUserReplays!.toList();
        if (res != null) {
          list.addAll(res);
          if (res.length >= state.pageSize) {
            emit(state.copyWith(listUserReplays: list, page: state.page + 1));
          } else {
            emit(state.copyWith(listUserReplays: list));
          }
          emit(state.copyWith(
            status: Status.success(data: res.length >= state.pageSize),
          ));

          emit(state.copyWith(status: const Status.idle()));
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

  FutureOr<void> _onLoadListTag(
      _LoadListTag event, Emitter<AccountState> emit) async {
    await apiCallSafety<List<AppTag>>(
      () async {
        return repo.getTagList();
      },
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(status: Status.success(data: res), listTag: res));
      },
      onCompleted: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
    );
  }

  FutureOr<void> _onUpdateProfile(
      _UpdateProfile event, Emitter<AccountState> emit) async {
    await apiCallSafety<bool>(
      () async {
        return repo.updateProfile(user: event.user);
      },
      onStart: () async =>
          emit(state.copyWith(statusUpdateProfile: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(statusUpdateProfile: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(statusUpdateProfile: Status.success(data: res)));
      },
      onCompleted: () async {
        emit(state.copyWith(statusUpdateProfile: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(statusUpdateProfile: const Status.idle()));
      },
    );
  }
}
