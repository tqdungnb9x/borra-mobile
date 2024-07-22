import 'package:borra_app/app_base/config/app_config.dart';
import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/common/widgets/w_media.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WLogo extends StatelessWidget {
  const WLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Flexible(
        child: ImageWidget.asset(
          AppImages.imgSplashLogo,
          width: 210.w,
        ),
      ),
      Flexible(
        child: Text(
          LocaleKeys.splash_logo_desc.tr(),
          textAlign: TextAlign.center,
          style: AppStyles.text18.preReg.copyWith(color: AppColors.white),
        ),
      ),
    ]);
  }
}
