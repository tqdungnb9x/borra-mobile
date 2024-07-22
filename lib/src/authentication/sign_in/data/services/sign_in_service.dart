import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/src/authentication/sign_in/data/models/input_sign_in.dart';
import 'package:borra_app/src/authentication/sign_in/data/models/sign_in_info.dart';

class SigninService extends Api {
  Future<BaseResponse<SignInReturn>> signInAppWithKakao(
      {required InfoSignIn info}) async {
    // final res = await post("login/kakao/app", data: {
    //   "provider_id": info.providerId,
    //   "token": info.token,
    //   "name": info.name,
    //   "nickname": null,
    //   "email": info.email,
    //   "profile": null,
    //   "age_range": null,
    //   "birthday": null,
    //   "calendar": null,
    //   "gender": null
    // });
    final res = await post(
      "login/kakao/app",
      data: info.toServerMap(),
    );
    if (res.success) {
      SignInReturn result = SignInReturn.fromJson(res.data);
      return BaseResponse.success(result);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<SignInReturn>> signInAppWithApple({
    required String sub,
    required String token,
    required String name,
    required String email,
    required String hash,
    String? fcmToken,
  }) async {
    final res = await post(
      "login/apple/app",
      data: {
        "sub": sub,
        "token": token,
        "name": name,
        "email": email,
        "at_hash": hash,
        "fcm_token": fcmToken,
      },
    );
    if (res.success) {
      SignInReturn result = SignInReturn.fromJson(res.data);
      return BaseResponse.success(result);
    }
    return BaseResponse.error(res.message);
  }
}
