import '../models/device_model.dart';
import 'env_type.dart';

class Env {
  final EnvType envType;
  final bool debug;
  final bool external;
  final int pageSize;
  final bool devicePreview;
  final String version;
  final String dateFormat;
  final String clientID;
  final String baseUrl;
  final String siteUrl;
  final String statementSyncTime;
  final bool localTimeZone;
  final int connectionTimeout;
  final int receiveTimeout;
  DeviceModel? device;
  final String kakaoTalk;
  final String kakaoNativeAppKey;
  final String kakaoJavaScriptAppKey;
  final String kakaoRestApiKey;
  final String serverKey;
  Env(
      {required this.envType,
      required this.debug,
      required this.external,
      required this.pageSize,
      required this.devicePreview,
      required this.version,
      required this.dateFormat,
      required this.clientID,
      required this.baseUrl,
      required this.siteUrl,
      required this.statementSyncTime,
      required this.localTimeZone,
      required this.connectionTimeout,
      required this.receiveTimeout,
      this.device,
      required this.kakaoTalk,
      required this.kakaoNativeAppKey,
      required this.kakaoJavaScriptAppKey,
      required this.kakaoRestApiKey,
      required this.serverKey});

  factory Env.dev() {
    return Env(
        envType: EnvType.dev,
        debug: true,
        external: false,
        pageSize: 10,
        devicePreview: false,
        version: '0.0.1',
        dateFormat: 'yyyy-MM-dd',
        clientID: '',
        baseUrl: 'https://api.fles.dev/',
        siteUrl: 'https://borra.fles.dev/',
        statementSyncTime: "2021-01-01",
        localTimeZone: true,
        connectionTimeout: 15000,
        receiveTimeout: 15000,
        kakaoTalk: "http://pf.kakao.com/_ymuIC/chat",
        kakaoNativeAppKey: "e590f461438b4547038b9c245d8bcca5",
        kakaoJavaScriptAppKey: "f4a39a45719d2481b1d935234400e4fb",
        kakaoRestApiKey: "ad3ccc92ffada7d40350cac19f77c55a",
        serverKey: "base64:U6nCja4JMPHoykJLshjtX05Umn33+GKv7wZ28eG+vL8=");
  }

  factory Env.prod() {
    return Env(
        envType: EnvType.production,
        debug: false,
        external: false,
        pageSize: 10,
        devicePreview: false,
        version: '0.0.1',
        dateFormat: 'HH:mm, MMM dd yyyy',
        clientID: '',
        baseUrl: 'https://api.borra.today/',
        siteUrl: 'https://borra.today/',
        statementSyncTime: "2021-01-01",
        localTimeZone: true,
        connectionTimeout: 10000,
        receiveTimeout: 10000,
        kakaoTalk: "http://pf.kakao.com/_ymuIC/chat",
        kakaoNativeAppKey: "e590f461438b4547038b9c245d8bcca5",
        kakaoJavaScriptAppKey: "f4a39a45719d2481b1d935234400e4fb",
        kakaoRestApiKey: "ad3ccc92ffada7d40350cac19f77c55a",
        serverKey: "base64:U6nCja4JMPHoykJLshjtX05Umn33+GKv7wZ28eG+vL8=");
  }

  factory Env.staging() {
    return Env(
        envType: EnvType.staging,
        debug: true,
        external: false,
        devicePreview: false,
        pageSize: 10,
        version: '0.0.1',
        dateFormat: 'HH:mm, MMM dd yyyy',
        clientID: '',
        baseUrl: 'https://api.borra.today/',
        siteUrl: 'https://borra.today/',
        statementSyncTime: "2021-01-01",
        localTimeZone: true,
        connectionTimeout: 10000,
        receiveTimeout: 10000,
        kakaoTalk: "http://pf.kakao.com/_ymuIC/chat",
        kakaoNativeAppKey: "e590f461438b4547038b9c245d8bcca5",
        kakaoJavaScriptAppKey: "f4a39a45719d2481b1d935234400e4fb",
        kakaoRestApiKey: "ad3ccc92ffada7d40350cac19f77c55a",
        serverKey: "base64:YWvKlvneo8+S9lYpBvzcRZlxHs+2B3J+VWwi8BSNaa0=");
  }
  // Future<void> setDevice() async {
  //   device = await DeviceUtils.loadDevice();
  // }

  // Future<void> setDeviceToken() async {
  //   final token = await DeviceUtils.getDeviceToken();
  //   device!.newToken = token;
  // }
}
