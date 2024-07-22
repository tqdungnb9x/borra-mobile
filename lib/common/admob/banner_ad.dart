import 'dart:io';

import 'package:borra_app/app_base/config/app_config.dart';
import 'package:borra_app/app_base/models/ad_unit_id_model.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../app_base/constants/ad_unit_id.dart';

class BannerAdmob extends StatefulWidget {
  final AdSize size;
  final AdUnitId adUnitId;
  BannerAdmob({super.key, required this.size, required this.adUnitId});

  @override
  BannerAdmobState createState() => BannerAdmobState();
}

class BannerAdmobState extends State<BannerAdmob> {
  BannerAd? _bannerAd;

  String _adUnitId = "";

  @override
  void initState() {
    super.initState();
    if (AppAdUnitId.devEnv) {
      _adUnitId = Platform.isAndroid
          ? AppAdUnitId.testAndroidBanner
          : AppAdUnitId.testIDiOSBanner;
    } else {
      _adUnitId =
          Platform.isAndroid ? widget.adUnitId.android : widget.adUnitId.iOS;
    }
    _loadAd();
  }

  @override
  Widget build(BuildContext context) {
    return _bannerAd != null
        ? Container(
            margin: const EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            color: Colors.white,
            width: double.infinity,
            child: SizedBox(
                width: _bannerAd!.size.width.toDouble(),
                height: _bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd!)),
          )
        : const SizedBox();
  }

  /// Loads and shows a banner ad.
  ///
  /// Dimensions of the ad are determined by the AdSize class.
  void _loadAd() async {
    BannerAd(
      adUnitId: _adUnitId,
      request: const AdRequest(),
      size: widget.size,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) {},
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) {},
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) {},
      ),
    ).load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }
}
