part of 'app_config.dart';

class AppLanguages {
  static const String transPath = "assets/translations";

  ///Default Language
  static final Locale defaultLang = spLangs.first;

  ///List Language support in Application
  static final List<Locale> spLangs = [
    const Locale("ko", "KR"),
    const Locale("vi", "VN"),
  ];
}
