part of 'app_utils.dart';

abstract class LanguageUtils {
  ///Get Language Global Language Name
  static String getGlobalLanguageName(String code) {
    switch (code) {
      case 'ko':
        return 'Korea';
      default:
        return 'Unknown';
    }
  }
}
