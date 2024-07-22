import 'package:borra_app/common/main_bloc.dart';
import 'package:borra_app/src/authentication/auth/data/models/auth_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDialog {
  BuildContext? _context;
  bool isShowing = false;

  /// Show the dialog and store it's context for further dismiss
  static Future show(BuildContext context, Dialog dialog,
      {bool dismissible = false, required VoidCallback onNextAction}) async {
    if (MainBloc.authBloc.state.authStatus ==
        const AuthStatus.unauthenticated()) {
      return context
          .read<AppDialog>()
          .showAppDialog(context, dialog, dismissible: dismissible);
    } else {
      onNextAction.call();
    }
  }

  static void dismiss(BuildContext context) async {
    context.read<AppDialog>().dismissAppDialog();
  }

  Future showAppDialog(BuildContext context, Widget dialog,
      {bool dismissible = false}) {
    dismissAppDialog();

    isShowing = true;
    return showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (dialogContext) {
        if (!isShowing) {
          dismissAppDialog();
        } else {
          _context = dialogContext;
        }
        return dialog;
      },
    ).then((value) {
      _context = null;
      isShowing = false;
    });
  }

  void dismissAppDialog() {
    isShowing = false;
    if (_context != null) {
      try {
        if (Navigator.canPop(_context!)) {
          Navigator.of(_context!).pop(true);
        }
      } catch (e) {
        // Unhandled Exception: Looking up a deactivated widget's ancestor is unsafe.
      } finally {
        _context = null;
      }
    }
  }
}
