import 'package:borra_app/app_base/services/rest_api/rest_api.dart';
import 'package:borra_app/src/splash/data/models/app_model.dart';
import 'package:borra_app/src/splash/data/services/app_services.dart';

import '../../../home/data/models/tag.dart';

class AppRepositories {
  final AppService _service = AppService();

  Future<BaseResponse<AppModel>> loadAppConfig() async {
    // ignore: unused_local_variable
    final result = _service.loadDataConfig(key: DataConfigType.term);
    await Future.delayed(const Duration(milliseconds: 500));
    return BaseResponse.success(const AppModel());
  }

  Future<BaseResponse<List<AppTag>>> getTagList() async {
    final result = await _service.getTagList();
    return result;
  }
}
