import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../../common/widgets/w_media.dart';

class WMenuItem extends StatelessWidget {
  const WMenuItem({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
  });
  final String title;
  final String icon;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgWidget.asset(icon),
              AppSize.spaceBetweenWidgetExtraMedium.horizontalSpace,
              Text(
                title,
                style: AppStyles.text16,
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 16.r,
            color: AppColors.black.withOpacity(.5),
          )
        ],
      ),
    );
  }
}
