part of 'app_utils.dart';

abstract class DeviceUtils {
  static String getDeviceType(BuildContext context) {
    final data = MediaQueryData.fromView(View.of(context));
    return data.size.shortestSide < 600 ? 'phone' : 'tablet';
  }

  static Future<DeviceModel?> loadDevice() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    DeviceModel? device;
    try {
      if (Platform.isAndroid) {
        final android = await deviceInfoPlugin.androidInfo;
        device = DeviceModel(
          uuid: android.id,
          model: "Android",
          version: android.version.sdkInt.toString(),
          type: android.model,
        );
      } else if (Platform.isIOS) {
        final IosDeviceInfo ios = await deviceInfoPlugin.iosInfo;
        device = DeviceModel(
          uuid: ios.identifierForVendor!,
          name: ios.name,
          model: ios.systemName,
          version: ios.systemVersion,
          type: ios.utsname.machine,
        );
      }
    } catch (e) {
      // LoggerUtils.logger.e(e);
      LoggerUtils.log(e);
    }
    return device;
  }

  static Future<String?> getDeviceToken() async {
    return null;
  }
}
