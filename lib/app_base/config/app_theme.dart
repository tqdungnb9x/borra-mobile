part of 'app_config.dart';

class AppTheme {
  AppTheme._internal();

  static final ThemeData light = ThemeData(
    useMaterial3: false,
    splashFactory: InkRipple.splashFactory,
    brightness: Brightness.light,
  );

  static final ThemeData dark = ThemeData.dark(useMaterial3: false).copyWith(
    splashFactory: InkRipple.splashFactory,
    brightness: Brightness.dark,
  );
}
