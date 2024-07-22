import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/src/authentication/sign_in/data/models/input_sign_in.dart';
import 'package:borra_app/src/authentication/sign_in/data/models/sign_in_info.dart';
import 'package:borra_app/src/authentication/sign_in/data/services/sign_in_service.dart';

class SignInRepository {
  Future<BaseResponse<SignInReturn>> getAppTokenKakao(
      {required InfoSignIn info}) async {
    final SigninService service = SigninService();
    return await service.signInAppWithKakao(info: info);
  }

  Future<BaseResponse<SignInReturn>> getAppTokenApple({
    required String sub,
    required String token,
    required String name,
    required String email,
    required String hash,
    String? fcmToken,
  }) async {
    final SigninService service = SigninService();
    return await service.signInAppWithApple(
      sub: sub,
      token: token,
      name: name,
      email: email,
      hash: hash,
      fcmToken: fcmToken,
    );
  }
}
