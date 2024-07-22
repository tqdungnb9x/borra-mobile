part of 'app_utils.dart';

abstract class OtherUtils {
  static fieldFocusChange(
    BuildContext context,
    FocusNode current,
    FocusNode next,
  ) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static hiddenKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static exportMarketIcon(String market) {
    switch (market) {
      default:
        return AppImages.imgDefault;
    }
  }
}
