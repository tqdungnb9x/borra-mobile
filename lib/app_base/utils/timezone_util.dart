part of 'app_utils.dart';

class UtilTimeZone {
  static String fullDateFormat = 'yyyy-MM-dd HH:mm';

  /// return time of user or server
  static DateTime now() {
    final local = DateTime.now();
    final utc = DateTime.now().toUtc();
    DateTime convert = utc.add(local.timeZoneOffset);
    if (AppConfig.instance.env.localTimeZone == false) {
      convert = utc.add(const Duration(hours: 10));
    }
    return convert;
  }

  /// return DateTime of Server
  /// datetime is utc
  static DateTime utcToServerZone(DateTime datetime, {Duration? duration}) {
    DateTime convert = datetime.add(duration ?? const Duration(hours: 10));
    return convert;
  }

  /// String Time of server
  /// datetime is utc
  static String utcToServerTime(DateTime datetime, {String? format}) {
    DateTime convert = datetime.add(const Duration(hours: 10));
    return DateFormat(format ?? 'yyyy-MM-dd').format(convert);
  }

  /// String Time local time or server
  /// datetime is utc
  static String viewTime(
    DateTime datetime, {
    String? format,
    String? language,
  }) {
    final local = DateTime.now();
    DateTime convert = datetime.add(local.timeZoneOffset);
    if (AppConfig.instance.env.localTimeZone == false) {
      convert = datetime.add(const Duration(hours: 10));
    }
    return DateFormat(
      format ?? AppConfig.instance.env.dateFormat,
      language ?? AppLanguages.defaultLang.languageCode,
    ).format(convert);
  }

  /// Return DateTime timezone user or server
  /// datetime is utc
  static DateTime utcToZone(DateTime datetime) {
    final local = DateTime.now();
    DateTime convert = datetime.add(local.timeZoneOffset);
    if (AppConfig.instance.env.localTimeZone == false) {
      convert = datetime.add(const Duration(hours: 10));
    }
    return convert;
  }

  /// Convert a DateTime to UTC Time
  /// datetime is user timezone or server time

  static DateTime zoneToUtc(DateTime datetime) {
    final local = DateTime.now();
    DateTime convert = datetime.subtract(local.timeZoneOffset);
    if (AppConfig.instance.env.localTimeZone == false) {
      convert = datetime.subtract(const Duration(hours: 10));
    }
    return DateTime.utc(
      convert.year,
      convert.month,
      convert.day,
      convert.hour,
      convert.minute,
      convert.second,
      convert.millisecond,
      convert.microsecond,
    );
  }

  /// Convert a microsecond to DateTime
  static DateTime microsecondToUtc(int microsecond) {
    final local = DateTime.now();
    final datetime = DateTime.fromMicrosecondsSinceEpoch(microsecond);
    DateTime convert = datetime.add(local.timeZoneOffset);
    if (AppConfig.instance.env.localTimeZone == false) {
      convert = datetime.subtract(const Duration(hours: 10));
    }
    return convert;
  }

  /// String Time local time or server
  /// datetime is utc
  static String formatDate(
    DateTime datetime, {
    String? format,
    String? language,
  }) {
    return DateFormat(
      format ?? AppConfig.instance.env.dateFormat,
      language ?? AppLanguages.defaultLang.languageCode,
    ).format(datetime);
  }

  static String formatTime(
    DateTime datetime, {
    String? format,
    String? language,
  }) {
    return DateFormat(
      format ?? AppConfig.instance.env.dateFormat,
      language ?? AppLanguages.defaultLang.languageCode,
    ).format(datetime);
  }

  static int convertToSecond(String time) {
    List<String> timeParts = time.split(':');
    int hours = int.parse(timeParts[0]);
    int minutes = int.parse(timeParts[1]);
    int seconds = int.parse(timeParts[2]);

    Duration duration =
        Duration(hours: hours, minutes: minutes, seconds: seconds);
    int totalSeconds = duration.inSeconds;
    return totalSeconds;
  }

  static String getStringDateTime({required DateTime time}) {
    final dateTimeFormat =
        DateFormat(fullDateFormat, AppLanguages.defaultLang.languageCode);
    final result = dateTimeFormat.format(time);
    return result;
  }

  static DateTime getDateTime2FromString({required String time}) {
    DateTime dateTimeFormat =
        DateFormat(fullDateFormat, AppLanguages.defaultLang.languageCode)
            .parse(time);
    return dateTimeFormat;
  }

  static String formatDatetimeToServer(String datetimeString) {
    DateTime dateTime = DateTime.parse(datetimeString);
    DateFormat formatter = DateFormat(
        "yyyy-MM-dd HH:mm:ss", AppLanguages.defaultLang.languageCode);
    String formattedDatetime = formatter.format(dateTime);
    return formattedDatetime;
  }

  ///Singleton factory
  static final _instance = UtilTimeZone._internal();

  factory UtilTimeZone() {
    return _instance;
  }

  UtilTimeZone._internal();
}
