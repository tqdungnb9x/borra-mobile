import 'package:borra_app/app_base/config/app_config.dart';
import 'package:borra_app/common/widgets/app_header.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReceiveNotificationDetailScreen extends StatefulWidget {
  const ReceiveNotificationDetailScreen({
    super.key,
    required this.links,
  });
  final List<String> links;

  @override
  State<ReceiveNotificationDetailScreen> createState() =>
      _ReceiveNotificationDetailScreenState();
}

class _ReceiveNotificationDetailScreenState
    extends State<ReceiveNotificationDetailScreen> {
  late InAppWebViewController inAppWebViewController1;
  late InAppWebViewController inAppWebViewController2;
  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers = {
    Factory(() => EagerGestureRecognizer())
  };
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppHeader(
        context,
        titleText: '',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 500.r,
              child: Stack(
                children: [
                  InAppWebView(
                    initialUrlRequest:
                        URLRequest(url: Uri.parse(widget.links[0])),
                    onWebViewCreated: (controller) {
                      inAppWebViewController1 = controller;
                    },
                    gestureRecognizers: gestureRecognizers,
                  )
                ],
              ),
            ),
            AppSize.space32.verticalSpace,
            SizedBox(
              height: 500.r,
              child: Stack(
                children: [
                  InAppWebView(
                    initialUrlRequest:
                        URLRequest(url: Uri.parse(widget.links[1])),
                    onWebViewCreated: (controller) {
                      inAppWebViewController2 = controller;
                    },
                    gestureRecognizers: gestureRecognizers,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
