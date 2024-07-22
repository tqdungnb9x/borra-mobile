part of 'app_utils.dart';

abstract class LoggerUtils {
  static log(Object? value) {
    if (AppConfig.instance.env.debug) {
      Logger(printer: SimplePrinter()).d(value);
    }
    return null;
  }
}
