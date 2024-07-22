part of 'app_bloc.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.initial() = AppEventInitial;
  const factory AppEvent.setOpenedDetail(bool input) = AppEventSetOpen;
}
