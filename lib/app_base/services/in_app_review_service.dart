import 'dart:io';

import 'package:borra_app/app_base/constants/in_app_review_constant.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';

enum Availability { loading, available, unavailable }

class InAppReviewService {
  Availability _availability = Availability.loading;
  Availability get availability => _availability;
  final InAppReview _inAppReview = InAppReview.instance;

  init() async {
    (<T>(T? o) => o!)(WidgetsBinding.instance).addPostFrameCallback((_) async {
      try {
        final isAvailable = await _inAppReview.isAvailable();

        _availability = isAvailable && !Platform.isAndroid
            ? Availability.available
            : Availability.unavailable;
      } catch (_) {
        _availability = Availability.unavailable;
      }
    });
  }

  Future<void> requestReview() {
    return _inAppReview.requestReview();
  }

  Future<void> openStoreListing() {
    return _inAppReview.openStoreListing(
      appStoreId: InAppReviewConstant.appStoreId,
    );
  }
}
