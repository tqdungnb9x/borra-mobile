part of 'extension.dart';

extension DateTimeExt on DateTime {
  String get yyyyMMdd {
    final result =
        "$year.${month < 10 ? "0$month" : month}.${day < 10 ? "0$day" : day}";
    return result;
  }

  String get MMdd {
    final result =
        "${month < 10 ? "0$month" : month}.${day < 10 ? "0$day" : day}";
    return result;
  }

  String get yyyyMMddTime {
    final result =
        "$year.${month < 10 ? "0$month" : month}.${day < 10 ? "0$day" : day} ${hour < 10 ? "0$hour" : hour}:${minute < 10 ? "0$minute" : minute}";
    return result;
  }

  String get dayOfWeek {
    return DateFormat.EEEE(AppLanguages.defaultLang.languageCode).format(this);
  }

  String get dateAndTimeFormat {
    final result =
        "${month < 10 ? "0$month" : month}.${day < 10 ? "0$day" : day}\n${hour < 10 ? "0$hour" : hour}:${minute < 10 ? "0$minute" : minute}";
    return result;
  }
}
