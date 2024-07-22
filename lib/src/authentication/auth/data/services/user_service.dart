import 'package:borra_app/app_base/services/rest_api/rest_api.dart';

abstract class UserService {
  Future<BaseResponse<Map<String, dynamic>>> getUserInfo();
}
