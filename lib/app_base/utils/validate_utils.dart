part of 'app_utils.dart';

enum ValidateType { email, password, phone, rePassword, businessNumber, none }

abstract class ValidatorUtils {
  static const String errorEmpty = LocaleKeys.validate_empty;
  static const String errorEmail = LocaleKeys.validate_format_email;
  static const String errorPassword = LocaleKeys.validate_format_password;
  static const String errorRePassword = LocaleKeys.validate_compare_password;
  static const String errorBusinessNumber =
      LocaleKeys.validate_format_business_number;

  static String sourceEmailReg =
      r"^([a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$";

  static validate(
    String? data, {
    required BuildContext context,
    ValidateType type = ValidateType.none,
    int? min,
    int? max,
    bool allowEmpty = false,
  }) {
    ///Empty
    if (!allowEmpty && data!.isEmpty) {
      return tr(errorEmpty);
    }

    switch (type) {
      case ValidateType.email:

        ///Email pattern
        final RegExp emailRegex = RegExp(sourceEmailReg);
        if (!emailRegex.hasMatch(data!)) {
          return tr(errorEmail);
        }
        return null;
      case ValidateType.password:
        if (!data!.isPassword) {
          return tr(errorPassword);
        }
        return null;

      case ValidateType.businessNumber:
        if (!(data!.length == StringUtils.formatBusinessNumber.length)) {
          return tr(errorBusinessNumber);
        }
        return null;
      default:
        return null;
    }
  }
}
