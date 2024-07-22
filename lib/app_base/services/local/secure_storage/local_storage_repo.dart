import 'package:borra_app/app_base/services/local/secure_storage/secure_storage.dart';

import '../../../config/app_config.dart';
import '../shared_preferences/app_preference.dart';

class LocalRepository {
  final localStore = AppPreferences.instance;
  LocalSecureRepository localSecureRepo = LocalSecureRepository();

  Future<bool> checkUserRemembered() async {
    final accessToken =
        await localSecureRepo.readData(key: AppPreferenceKey.accessToken.value);

    if (accessToken != null) {
      return true;
    }
    return false;
  }

  Future<String> getSaveLanguage() async {
    final languageCode = await localStore.get(AppPreferenceKey.language);
    if (languageCode != null) {
      return languageCode;
    }
    return AppLanguages.defaultLang.toLanguageTag();
  }

  Future<bool> saveLanguage(String langCode) async {
    final result =
        await localStore.set<String>(AppPreferenceKey.language, langCode);
    return result;
  }

  checkFirstTime() async {
    final isSecondTime = await localStore.get(AppPreferenceKey.welcome);
    if (isSecondTime ?? true) {
      await clearTokens();
    }
    await localStore.set<bool>(AppPreferenceKey.welcome, false);
  }

  Future<bool> setFirstTime(bool isFirstTime) async {
    final result =
        await localStore.set<bool>(AppPreferenceKey.welcome, isFirstTime);
    return result;
  }

  Future<void> clearTokens() async {
    await AppPreferences.instance.clear(AppPreferenceKey.accessToken);
    await localSecureRepo.removeData(key: AppPreferenceKey.accessToken.value);
    await AppPreferences.instance.clear(AppPreferenceKey.refreshToken);
    await localSecureRepo.removeData(key: AppPreferenceKey.refreshToken.value);
    return;
  }
}
