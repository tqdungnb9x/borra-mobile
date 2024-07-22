part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    required Locale locale,
    required ThemeMode mode,
    required bool hasCredential,
    required AppModel appModel,
    @Default(Status.idle()) Status status,
    @Default([]) List<AppTag> listTags,
    @Default(false) bool isContentDetailOpen,
  }) = _AppState;

  factory AppState.initial() => AppState(
        locale: AppLanguages.defaultLang,
        mode: ThemeMode.system,
        hasCredential: false,
        appModel: const AppModel(),
      );
}
