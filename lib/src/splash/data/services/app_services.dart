import 'dart:io';

import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/src/splash/data/models/app_model.dart';

import '../../../home/data/models/tag.dart';

class AppService extends Api {
  ///  Todo: Implement load app config data by key
  ///  @param key: the key is the code of type
  Future<Map<String, dynamic>> loadDataConfig(
      {required DataConfigType key}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    var data = {
      "id": "123456",
    };
    return data;
  }

  Future<BaseResponse<List<AppTag>>> getTagList() async {
    final res = await get(
      'common/tags',
    );

    if (res.success) {
      var list =
          (res.data as List<dynamic>).map((e) => AppTag.fromMap(e)).toList();

      return BaseResponse.success(list);
    }
    return BaseResponse.error(res.message);
  }

  Future<BaseResponse> loadWidgetData() async {
    try {
      // await Future.delayed(const Duration(seconds: 5));
      final res = await getWithRetry(
        'contents/common/widget',
      );
      if (res.success) {
        final val = res.data as Map<String, dynamic>;
        return BaseResponse.success(val);
      }
      return BaseResponse.error(res.message);
      // final resPre = await get(
      //   'master-data/prepare-widget',
      // );

      // if (resPre.success) {

      //   // final val = resPre.data as Map<String, dynamic>;
      // } else {
      //   return BaseResponse.error(resPre.message);
      // }
    } catch (e) {
      return BaseResponse.error(e.toString());
    }
  }

  Future<BaseResponse> saveFCMToken(
      {required String deviceToken, int? userId}) async {
    if (userId != null) {
      final res = await put("accounts/update/fcm-token",
          data: {'fcm_token': deviceToken});
      if (res.success) {
        final val = res.data as Map<String, dynamic>;
        return BaseResponse.success(val);
      }
      return BaseResponse.error(res.message);
    } else {
      return BaseResponse.error('Invalid userId');
    }
  }
}
