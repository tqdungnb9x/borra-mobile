import 'dart:async';

import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/src/content_recommend/data/repositoties/recommend_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app_base/models/status.dart';
import '../../../home/data/models/app_main_content.dart';

part 'recommend_state.dart';
part 'recommend_event.dart';
part 'recommend_bloc.freezed.dart';

class RecommendBloc extends Bloc<RecommendEvent, RecommendState> with ApiError {
  final RecommendRepository repo = RecommendRepository();
  RecommendBloc() : super(RecommendState.initial()) {
    on<_Initial>(_onInitial);
  }

  initial() {
    add(const _Initial());
  }

  FutureOr<void> _onInitial(
      _Initial event, Emitter<RecommendState> emit) async {
    await apiCallSafety<List<AppMainContent>>(
      () async {
        return repo.getRecommend();
      },
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
            status: Status.success(data: res), listRecommend: res!));
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
