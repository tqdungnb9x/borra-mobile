part of '../rest_api.dart';

class JWTInterceptor extends Interceptor {
  // final AppPreferences _store = AppPreferences.instance;
  final LocalSecureRepository _localSecureRepository = LocalSecureRepository();
  final listApiRejectToken = [
    "signin",
    "signup",
    "refresh",
    "dict-type",
    "country",
    "forget-password"
  ];
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // final token = _store.get<String>(AppPreferenceKey.accessToken);
    final token = await _localSecureRepository.readData(
        key: AppPreferenceKey.accessToken.value);
    bool isReject = false;

    for (var element in listApiRejectToken) {
      isReject = options.path.contains(element);
      if (isReject) break;
    }
    if (!isReject) {
      if (token == null) {
        // TODO no token found
        LoggerUtils.log('No Token found');
      } else {
        options.headers.putIfAbsent('Authorization', () => "Bearer $token");
      }
    }

    super.onRequest(options, handler);
  }
}
