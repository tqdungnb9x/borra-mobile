import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackingAgreementPage1 extends StatelessWidget {
  final Function() nextPage;
  const TrackingAgreementPage1({
    super.key,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double sizeHeader = size.width > 600 ? 54 : 34;
    double sizeTitle = size.width > 600 ? 24 : 15;
    double sizeSubTitle = size.width > 600 ? 21 : 12;
    double sizeIconBell = size.width > 600 ? 100 : 64;
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width > 600 ? size.width / 4 - 60.w : 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: sizeIconBell,
                      child: Image.asset(
                        'assets/icons/icon_bell.png',
                        fit: BoxFit.fill,
                      )),
                  SizedBox(
                    height: 10.r,
                  ),
                  Text(
                    LocaleKeys.tracking_title.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: sizeHeader,
                      fontFamily: 'Noto_Sans_KR',
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFF6C55A0),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              size.width > 600
                  ? LocaleKeys.tracking_page_2_allow_tablet.tr()
                  : LocaleKeys.tracking_page_2_allow_mobile.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: sizeTitle,
                fontFamily: 'Noto_Sans_KR',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: size.width > 600 ? 30.w : 0),
              child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 1,
                  )
                ]),
                width: double.infinity,
                child: Image.asset(
                  'assets/images/img_tracking.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 47.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      height: 10.h,
                      width: size.width / 3,
                      child: Image.asset(
                        'assets/images/shadow_text.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(
                      LocaleKeys.tracking_dont_miss_out.tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: sizeSubTitle,
                        fontFamily: 'Noto_Sans_KR',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      height: 10.h,
                      width: size.width / 3 * 2,
                      child: Image.asset(
                        'assets/images/shadow_text.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(
                      LocaleKeys.tracking_beginning_today_horoscope.tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: sizeSubTitle,
                        fontFamily: 'Noto_Sans_KR',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            GestureDetector(
              onTap: nextPage,
              child: Container(
                height: 50.h,
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                    horizontal: size.width > 600 ? 60.w : 10.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF8A86FF),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  LocaleKeys.tracking_what_next.tr(),
                  style: TextStyle(
                    fontSize: sizeTitle,
                    fontFamily: 'Noto_Sans_KR',
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
