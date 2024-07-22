import 'dart:async';

import 'package:borra_app/app_base/models/status.dart';
import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/common/main_bloc.dart';
import 'package:borra_app/src/authentication/auth/data/models/auth_status.dart';
import 'package:borra_app/src/home/data/models/banner.dart';
import 'package:borra_app/src/home/data/models/hot_content.dart';
import 'package:borra_app/src/home/data/models/tag.dart';
import 'package:borra_app/src/home/data/models/app_main_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app_base/generated/locale_keys.g.dart';
import '../../../like/data/models/like_content_model.dart';
import '../../data/repositories/home_repository.dart';

part 'home_state.dart';
part 'home_event.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> with ApiError {
  final HomeRepository repo = HomeRepository();
  HomeBloc() : super(HomeState.initial()) {
    on<_Initial>(_onInitial);
    on<_InitialSearch>(_onInitialSearch);
    on<ActiveSearch>(_onActiveSearch);
    on<ExecuteSearch>(_onExecuteSearch);
    on<ClearSearch>(_onClearSearch);
    on<SelectCategory>(_onSelectTag);
    on<GetListLikedIds>(_onGetLikedIds);
    on<SearchShowing>(_onSearchShowing);
    on<SearchingHistoryRemove>(_onSearchingHistoryRemove);
  }
  void _onInitial(_Initial event, Emitter<HomeState> emit) async {
    add(const ActiveSearch(false));

    await apiCallSafety<List<AppBanner>>(
      () async {
        return repo.getListBanner();
      },
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(
            state.copyWith(status: Status.success(data: res), listBanner: res));
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
        if (res?.isNotEmpty ?? true) {
          final authStatus = MainBloc.authBloc.state.authStatus;
          if (authStatus != const AuthStatus.unauthenticated()) {
            final userFirstTag = MainBloc.authBloc.state.user!.tags.isNotEmpty
                ? res!.firstWhere(
                    (element) =>
                        element.id == MainBloc.authBloc.state.user!.tags.first,
                  )
                : res!.first;
            emit(state.copyWith(selectedTag: userFirstTag));
            add(SelectCategory(userFirstTag));
            return;
          }
          final temp = List<AppTag>.from(res!);
          temp.sort((a, b) => a.id.compareTo(b.id));

          emit(state.copyWith(selectedTag: temp.first));
          add(SelectCategory(temp.first));
        }
      },
      onCompleted: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
    );
    await apiCallSafety<List<HotContent>>(
      () async {
        return repo.getHotContent();
      },
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
            status: Status.success(data: res), listHotContent: res));
      },
      onCompleted: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
    );
    await apiCallSafety<List<AppMainContent>>(
      () async {
        return repo.getTarotToday();
      },
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
            status: Status.success(data: res), listTarotToday: res));
      },
      onCompleted: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
    );
    await apiCallSafety<List<AppMainContent>>(
      () async {
        return repo.getTarotFree();
      },
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
            status: Status.success(data: res), listTarotFree: res));
      },
      onCompleted: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
    );
    await apiCallSafety<List<AppMainContent>>(
      () async {
        return repo.getTarotMainFree();
      },
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
            status: Status.success(data: res), listTarotMainFree: res));
      },
      onCompleted: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
    );
    await apiCallSafety<List<AppMainContent>>(
      () async {
        return repo.getTarotFirstFree();
      },
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
            status: Status.success(data: res), listTarotFirstFree: res));
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

  initialSearch() {
    add(const _InitialSearch());
  }

  FutureOr<void> _onActiveSearch(
      ActiveSearch event, Emitter<HomeState> emit) async {
    if (event.isActive == false) {
      emit(state.copyWith(listSearchResult: null));
    }
    emit(state.copyWith(isActiveSearch: event.isActive));
  }

  FutureOr<void> _onSelectTag(
      SelectCategory event, Emitter<HomeState> emit) async {
    emit(state.copyWith(selectedTag: event.tag));
    emit(state.copyWith(tagHeader: mapTagtoString(event.tag)));
    await apiCallSafety<List<AppMainContent>>(
      () async {
        return repo.getContentListByTag(tagId: event.tag.id);
      },
      onStart: () async =>
          emit(state.copyWith(statusGetContentByTag: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(
            statusGetContentByTag: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
            statusGetContentByTag: Status.success(data: res),
            listTarotByCategory: res));
      },
      onCompleted: () async {
        emit(state.copyWith(statusGetContentByTag: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(statusGetContentByTag: const Status.idle()));
      },
    );
  }

  FutureOr<void> _onInitialSearch(
      _InitialSearch event, Emitter<HomeState> emit) async {
    await apiCallSafety<List<AppMainContent>>(
      () async {
        return repo.getRecommend();
      },
      onStart: () async =>
          emit(state.copyWith(statusLoadRecommend: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        if (MainBloc.authBloc.state.user != null) {
          List<int> ids = [];
          if (res != null) {
            for (var element in res) {
              ids.add(element.id);
            }
          }

          add(GetListLikedIds(ids));
        }

        emit(state.copyWith(
            statusLoadRecommend: Status.success(data: res),
            listRecommend: res));
      },
      onCompleted: () async {
        emit(state.copyWith(statusLoadRecommend: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(statusLoadRecommend: const Status.idle()));
      },
    );
    await apiCallSafety<List<String>>(
      () async {
        return repo.getKeywords();
      },
      onStart: () async =>
          emit(state.copyWith(statusLoadKeywords: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(statusLoadKeywords: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
            statusLoadKeywords: Status.success(data: res), listKeywords: res));
      },
      onCompleted: () async {
        emit(state.copyWith(statusLoadKeywords: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(statusLoadKeywords: const Status.idle()));
      },
    );
  }

  FutureOr<void> _onExecuteSearch(
      ExecuteSearch event, Emitter<HomeState> emit) async {
    await apiCallSafety<List<LikeContent>>(
      () async {
        return repo.getSearchResult(page: state.page, keyword: event.keyword);
      },
      onStart: () async =>
          emit(state.copyWith(statusLoadSearch: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(statusLoadSearch: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
            statusLoadSearch:
                Status.success(data: res!.length >= state.pageSize),
            page: 1,
            listSearchResult: res));
      },
      onCompleted: () async {
        emit(state.copyWith(statusLoadSearch: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(statusLoadSearch: const Status.idle()));
      },
    );
  }

  FutureOr<void> _onClearSearch(
      ClearSearch event, Emitter<HomeState> emit) async {
    emit(state.copyWith(listSearchResult: null));
  }

  FutureOr<void> _onGetLikedIds(
      GetListLikedIds event, Emitter<HomeState> emit) async {
    await apiCallSafety<List<int>>(
      () async {
        return repo.getListLikeId(ids: event.ids);
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

  FutureOr<void> _onSearchShowing(
      SearchShowing event, Emitter<HomeState> emit) async {
    if (event.isShowing) {
      await apiCallSafety<List<String>>(
        () async {
          return repo.getSearchingHistoryList();
        },
        onStart: () async =>
            emit(state.copyWith(status: const Status.loading())),
        onError: (error) async {
          addError(error);
          emit(state.copyWith(status: Status.failure(error: error)));
        },
        onSuccess: (res) async {
          emit(state.copyWith(
              status: Status.success(data: res), searchingHistoryList: res!));
        },
        onCompleted: () async {
          emit(state.copyWith(status: const Status.idle()));
        },
        onFinally: () async {
          emit(state.copyWith(status: const Status.idle()));
        },
      );
    }
    emit(state.copyWith(isSearchShowing: event.isShowing));
  }

  FutureOr<void> _onSearchingHistoryRemove(
      SearchingHistoryRemove event, Emitter<HomeState> emit) async {
    await apiCallSafety<bool>(
      () async {
        return repo.removeSearchingHistory(keyword: event.keyword);
      },
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        List<String> tempList = [];
        tempList.addAll(state.searchingHistoryList);
        tempList.remove(event.keyword);
        emit(state.copyWith(searchingHistoryList: tempList));
        emit(state.copyWith(status: Status.success(data: res)));
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
