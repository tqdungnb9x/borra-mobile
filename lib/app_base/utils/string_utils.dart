part of 'app_utils.dart';

abstract class StringUtils {
  static final Random _random = Random();

  // ignore: constant_identifier_names
  static const _CHARS =
      "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890";

  static const formatPhoneNumber = '999-9999-9999';
  static const formatBusinessNumber = '999-99-99999';
  static const formatBankNumber = '999999-99-999999';
  static String getRandomString(int length) {
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _CHARS.codeUnitAt(
          _random.nextInt(_CHARS.length),
        ),
      ),
    );
  }

  static String formatNumber(double number, {Locale? locale}) {
    var numberFormat =
        NumberFormat.decimalPattern(locale == null ? 'en' : locale.countryCode);
    return numberFormat.format(number);
  }

  static String convertHtmlToText(String input) {
    return input.replaceAll('<br>', '\n');
  }

  static String mapGenderToString(int gender) {
    switch (gender) {
      case 0:
        return '남자';
      case 1:
        return '여성';

      default:
        return '남자';
    }
  }

  static String mapCalendarToString(String calendar) {
    switch (calendar) {
      case 'solar':
        return '양력';
      case 'lunar':
        return '음력';

      default:
        return '윤달';
    }
  }

  static String convertContentToDisplay(String input,
      {String? person1Name, String? partnerName}) {
    final user = person1Name ?? '';
    final partner = partnerName ?? '';
    return input
        .replaceAll('<br>', '\n')
        .replaceAll('\$man_name', user)
        .replaceAll('\$woman_name', partner)
        .replaceAll('\$user_name', user);
  }
}
