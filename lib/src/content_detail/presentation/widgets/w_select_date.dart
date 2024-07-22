import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../../common/input_component/app_dropdown_date.dart';

class WSelectDate extends StatefulWidget {
  const WSelectDate({
    super.key,
    this.initialDate,
    this.initialType,
    required this.onCalendarTypeChanged,
    required this.onSelectedYear,
    required this.onSelectedMonth,
    required this.onSelectedDay,
  });
  final String? initialDate;
  final String? initialType;
  final Function(int?) onSelectedYear;
  final Function(int?) onSelectedMonth;
  final Function(int?) onSelectedDay;
  final Function(String?) onCalendarTypeChanged;
  @override
  State<WSelectDate> createState() => _WSelectDateState();
}

class _WSelectDateState extends State<WSelectDate> {
  late DateTime dateTime;
  late String? selectedType;
  @override
  void initState() {
    dateTime = DateTime.tryParse(widget.initialDate ?? '') ??
        DateTime(1990, 1, 1, 0, 0);
    selectedType = widget.initialType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 80.r,
            child: Text(
              LocaleKeys.component_select_date.tr(),
              style: AppStyles.text13.preLight,
            ),
          ),
          // Text('Hello')
          Expanded(
            child: DropdownDatePicker(
              width: 0,
              inputDecoration:
                  const InputDecoration(border: InputBorder.none), // optional
              isDropdownHideUnderline: false, // optional
              isFormValidator: true, // optional
              startYear: 1900, // optional
              endYear: DateTime.now().year, // optional
              dayFlex: 3,
              yearFlex: 4,
              monthFlex: 3,
              selectedDay: dateTime.day, // optional
              selectedMonth: dateTime.month, // optional
              selectedYear: dateTime.year, // optional
              selectedType: widget.initialType,
              hintType: LocaleKeys.component_hint_type.tr(),
              hintTextStyle: AppStyles.text15.preLight
                  .copyWith(color: AppColors.black.withOpacity(0.5)),

              onChangedDay: (day) {
                var newDate =
                    dateTime.copyWith(day: day != null ? int.parse(day) : 1);
                widget.onSelectedDay(newDate.day);
              },
              onChangedMonth: (month) {
                var newDate = dateTime.copyWith(
                    month: month != null ? int.parse(month) : 1);
                widget.onSelectedMonth(newDate.month);
              },
              onChangedYear: (year) {
                var newDate = dateTime.copyWith(
                    year: year != null ? int.parse(year) : 1990);
                widget.onSelectedYear(newDate.year);
              },
              onChangedType: (value) => widget.onCalendarTypeChanged(value),
              textStyle: AppStyles.text15.preMed,
              locale: 'ko',
            ),
          ),
        ],
      ),
    );
  }
}
