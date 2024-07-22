import '../../../../../app_base/services/rest_api/rest_api.dart';
import '../models/user.dart';
import '../services/impl_user_service.dart';
import '../services/user_service.dart';

class UserRepository {
  final UserService _service = ImplUserService();
  Future<BaseResponse<User>> getUserInfo() async {
    var result = await _service.getUserInfo();

    if (result.success) {
      var user = User.fromMap(result.data!);
      return BaseResponse.success(user);
    }
    return BaseResponse.error(result.message);
  }
}
