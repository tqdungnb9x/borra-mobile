import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../app_base/config/app_config.dart';

class WSectionHeader extends StatelessWidget {
  const WSectionHeader({
    super.key,
    required this.headerTitle,
    this.onFunctionTitleClick,
    this.functionTitle,
  });
  final String headerTitle;
  final String? functionTitle;
  final Function()? onFunctionTitleClick;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          headerTitle, //"눈 깜짝할 사이에, 기다리면 무료!",
          style: AppStyles.text20.preBold,
        ),
        Visibility(
          visible: onFunctionTitleClick != null,
          child: InkWell(
            onTap: onFunctionTitleClick,
            child: Text(
              functionTitle ?? LocaleKeys.home_common_view_all.tr(),
              style:
                  AppStyles.text16.preReg.copyWith(color: AppColors.primary01),
            ),
          ),
        )
      ],
    );
  }
}
