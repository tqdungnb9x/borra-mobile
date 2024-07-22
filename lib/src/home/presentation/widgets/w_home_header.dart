import 'package:borra_app/app_base/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/w_media.dart';

class WHomeHeader extends StatefulWidget {
  const WHomeHeader({super.key});

  @override
  State<WHomeHeader> createState() => _WHomeHeaderState();
}

class _WHomeHeaderState extends State<WHomeHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding:
          EdgeInsets.symmetric(horizontal: AppSize.spaceBetweenWidgetMedium),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgWidget.asset(AppImages.icMenu),
          Image.asset(
            AppImages.imgLogoMain,
            height: 51.h,
            width: 81.w,
            fit: BoxFit.cover,
          ),
          SvgWidget.asset(AppImages.icSearch),
        ],
      ),
    );
  }
}
