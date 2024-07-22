import 'package:freezed_annotation/freezed_annotation.dart';

part 'status.freezed.dart';

@freezed
class Status with _$Status {
  const factory Status.idle() = StatusIdle;
  const factory Status.loading() = StatusLoading;
  const factory Status.failure({dynamic error}) = StatusFailure;
  const factory Status.success({data}) = StatusSuccess;
}
