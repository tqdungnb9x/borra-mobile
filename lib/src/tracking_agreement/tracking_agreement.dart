// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:borra_app/app_base/constants/shared_pref_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app_base/constants/in_app_review_constant.dart';
import 'tracking_dialog.dart';
import 'tracking_page1.dart';
import 'tracking_page2.dart';

class TrackingAgreement extends StatefulWidget {
  final Function() setPermission;
  const TrackingAgreement({super.key, required this.setPermission});

  @override
  State<TrackingAgreement> createState() => _TrackingAgreementState();
}

class _TrackingAgreementState extends State<TrackingAgreement> {
  late SharedPreferences _prefs;
  bool isFirstInstall = false;
  int indexPage = 1;
  bool requestTracking = false;
  @override
  void initState() {
    super.initState();
    initial();
  }

  _getPermissionTracking() async {
    final lastOpenedTimestamp =
        _prefs.getInt(SharedPrefConstant.kLastTrackingOpened);
    final now = DateTime.now().millisecondsSinceEpoch;

    if (await AppTrackingTransparency.trackingAuthorizationStatus ==
            TrackingStatus.notDetermined ||
        await AppTrackingTransparency.trackingAuthorizationStatus ==
            TrackingStatus.denied) {
      _prefs = await SharedPreferences.getInstance();
      if (lastOpenedTimestamp == null) {
        _prefs.setInt(SharedPrefConstant.kLastTrackingOpened, now);
      } else {
        _prefs.setInt(SharedPrefConstant.kLastTrackingOpened, now);
        final hoursSinceLastOpened = ((now - lastOpenedTimestamp) /
                InAppReviewConstant.millisecondsReview)
            .floor();
        if (hoursSinceLastOpened >= 24 * 5) {
          setState(() {
            requestTracking = true;
          });
        }
      }
    } else {
      setState(() {
        requestTracking = false;
      });
    }
  }

  _checkFistInstall() async {
    _prefs = await SharedPreferences.getInstance();

    final firstTime = _prefs.get(SharedPrefConstant.kFirstTime);
    if (firstTime == null) {
      await _prefs.setBool(SharedPrefConstant.kFirstTime, true);
      setState(() {
        isFirstInstall = true;
      });
    } else {
      await _prefs.setBool(SharedPrefConstant.kFirstTime, false);
      setState(() {
        isFirstInstall = false;
      });
    }
  }

  Future<bool> initial() async {
    await _checkFistInstall();
    await _getPermissionTracking();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Platform.isAndroid
        ? const SizedBox()
        : Builder(builder: (context) {
            if (isFirstInstall) {
              return Scaffold(
                  backgroundColor: Colors.white,
                  body: Container(
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: Center(
                        child: indexPage == 1
                            ? TrackingAgreementPage1(nextPage: () {
                                setState(() {
                                  indexPage = 2;
                                });
                              })
                            : TrackingAgreementPage2(
                                onTap: () async {
                                  await AppTrackingTransparency
                                      .requestTrackingAuthorization();

                                  setState(() {
                                    requestTracking = false;
                                    isFirstInstall = false;
                                  });
                                  widget.setPermission();
                                },
                              ),
                      ),
                    ),
                  ));
            } else {
              if (requestTracking) {
                return Container(
                  color: Colors.black54,
                  height: size.height,
                  width: size.width,
                  child: Dialog(
                    insetPadding: EdgeInsets.symmetric(
                        horizontal: size.width > 600 ? 40.w : 20.w,
                        vertical: 20.h),
                    child: SingleChildScrollView(
                      child: TrackingAgreementDialog(
                        onTap: () async {
                          final now = DateTime.now().millisecondsSinceEpoch;
                          _prefs.setInt(SharedPrefConstant.kLastOpened, now);
                          final status = await AppTrackingTransparency
                              .requestTrackingAuthorization();

                          if (status == TrackingStatus.denied) {
                            await AppSettings.openAppSettings();
                          }
                          setState(() {
                            requestTracking = false;
                          });
                          widget.setPermission();
                        },
                        onIgnore: () {
                          setState(() {
                            requestTracking = false;
                          });
                        },
                      ),
                    ),
                  ),
                );
              }

              return const SizedBox();
            }
          });
  }
}
