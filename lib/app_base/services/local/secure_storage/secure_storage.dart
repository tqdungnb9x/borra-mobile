import 'package:borra_app/app_base/services/local/secure_storage/secure_storage_service.dart';

class LocalSecureRepository {
  final SecureStorageService _secureStorageService = SecureStorageService();
  Future<bool> saveData(SecureStorageItem item) async {
    try {
      _secureStorageService.writeSecureData(item);
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<String?> readData({required String key}) async {
    String? data = await _secureStorageService.readSecureData(key);

    return data;
  }

  Future<bool> removeData({required String key}) async {
    SecureStorageItem item = SecureStorageItem(key, '');
    try {
      await _secureStorageService.deleteSecureData(item);
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> containsKey({required String key}) async {
    try {
      await _secureStorageService.containsKeyInSecureData(key);
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<List<SecureStorageItem>> readAllData() async {
    List<SecureStorageItem> list;
    try {
      list = await _secureStorageService.readAllSecureData();
    } catch (e) {
      list = [];
    }

    return list;
  }

  Future<bool> deleteAllData() async {
    try {
      await _secureStorageService.deleteAllSecureData();
    } catch (e) {
      return false;
    }

    return true;
  }
}
