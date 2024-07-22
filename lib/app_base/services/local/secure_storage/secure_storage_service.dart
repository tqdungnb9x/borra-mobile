import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final _secureStorage = const FlutterSecureStorage();

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
        // sharedPreferencesName: 'Test2',
        // preferencesKeyPrefix: 'Test'
      );
  IOSOptions _getIOSOptions() => const IOSOptions();

  Future<void> writeSecureData(SecureStorageItem newItem) async {
    await _secureStorage.write(
      key: newItem.key,
      value: newItem.value,
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
  }

  Future<String?> readSecureData(String key) async {
    var readData = await _secureStorage.read(
      key: key,
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
    return readData;
  }

  Future<void> deleteSecureData(SecureStorageItem item) async {
    await _secureStorage.delete(
      key: item.key,
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
  }

  Future<bool> containsKeyInSecureData(String key) async {
    var containsKey = await _secureStorage.containsKey(
      key: key,
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
    return containsKey;
  }

  Future<List<SecureStorageItem>> readAllSecureData() async {
    var allData = await _secureStorage.readAll(
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
    List<SecureStorageItem> list =
        allData.entries.map((e) => SecureStorageItem(e.key, e.value)).toList();
    return list;
  }

  Future<void> deleteAllSecureData() async {
    await _secureStorage.deleteAll(
      iOptions: _getIOSOptions(),
    );
  }
}

class SecureStorageItem {
  SecureStorageItem(this.key, this.value);

  final String key;
  final String value;
}
