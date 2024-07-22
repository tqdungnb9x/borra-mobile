part of 'extension.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get txtTheme => Theme.of(this).textTheme;

  ButtonThemeData get btnTheme => Theme.of(this).buttonTheme;

  TextButtonThemeData get textBtnTheme => Theme.of(this).textButtonTheme;

  bool get isDarkMode =>
      MediaQuery.of(this).platformBrightness == Brightness.dark;

  T? getArguments<T>() => ModalRoute.of(this)?.settings.arguments as T?;
}
