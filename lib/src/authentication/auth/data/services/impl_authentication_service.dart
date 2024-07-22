import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/app_base/utils/jwt.dart';
import 'package:borra_app/src/authentication/auth/data/models/user.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart' as kakao;

import '../models/user_watched_ads.dart';
import 'authentication_service.dart';

//Todo: Implement the functions used for authentication
class ImplAuthenticationServices extends Api implements AuthenticationService {
  @override
  Future<BaseResponse<Map<String, dynamic>>> signIn(
      String username, String password) async {
    return BaseResponse.success({
      "accessToken": "01",
      "refreshToken": "00",
    });
  }

  @override
  Future<BaseResponse<bool>> signOut() async {
    try {
      await kakao.UserApi.instance.logout();
      final res = await post(
        "auth/logout",
      );
      if (res.success) {
        print('Logout succeeds. Tokens are deleted from SDK.');
        return BaseResponse.success(true);
      }
      print('Logout succeeds. Tokens are deleted from SDK.');
      return BaseResponse.success(false);
    } catch (e) {
      print('Logout fails. Tokens are deleted from SDK.');
      return BaseResponse.success(false);
    }
  }

  @override
  Future<BaseResponse<User?>> getUserInfo() async {
    final res = await get(
      "auth/user",
    );
    if (res.success) {
      User user = User.fromJson(res.data);
      return BaseResponse.success(user);
    }
    return BaseResponse.error(res.message);
  }

  @override
  Future<BaseResponse<String>> getWord() async {
    final res = await get(
      "contents/common/word",
    );
    if (res.success) {
      return BaseResponse.success(res.data);
    }
    return BaseResponse.error(res.message);
  }

  @override
  Future<BaseResponse<User?>> userWatchAds(
      {required User user, bool isPageResultWatchAds = false}) async {
    User updatedUser = isPageResultWatchAds
        ? user.copyWith(
            remainingWatchAd: user.remainingWatchAd! - 1,
            coin: user.coin + 500,
            pageResultWatchAd: true)
        : user.copyWith(
            remainingWatchAd: user.remainingWatchAd! - 1,
            coin: user.coin + 500,
          );
    return BaseResponse.success(updatedUser);
  }
}
