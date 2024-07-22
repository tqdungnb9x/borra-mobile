//Todo: Authentication service will registers the functions for authentication

import 'package:borra_app/src/authentication/auth/data/models/user_watched_ads.dart';

import '../../../../../app_base/services/rest_api/rest_api.dart';
import '../models/user.dart';

abstract class AuthenticationService {
  Future<BaseResponse<Map<String, dynamic>>> signIn(
      String username, String password);
  Future<BaseResponse<User?>> getUserInfo();
  Future<BaseResponse<bool>> signOut();
  Future<BaseResponse<String>> getWord();
  Future<BaseResponse<User?>> userWatchAds(
      {required User user, bool isPageResultWatchAds = false});
}
