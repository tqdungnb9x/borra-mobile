import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app_base/config/app_config.dart';

// ignore: must_be_immutable
class WConditionCheck extends StatefulWidget {
  WConditionCheck({
    super.key,
    required this.title,
    required this.onValueChanged,
    required this.onDetailClicked,
    this.detail,
    required this.initialValue,
  });
  final String title;
  final String? detail;
  final ValueChanged<bool> onValueChanged;
  final Function() onDetailClicked;
  bool initialValue;
  @override
  State<WConditionCheck> createState() => _WConditionCheckState();
}

class _WConditionCheckState extends State<WConditionCheck> {
  late bool isChecked;
  @override
  void initState() {
    isChecked = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
                onTap: () {
                  setState(() {
                    widget.initialValue = !widget.initialValue;
                  });
                  widget.onValueChanged(widget.initialValue);
                },
                child: widget.initialValue
                    ? SvgPicture.asset(AppImages.icChecked)
                    : SvgPicture.asset(AppImages.icUncheck)),
            AppSize.spaceBetweenWidgetMedium.horizontalSpace,
            Text(
              widget.title, // '[선택] 마케팅 활용 및 광고성 정보 수신 동의',
              style: AppStyles.text14.preReg
                  .copyWith(color: AppColors.neutral03.withOpacity(0.8)),
            )
          ],
        ),
        InkWell(
          onTap: () {
            widget.onDetailClicked.call();
          },
          child: Text(widget.detail ?? LocaleKeys.button_details.tr(),
              style: AppStyles.text14.preReg.copyWith(
                  color: AppColors.neutral03.withOpacity(0.8),
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid)),
        )
      ],
    );
  }
}
