import 'dart:async';

import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/src/content_feedback/data/models/feedback.dart';
import 'package:borra_app/src/content_feedback/data/repositories/feedback_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app_base/models/status.dart';
import '../../data/models/content_feedback.dart';

part 'feedback_state.dart';
part 'feedback_event.dart';
part 'feedback_bloc.freezed.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> with ApiError {
  final FeedbackRepository repo = FeedbackRepository();
  FeedbackBloc() : super(FeedbackState.initial()) {
    on<_Initial>(_onInitital);
    on<PostFeedback>(_onPostFeedback);
  }

  initial(int contentId, int? purchaseId) {
    add(_Initial(contentId, purchaseId));
  }

  FutureOr<void> _onInitital(
      _Initial event, Emitter<FeedbackState> emit) async {
    await apiCallSafety<AppFeedback>(
      () async {
        return repo.getFeedback(
            contentId: event.contentId, purchaseId: event.purchaseId);
      },
      onStart: () async => emit(state.copyWith(status: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(status: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
            status: Status.success(data: res),
            listFeedback: res!.listFeedback,
            feedbackResult: res.feedbackSelected));
      },
      onCompleted: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(status: const Status.idle()));
      },
    );
  }

  FutureOr<void> _onPostFeedback(
      PostFeedback event, Emitter<FeedbackState> emit) async {
    await apiCallSafety<FeedbackResult>(
      () async {
        return repo.postFeedback(
            feedback: event.selectedFeedback,
            contentId: event.contentId,
            purchaseId: event.purchaseId);
      },
      onStart: () async =>
          emit(state.copyWith(statusPost: const Status.loading())),
      onError: (error) async {
        addError(error);
        emit(state.copyWith(statusPost: Status.failure(error: error)));
      },
      onSuccess: (res) async {
        emit(state.copyWith(
          statusPost: Status.success(data: res),
          feedbackContent: res!,
        ));
        initial(event.contentId, event.purchaseId);
      },
      onCompleted: () async {
        emit(state.copyWith(statusPost: const Status.idle()));
      },
      onFinally: () async {
        emit(state.copyWith(statusPost: const Status.idle()));
      },
    );
  }
}
