part of 'app_utils.dart';

class UiUtils {
  static Future<void> showInfoSnackBar(
    BuildContext context, {
    required String message,
    String? title,
    Duration duration = const Duration(seconds: 2),
    bool isError = false,
    FlushbarPosition position = FlushbarPosition.TOP,
    EdgeInsets margin = EdgeInsets.zero,
  }) async {
    await Flushbar(
      message: message,
      duration: duration,
      messageColor: AppColors.white,
      borderRadius: BorderRadius.circular(0),
      title: title,
      margin: margin,
      backgroundColor: isError ? AppColors.error : AppColors.neutral03,
      flushbarPosition: position,
    ).show(context);
  }
}
