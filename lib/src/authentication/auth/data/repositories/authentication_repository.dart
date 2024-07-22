import 'package:borra_app/src/authentication/auth/data/models/user.dart';

import '../../../../../app_base/services/rest_api/rest_api.dart';
import '../models/user_watched_ads.dart';
import '../services/authentication_service.dart';
import '../services/impl_authentication_service.dart';

//Todo: Authentication repository which will be responsible for managing the authentication domain.
class AuthenticationRepository {
  final AuthenticationService _service = ImplAuthenticationServices();
  // Future<BaseResponse<Token>> signIn(InfoSignIn infoSignIn) async {
  //   //Todo: Use crypto to hash the password by SHA256 algorithm.
  //   // final hashPassword =
  //   //     sha256.convert(utf8.encode(infoSignIn.password)).toString();
  //   // var result = await _service.signIn(infoSignIn.username, hashPassword);
  //   // if (result.success) {
  //   //   final token = Token.fromMap(result.data!);
  //   //   return BaseResponse.success(token);
  //   // } else {
  //   //   return BaseResponse.error(result.message);
  //   // }
  // }

  Future<BaseResponse<bool>> signOut() async {
    return await _service.signOut();
  }

  Future<BaseResponse<User?>> getUserInfo() async {
    return await _service.getUserInfo();
  }

  Future<BaseResponse<String>> getWord() async {
    return await _service.getWord();
  }

  Future<BaseResponse<User?>> userWatchAds(
      {required User user, bool isPageResultWatchAds = false}) async {
    return await _service.userWatchAds(
        user: user, isPageResultWatchAds: isPageResultWatchAds);
  }
}
