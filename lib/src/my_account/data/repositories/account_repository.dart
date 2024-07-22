import 'package:borra_app/src/authentication/auth/data/models/user.dart';
import 'package:borra_app/src/my_account/data/services/account_service.dart';

import '../../../../app_base/services/rest_api/rest_api.dart';
import '../../../home/data/models/tag.dart';
import '../../../like/data/models/user_liked_content_model.dart';
import '../models/user_content.dart';

class AccountRepository {
  final AccountService _service = AccountService();

  Future<BaseResponse<User?>> getUserInfo() async {
    return await _service.getUserInfo();
  }

  Future<BaseResponse<List<UserContent>>> getListUserLiked() async {
    final result = await _service.getListUserLikedContent();
    return result;
  }

  Future<BaseResponse<List<UserContent>>> getListUserReplays() async {
    final result = await _service.getListUserReplayContent();
    return result;
  }

  Future<BaseResponse<List<UserLikedContent>>> getListUserLikedAll(
      {int page = 1}) async {
    final result = await _service.getListUserLikedAll(page: page);
    return result;
  }

  Future<BaseResponse<List<UserLikedContent>>> getListUserReplayAll(
      {int page = 1}) async {
    final result = await _service.getListUserReplayAll(page: page);
    return result;
  }

  Future<BaseResponse<List<int>>> getListLikeId(
      {required List<int> ids}) async {
    final result = await _service.getListUserLikedContentId(ids: ids);
    return result;
  }

  Future<BaseResponse<List<AppTag>>> getTagList() async {
    final result = await _service.getTagList();
    return result;
  }

  Future<BaseResponse<bool>> setNotification({required bool status}) async {
    final result = await _service.setNotification(value: status);
    return result;
  }

  Future<BaseResponse<bool>> updateProfile({required User user}) async {
    final result = await _service.updateProfile(user);
    return result;
  }

  Future<BaseResponse<bool>> deleteUser({required String reason}) async {
    return await _service.deleteUser(reason: reason);
  }
}
