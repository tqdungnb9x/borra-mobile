import 'dart:async';
import 'dart:convert';

import 'package:borra_app/app_base/utils/app_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_preference_key.dart';

class AppPreferences {
  late final SharedPreferences _store;

  AppPreferences._internal();

  static final AppPreferences instance = AppPreferences._internal();

  Future<bool> init() {
    try {
      return SharedPreferences.getInstance()
          .then((value) => _store = value)
          .then((value) => true);
    } catch (e) {
      return Future(() => false);
    }
  }

  T? get<T>(AppPreferenceKey key, {T? defValue}) {
    try {
      final result = _store.get(key.value);
      return (result as T);
    } catch (e) {
      return defValue;
    }
  }

  Future<bool> set<T>(AppPreferenceKey key, T value) async {
    try {
      switch (T) {
        case int:
          return await _store.setInt(key.value, value as int);
        case bool:
          return await _store.setBool(key.value, value as bool);
        case double:
          return await _store.setDouble(key.value, value as double);
        case String:
          return await _store.setString(key.value, value as String);
        case List<String>:
          return await _store.setStringList(key.value, value as List<String>);
        default:
          return await _store.setString(key.value, jsonEncode(key.value));
      }
    } catch (e) {
      LoggerUtils.log(e);
      return true;
    }
  }

  clear(AppPreferenceKey key) async => _store.remove(key.value);

  clearAll() async => _store.clear();
}
