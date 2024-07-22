import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_base/config/app_config.dart';

class TrackingAgreementDialog extends StatelessWidget {
  final Function() onTap;
  final Function() onIgnore;
  const TrackingAgreementDialog(
      {super.key, required this.onTap, required this.onIgnore});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: size.width > 600 ? 20.h : 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 26.h,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 5.h, top: 5.h),
                  child: InkWell(
                    onTap: onIgnore,
                    child: const Icon(
                      Icons.close,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
              Text(
                LocaleKeys.tracking_title.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 21.sp,
                  fontFamily: 'Noto_Sans_KR',
                  fontWeight: FontWeight.w900,
                  color: const Color(0xFF6C55A0),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                LocaleKeys.tracking_header.tr(),
                style: TextStyle(
                  fontSize: 10.sp,
                  fontFamily: 'Noto_Sans_KR',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                color: const Color(0xFFF3F1F7),
                padding: EdgeInsets.only(top: 10.h),
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: size.width > 600 ? 200.h : 180.h,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 50.w),
                      child: Image.asset(
                        'assets/images/img_tracking.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.tracking_dont_miss_out.tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontFamily: 'Noto_Sans_KR',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          LocaleKeys.tracking_beginning_today_horoscope.tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontFamily: 'Noto_Sans_KR',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    Container(
                        height: size.width > 600 ? 200.h : 180.h,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 40.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: Image.asset(
                            'assets/images/img_tracking02.png',
                            fit: BoxFit.fill,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Column(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.tracking_more_fun.tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontFamily: 'Noto_Sans_KR',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: LocaleKeys.tracking_allow_tracking.tr(),
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: const Color(0xFF6C55A0),
                            fontFamily: 'Noto_Sans_KR',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: LocaleKeys.tracking_please.tr(),
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.black,
                            fontFamily: 'Noto_Sans_KR',
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ]))
                    ],
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      height: 50.h,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                          horizontal: size.width > 600 ? 20.w : 20.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFF8A86FF),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        LocaleKeys.tracking_allow_access.tr(),
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: 'Noto_Sans_KR',
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      size.width > 600
                          ? LocaleKeys.tracking_consent_desc_table.tr()
                          : LocaleKeys.tracking_consent_desc_mobile.tr(),
                      style: TextStyle(
                        fontSize: size.width > 600 ? 7.5.sp : 8.sp,
                        fontFamily: 'Noto_Sans_KR',
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
