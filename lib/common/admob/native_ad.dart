import 'dart:io';
import 'package:borra_app/app_base/constants/ad_unit_id.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../app_base/models/ad_unit_id_model.dart';

class NativeAdmob extends StatefulWidget {
  final TemplateType templateType;
  final AdUnitId adUnitId;
  final String? factoryID;
  final double height;
  final void Function()? onAdLoaded;
  final void Function()? onAdLoadedFail;
  const NativeAdmob(
      {super.key,
      required this.templateType,
      required this.adUnitId,
      this.onAdLoaded = _myDefaultFunc,
      this.height = 90,
      this.factoryID,
      this.onAdLoadedFail = _myDefaultFunc});
  static _myDefaultFunc() {}

  @override
  NativeAdmobState createState() => NativeAdmobState();
}

class NativeAdmobState extends State<NativeAdmob> {
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
      _adUnitId =
          Platform.isAndroid ? widget.adUnitId.android : widget.adUnitId.iOS;
    }

    super.initState();
    _loadAd();
  }

  @override
  Widget build(BuildContext context) {
    checkVideoCompletion();
    return _nativeAdIsLoaded && _nativeAd != null
        ? ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 320, // minimum recommended width
              minHeight: widget.templateType == TemplateType.small
                  ? widget.height
                  : 320, // minimum recommended height
              maxWidth: 400,
              maxHeight: widget.templateType == TemplateType.small
                  ? widget.height
                  : 400,
            ),
            child: AdWidget(ad: _nativeAd!),
          )
        : ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 320, // minimum recommended width
              minHeight: widget.templateType == TemplateType.small
                  ? widget.height
                  : 320, // minimum recommended height
              maxWidth: 400,
              maxHeight: widget.templateType == TemplateType.small
                  ? widget.height
                  : 400,
            ),
          );
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
            widget.onAdLoaded!();
          },
          onAdFailedToLoad: (ad, error) {
            // Dispose the ad here to free resources.
            print('$NativeAd failedToLoad: $error');
            widget.onAdLoaded!();
            widget.onAdLoadedFail!();
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
