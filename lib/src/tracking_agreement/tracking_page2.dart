import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_base/generated/locale_keys.g.dart';

class TrackingAgreementPage2 extends StatelessWidget {
  final Function() onTap;
  const TrackingAgreementPage2({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double sizeHeader = size.width > 600 ? 54 : 34;
    double sizeTitle = size.width > 600 ? 22 : 15;
    double sizeSubTitle = size.width > 600 ? 16 : 12;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width > 600 ? size.width / 4 - 60.w : 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
              ],
            ),
            SizedBox(
              height: 24.h,
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
                  EdgeInsets.symmetric(horizontal: size.width > 600 ? 20.w : 0),
              child: SizedBox(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset(
                      'assets/images/img_tracking02.png',
                      fit: BoxFit.fill,
                    ),
                  )),
            ),
            SizedBox(
              height: 30.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (size.width < 600)
                  Text(
                    LocaleKeys.tracking_more_fun.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: sizeTitle,
                      fontFamily: 'Noto_Sans_KR',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                RichText(
                    text: TextSpan(children: [
                  if (size.width > 600)
                    TextSpan(
                      text: LocaleKeys.tracking_more_fun.tr(),
                      style: TextStyle(
                        fontSize: sizeTitle,
                        color: Colors.black,
                        fontFamily: 'Noto_Sans_KR',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  TextSpan(
                    text: LocaleKeys.tracking_allow_tracking.tr(),
                    style: TextStyle(
                      fontSize: sizeTitle,
                      color: const Color(0xFF6C55A0),
                      fontFamily: 'Noto_Sans_KR',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: LocaleKeys.tracking_please.tr(),
                    style: TextStyle(
                      fontSize: sizeTitle,
                      color: Colors.black,
                      fontFamily: 'Noto_Sans_KR',
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ]))
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                height: 50.h,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF8A86FF),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                margin: EdgeInsets.symmetric(
                    horizontal: size.width > 600 ? 60.w : 10.w),
                child: Text(
                  LocaleKeys.tracking_allow_access.tr(),
                  style: TextStyle(
                    fontSize: sizeTitle,
                    fontFamily: 'Noto_Sans_KR',
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                size.width > 600
                    ? LocaleKeys.tracking_consent_desc_table.tr()
                    : LocaleKeys.tracking_consent_desc_mobile.tr(),
                style: TextStyle(
                  fontSize: sizeSubTitle,
                  fontFamily: 'Noto_Sans_KR',
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
