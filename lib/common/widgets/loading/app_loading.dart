import 'package:borra_app/app_base/config/app_config.dart';
import 'package:borra_app/common/widgets/dialogs/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'w_app_loading.dart';

class AppLoading extends AppDialog {
  // Show loading dialog shortcut
  /// Change icon at https://pub.dev/packages/flutter_spinkit
  static void show(BuildContext context) {
    context.read<AppLoading>().showLoading(context);
  }

  /// Hide loading dialog shortcut
  static void dismiss(BuildContext context) {
    context.read<AppLoading>().dismissLoading();
  }

  /// Show loading dialog
  /// Change icon at https://pub.dev/packages/flutter_spinkit
  Future<void> showLoading(BuildContext context) {
    return showAppDialog(
      context,
      const WAppLoading(
        color: Colors.white,
      ),
    );
  }

  /// Hide loading dialog
  void dismissLoading() {
    return dismissAppDialog();
  }
}

class AppCircularLoading extends StatelessWidget {
  const AppCircularLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
            color: AppColors.primary01, backgroundColor: AppColors.neutral06));
  }
}
