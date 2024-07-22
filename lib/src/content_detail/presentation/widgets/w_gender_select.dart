import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app_base/config/app_config.dart';

class WGenderSelect extends StatefulWidget {
  WGenderSelect({
    super.key,
    this.initialValue,
    required this.onSelected,
  });
  final int? initialValue;
  final ValueChanged<int> onSelected;

  @override
  State<WGenderSelect> createState() => _WGenderSelectState();
}

class _WGenderSelectState extends State<WGenderSelect> {
  List<String> listGender = [
    LocaleKeys.component_gender_male.tr(),
    LocaleKeys.component_gender_female.tr()
  ];
  int? selectedIndex;
  @override
  void initState() {
    selectedIndex = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.r),
      width: MediaQuery.of(context).size.width,
      height: 45.r,
      child: Row(
        children: [
          SizedBox(
            width: 80.r,
            child: Text(
              LocaleKeys.component_gender.tr(),
              style: AppStyles.text13.preLight,
            ),
          ),
          Expanded(
            flex: 8,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    widget.onSelected(index);
                  },
                  child: Row(
                    children: [
                      selectedIndex == index
                          ? SvgPicture.asset(
                              AppImages.icRadioChecked,
                              width: 16.r,
                              height: 16.r,
                            )
                          : SvgPicture.asset(
                              AppImages.icRadioNone,
                              width: 16.r,
                              height: 16.r,
                            ),
                      AppSize.spaceBetweenWidgetSmall.horizontalSpace,
                      Text(
                        listGender[index],
                        style: AppStyles.text15.preMed,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (_, __) =>
                  AppSize.spaceBetweenWidgetExtraMedium.horizontalSpace,
              itemCount: listGender.length,
            ),
          ),
        ],
      ),
    );
  }
}
