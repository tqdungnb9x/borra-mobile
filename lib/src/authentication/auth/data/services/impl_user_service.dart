import 'package:borra_app/app_base/services/rest_api/rest_api.dart';

import 'user_service.dart';

class ImplUserService extends Api implements UserService {
  @override
  Future<BaseResponse<Map<String, dynamic>>> getUserInfo() async {
    return BaseResponse.success({
      "id": "01",
      "role": "2",
      "name": "Tutor",
    });
  }
}
