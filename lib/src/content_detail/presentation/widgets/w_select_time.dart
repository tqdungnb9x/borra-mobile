import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/common/input_component/app_dropdown_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_base/config/app_config.dart';

class WSelectTime extends StatefulWidget {
  WSelectTime({
    super.key,
    this.initialTime,
    required this.onSelectedTime,
    required this.isBirthedTime,
  });
  final DateTime? initialTime;
  final bool? isBirthedTime;
  final Function(int?, int?, bool) onSelectedTime;
  @override
  State<WSelectTime> createState() => _WSelectTimeState();
}

class _WSelectTimeState extends State<WSelectTime> {
  late int? startHour;
  late int? startMinute;
  int hourCount = 24;
  int minuteCount = 60;
  late List<int> hours;
  late List<int> minutes;
  late bool gotBirthTime;
  late DateTime dateTime;
  @override
  void initState() {
    super.initState();
    hours = List<int>.generate(hourCount, (index) => index);
    minutes = List<int>.generate(minuteCount, (index) => index);
    gotBirthTime = widget.isBirthedTime ?? true;
    dateTime = widget.initialTime ?? DateTime(1990, 1, 1);
    startHour = gotBirthTime ? dateTime.hour : null;
    startMinute = gotBirthTime ? dateTime.minute : null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 80.r,
            child: Text(
              LocaleKeys.component_select_time.tr(),
              style: AppStyles.text13.preLight,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: buildHour(),
                  ),
                ),
                AppSize.spaceBetweenWidgetExtraMedium.horizontalSpace,
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: buildMinute(),
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              setState(() {
                gotBirthTime = !gotBirthTime;
                startHour = gotBirthTime ? 0 : null;
                startMinute = gotBirthTime ? 0 : null;
                widget.onSelectedTime(startHour, startMinute, gotBirthTime);
              });
            },
            child: Container(
              padding: EdgeInsets.all(7.r),
              decoration: ShapeDecoration(
                color: gotBirthTime == false
                    ? AppColors.tarotWidgetBg
                    : AppColors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 0.5,
                        color: !gotBirthTime
                            ? Colors.transparent
                            : AppColors.black.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(6)),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.check,
                    color: gotBirthTime == false
                        ? AppColors.primary01
                        : AppColors.black.withOpacity(0.3),
                  ),
                  Text(
                    LocaleKeys.component_dont_know.tr(),
                    style: AppStyles.text13.preMed.copyWith(
                        color: gotBirthTime == false
                            ? AppColors.primary01
                            : AppColors.black),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  DropdownButton<int> buildHour() {
    return DropdownButton<int>(
      borderRadius: BorderRadius.circular(AppSize.extraMediumRadius),
      selectedItemBuilder: (context) {
        return hours
            .map(
              (e) => Container(
                alignment: Alignment.center,
                color: Colors.transparent,
                child: Text(
                  '$e${LocaleKeys.component_hour.tr()}',
                  style: AppStyles.text15.preMed,
                ),
              ),
            )
            .toList();
      },
      hint: Text(
        LocaleKeys.component_hour.tr(),
        style: AppStyles.text14.preLight
            .copyWith(color: AppColors.black.withOpacity(0.5)),
      ),
      value: startHour,
      onChanged: !gotBirthTime
          ? null
          : (value) {
              setState(() {
                startHour = value;
                widget.onSelectedTime(startHour, startMinute, gotBirthTime);
              });
            },
      items: hours.map((item) {
        return DropdownMenuItem<int>(
          value: item,
          alignment: Alignment.centerRight,
          child: CustomDropdownItem(
            item: item,
            isSelected: startHour == item,
            symbol: LocaleKeys.component_hour.tr(),
          ),
        );
      }).toList(),
    );
  }

  DropdownButton<int> buildMinute() {
    return DropdownButton<int>(
      borderRadius: BorderRadius.circular(AppSize.extraMediumRadius),
      selectedItemBuilder: (context) {
        return minutes
            .map(
              (e) => Container(
                alignment: Alignment.center,
                color: Colors.transparent,
                child: Text(
                  '$e${LocaleKeys.component_min.tr()}',
                  style: AppStyles.text15.preMed,
                ),
              ),
            )
            .toList();
      },
      hint: Text(
        LocaleKeys.component_min.tr(),
        style: AppStyles.text15.preLight
            .copyWith(color: AppColors.black.withOpacity(0.5)),
      ),
      value: startMinute,
      onChanged: !gotBirthTime
          ? null
          : (value) {
              setState(() {
                startMinute = value;
                widget.onSelectedTime(startHour, startMinute, gotBirthTime);
              });
            },
      items: minutes.map((item) {
        return DropdownMenuItem<int>(
          value: item,
          child: CustomDropdownItem(
            item: item,
            isSelected: startMinute == item,
            symbol: LocaleKeys.component_min.tr(),
          ),
        );
      }).toList(),
    );
  }
}
