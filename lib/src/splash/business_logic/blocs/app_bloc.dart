import 'dart:async';

import 'package:borra_app/app_base/config/app_config.dart';
import 'package:borra_app/app_base/models/status.dart';
import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/src/home/data/models/tag.dart';
import 'package:borra_app/src/splash/data/models/app_model.dart';
import 'package:borra_app/src/splash/data/repositories/app_repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

import '../../../../app_base/services/local/shared_preferences/app_preference.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

class AppBloc extends Bloc<AppEvent, AppState> with ApiError {
  final AppRepositories repo = AppRepositories();
  AppBloc() : super(AppState.initial()) {
    on<AppEventInitial>((event, emit) async {
      await apiCallSafety<AppModel>(
        () async {
          // await AppPreferences.instance.set<String>(
          //     AppPreferenceKey.accessToken,
          //     "94031|OMY0BJQ7Qxyl72C5eIll3hPwIekdiQS3FvskBkxj");
          return repo.loadAppConfig();
        },
        onStart: () async =>
            emit(state.copyWith(status: const Status.loading())),
        onError: (error) async {
          addError(error);
          emit(state.copyWith(status: Status.failure(error: error)));
        },
        onSuccess: (res) async {
          emit(state.copyWith(status: const Status.success(), appModel: res!));
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
        onStart: () async =>
            emit(state.copyWith(status: const Status.loading())),
        onError: (error) async {
          addError(error);
          emit(state.copyWith(status: Status.failure(error: error)));
        },
        onSuccess: (res) async {
          emit(state.copyWith(status: const Status.success(), listTags: res!));
        },
        onCompleted: () async {
          emit(state.copyWith(status: const Status.idle()));
        },
        onFinally: () async {
          emit(state.copyWith(status: const Status.idle()));
        },
      );
    });
    on<AppEventSetOpen>(_onSetDetailOpen);
  }

  setDetailIsOpen(bool value) {
    add(AppEventSetOpen(value));
  }

  FutureOr<void> _onSetDetailOpen(
      AppEventSetOpen event, Emitter<AppState> emit) {
    emit(state.copyWith(isContentDetailOpen: event.input));
  }
}
