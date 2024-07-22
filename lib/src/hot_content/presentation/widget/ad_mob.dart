import 'dart:io';
import 'package:borra_app/app_base/constants/ad_unit_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../../app_base/models/ad_unit_id_model.dart';

class CategoryAdmob extends StatefulWidget {
  final TemplateType templateType;
  final String? factoryID;
  const CategoryAdmob({
    super.key,
    required this.templateType,
    this.factoryID,
  });
  static _myDefaultFunc() {}

  @override
  CategoryAdmobState createState() => CategoryAdmobState();
}

class CategoryAdmobState extends State<CategoryAdmob> {
  NativeAd? _nativeAd;
  bool _nativeAdIsLoaded = false;
  String _adUnitId = "";

  @override
  void initState() {
    if (AppAdUnitId.devEnv) {
      _adUnitId = Platform.isAndroid
          ? AppAdUnitId.testAndroidNative
          : AppAdUnitId.testIDiOSNative;
    } else {
      _adUnitId = Platform.isAndroid
          ? AppAdUnitId.menuListCategoryAndroid
          : AppAdUnitId.menuListCategoryiOS;
    }

    super.initState();
    _loadAd();
  }

  @override
  Widget build(BuildContext context) {
    checkVideoCompletion();
    return _nativeAdIsLoaded && _nativeAd != null
        ? Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                child: const Divider(
                  thickness: 1,
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 320, // minimum recommended width
                  minHeight: 122.h, // minimum recommended height
                  maxWidth: 400,
                  maxHeight: 122.h,
                ),
                child: AdWidget(ad: _nativeAd!),
              ),
            ],
          )
        : const SizedBox();
  }

  /// Loads and shows a banner ad.
  ///
  /// Dimensions of the ad are determined by the AdSize class.
  void _loadAd() {
    _nativeAd = NativeAd(
        adUnitId: _adUnitId,
        factoryId: widget.factoryID,
        request: const AdRequest(),
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            print('$NativeAd loaded.');
            setState(() {
              _nativeAdIsLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {
            // Dispose the ad here to free resources.
            print('$NativeAd failedToLoad: $error');
            ad.dispose();
          },
          // Called when a click is recorded for a NativeAd.
          onAdClicked: (ad) {},
          // Called when an impression occurs on the ad.
          onAdImpression: (ad) {},
          // Called when an ad removes an overlay that covers the screen.
          onAdClosed: (ad) {},
          // Called when an ad opens an overlay that covers the screen.
          onAdOpened: (ad) {},
          // For iOS only. Called before dismissing a full screen view
          onAdWillDismissScreen: (ad) {},
          // Called when an ad receives revenue value.
          onPaidEvent: (ad, valueMicros, precision, currencyCode) {},
        ),
        nativeTemplateStyle: widget.factoryID == null
            ? NativeTemplateStyle(
                // Required: Choose a template.
                templateType: widget.templateType,
                // Optional: Customize the ad's style.
              )
            : null
        // Styling
        )
      ..load();
  }

  void checkVideoCompletion() {
    // Check video duration periodically
    if (_nativeAd!.adManagerRequest != null) {
      // Extract video duration from responseInfo
      print("-----_nativeAd!.responseInfo----${_nativeAd!.adManagerRequest!}");
    }
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    super.dispose();
  }
}
