import '../../app_base/constants/ad_unit_id.dart';
import '../../app_base/models/ad_unit_id_model.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// A simple app that loads a rewarded ad.
class RewardedAdmob extends StatefulWidget {
  final Widget button;
  final void Function() onAdLoaded;
  final int userId;
  final void Function()? onUserEarnedReward;
  final AdUnitId adUnitId;
  final bool? allowWatching;
  final String customData;
  const RewardedAdmob(
      {super.key,
      required this.button,
      required this.userId,
      required this.adUnitId,
      required this.onAdLoaded,
      this.onUserEarnedReward,
      this.allowWatching = true,
      required this.customData});

  @override
  RewardedAdmobState createState() => RewardedAdmobState();
}

class RewardedAdmobState extends State<RewardedAdmob> {
  RewardedAd? rewardedAd;
  String _adUnitId = "";
  bool adLoaded = false;

  @override
  void initState() {
    if (AppAdUnitId.devEnv) {
      _adUnitId =
          Platform.isAndroid ? widget.adUnitId.android : widget.adUnitId.iOS;
    } else {
      _adUnitId =
          Platform.isAndroid ? widget.adUnitId.android : widget.adUnitId.iOS;
    }
    super.initState();
    _loadAd();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: adLoaded && widget.allowWatching!
          ? () {
              rewardedAd?.show(onUserEarnedReward:
                  (AdWithoutView ad, RewardItem rewardItem) {
                // ignore: avoid_print
                print(ad.adUnitId);
                print('Reward amount: ${rewardItem.type}');
                if (widget.onUserEarnedReward != null) {
                  widget.onUserEarnedReward!();
                }
              });
            }
          : null,
      child: widget.button,
    );
  }

  /// Loads a rewarded ad.
  void _loadAd() async {
    RewardedAd.load(
        adUnitId: _adUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(onAdLoaded: (ad) {
          dynamic options = ServerSideVerificationOptions(
              userId: widget.userId.toString(), customData: widget.customData);
          ad.setServerSideOptions(options).then((value) => {
                ad.fullScreenContentCallback = FullScreenContentCallback(
                    // Called when the ad showed the full screen content.

                    onAdShowedFullScreenContent: (ad) {
                      setState(() {
                        adLoaded = false;
                      });
                      widget.onAdLoaded();
                    },
                    // Called when an impression occurs on the ad.
                    onAdImpression: (ad) {},
                    // Called when the ad failed to show full screen content.
                    onAdFailedToShowFullScreenContent: (ad, err) {
                      ad.dispose();
                    },
                    // Called when the ad dismissed full screen content.
                    onAdDismissedFullScreenContent: (ad) {
                      ad.dispose();
                      _loadAd();
                    },
                    // Called when a click is recorded for an ad.
                    onAdClicked: (ad) {})
              });

          // Keep a reference to the ad so you can show it later.
          setState(() {
            adLoaded = true;
          });
          widget.onAdLoaded();

          rewardedAd = ad;
        }, onAdFailedToLoad: (LoadAdError error) {
          // ignore: avoid_print
          print('RewardedAd failed to load: $error');
        }));
  }

  @override
  void dispose() {
    rewardedAd?.dispose();
    super.dispose();
  }
}
