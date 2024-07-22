import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/src/like/data/models/user_liked_content_model.dart';

import '../../../authentication/auth/data/models/user.dart';
import '../../../home/data/models/tag.dart';
import '../models/user_content.dart';

class AccountService extends Api {
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

  Future<BaseResponse<List<UserContent>>> getListUserLikedContent() async {
    final res = await get('accounts/contents/likes');

    if (res.success) {
      var list = (res.data as List<dynamic>)
          .map((e) => UserContent.fromJson(e))
          .toList();
      return BaseResponse.success(list);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<List<UserContent>>> getListUserReplayContent() async {
    final res = await get('accounts/contents/replays');

    if (!res.success) {
      return BaseResponse.error(res.message);
    }

    final List<dynamic> rawData = res.data as List<dynamic>;
    if (rawData.isEmpty) {
      return BaseResponse.success([]);
    }
    final List<UserContent> userContents =
        rawData.map((dynamic data) => UserContent.fromJson(data)).toList();

    final List<int> contentIds = userContents
        .map((UserContent userContent) => userContent.contentId)
        .toList();

    final BaseResponse<List<int>> likedContentIdsResponse =
        await getListUserLikedContentId(ids: contentIds);

    if (likedContentIdsResponse.success) {
      final List<int> likedContentIds = likedContentIdsResponse.data!;
      for (var userContent in userContents) {
        userContent.isLike = likedContentIds.contains(userContent.contentId);
      }
    }

    return BaseResponse.success(userContents);
  }

  Future<BaseResponse<List<UserLikedContent>>> getListUserLikedAll(
      {required int page}) async {
    final res =
        await get('accounts/contents/likes/index', query: {'page': page});

    if (res.success) {
      var list = (res.data['list'] as List<dynamic>)
          .map((e) => UserLikedContent.fromJson(e))
          .toList();
      return BaseResponse.success(list);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<List<UserLikedContent>>> getListUserReplayAll(
      {required int page}) async {
    final res =
        await get('accounts/contents/replays/index', query: {'page': page});

    if (res.success) {
      var list = (res.data['list'] as List<dynamic>)
          .map((e) => UserLikedContent.fromJson(e))
          .toList();
      return BaseResponse.success(list);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<List<int>>> getListUserLikedContentId(
      {required List<int> ids}) async {
    final res = await post('likes/index', data: {
      "type": "content",
      "ids": ids,
    });

    if (res.success) {
      List<int> list = (res.data as List<dynamic>)
          .map((e) => int.parse(e.toString()))
          .toList();
      return BaseResponse.success(list);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<List<AppTag>>> getTagList() async {
    final res = await get(
      'common/tags',
    );

    if (res.success) {
      var list =
          (res.data as List<dynamic>).map((e) => AppTag.fromMap(e)).toList();

      // return BaseResponse.success(sortList(list));
      return BaseResponse.success(list);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<bool>> setNotification({required bool value}) async {
    final res = await put('accounts/update/notify', data: {'is_notify': value});

    if (res.success) {
      return BaseResponse.success(res.data['status']);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse<bool>> updateProfile(User user) async {
    final res = await put(
      "accounts/update",
      data: user.toMapUpdate(),
    );
    if (res.success) {
      return BaseResponse.success(true);
    } else {
      // print(res.toString());
      return BaseResponse.error(res.message);
    }
  }

  Future<BaseResponse<bool>> deleteUser({required String reason}) async {
    final res = await delete("accounts", query: {
      "deleted_reason": reason,
    });
    if (res.success) {
      return BaseResponse.success(true);
    } else {
      return BaseResponse.error(res.message);
    }
  }
}
