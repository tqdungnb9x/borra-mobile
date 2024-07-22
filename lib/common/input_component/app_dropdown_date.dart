// ignore_for_file: non_constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:borra_app/app_base/config/app_config.dart';
import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/common/input_component/app_dropdown_button.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';

/// Defines widgets which are to used as DropDown Date Picker.
// ignore: must_be_immutable
class DropdownDatePicker extends StatefulWidget {
  ///DropDown select text style
  final TextStyle? textStyle;

  ///DropDown container box decoration
  final BoxDecoration? boxDecoration;

  ///InputDecoration for DropDown
  final InputDecoration? inputDecoration;

  ///DropDown expand icon
  final Icon? icon;

  ///Start year for date picker
  ///Default is 1900
  final int? startYear;

  ///End year for date picker
  ///Default is Current year
  final int? endYear;

  ///width between each drop down
  ///Default is 12.0
  final double width;

  ///Return selected date
  ValueChanged<String?>? onChangedDay;

  ///Return selected month
  ValueChanged<String?>? onChangedMonth;

  ///Return selected year
  ValueChanged<String?>? onChangedYear;

  ///Return selected year
  ValueChanged<String?>? onChangedType;

  ///Error message for Date
  String errorDay;

  ///Error message for Month
  String errorMonth;

  ///Error message for Year
  String errorYear;

  ///Hint for Month drop down
  ///Default is "Month"
  String hintMonth;

  ///Hint for Year drop down
  ///Default is "Year"
  String hintYear;

  ///Hint for Day drop down
  ///Default is "Day"
  String hintDay;

  String hintType;

  ///Hint Textstyle for drop down
  TextStyle? hintTextStyle;

  ///Is Form validator enabled
  ///Default is false
  final bool isFormValidator;

  ///Is Expanded for dropdown
  ///Default is true
  final bool isExpanded;

  ///Selected Day between 1 to 31
  final int? selectedDay;

  ///Selected Month between 1 to 12
  final int? selectedMonth;

  ///Selected Year between startYear and endYear
  final int? selectedYear;

  ///Selected Calendar type between startYear and endYear
  final String? selectedType;

  ///Default [isDropdownHideUnderline] = false. Wrap with DropdownHideUnderline for the dropdown to hide the underline.
  final bool isDropdownHideUnderline;

  /// locale
  /// default `en`
  /// support `zh_CN`
  /// support `it_IT`
  /// support fr_FR
  /// support de_DE
  /// suport es_ES
  /// suport ru_RU
  /// suport pt_BR
  final String locale;

  /// default true
  bool showYear;
  bool showMonth;
  bool showDay;

  /// month expanded flex
  int monthFlex;

  /// day expanded flex
  int dayFlex;

  /// year expanded flex
  int yearFlex;

  DropdownDatePicker(
      {Key? key,
      this.textStyle,
      this.boxDecoration,
      this.inputDecoration,
      this.icon,
      this.startYear,
      this.endYear,
      this.width = 12.0,
      this.onChangedDay,
      this.onChangedMonth,
      this.onChangedYear,
      this.onChangedType,
      this.isDropdownHideUnderline = false,
      this.errorDay = 'Please select day',
      this.errorMonth = 'Please select month',
      this.errorYear = 'Please select year',
      this.hintMonth = 'Month',
      this.hintDay = 'Day',
      this.hintYear = 'Year',
      this.hintType = "Calendar",
      this.hintTextStyle,
      this.isFormValidator = false,
      this.isExpanded = true,
      this.selectedDay,
      this.selectedMonth,
      this.selectedYear,
      this.selectedType,
      this.locale = 'en',
      this.showDay = true,
      this.showMonth = true,
      this.showYear = true,
      this.monthFlex = 2,
      this.dayFlex = 1,
      this.yearFlex = 2})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DropdownDatePickerState createState() => _DropdownDatePickerState();
}

class _DropdownDatePickerState extends State<DropdownDatePicker> {
  var monthselVal = '';
  var dayselVal = '';
  var yearselVal = '';
  String? typeselVal;
  int daysIn = 32;
  late List listdates = [];
  late List listyears = [];
  late List<dynamic> listMonths = [];
  late List listType = [];
  @override
  void initState() {
    super.initState();
    listdates = Iterable<int>.generate(daysIn).skip(1).toList();
    listyears =
        Iterable<int>.generate((widget.endYear ?? DateTime.now().year) + 1)
            .skip(widget.startYear ?? 1900)
            .toList()
            .reversed
            .toList();
    listMonths = [
      {"id": 1, "value": "1"},
      {"id": 2, "value": "2"},
      {"id": 3, "value": "3"},
      {"id": 4, "value": "4"},
      {"id": 5, "value": "5"},
      {"id": 6, "value": "6"},
      {"id": 7, "value": "7"},
      {"id": 8, "value": "8"},
      {"id": 9, "value": "9"},
      {"id": 10, "value": "10"},
      {"id": 11, "value": "11"},
      {"id": 12, "value": "12"}
    ];
    listType = [
      // {"id": 'none', "value": "선택"},
      {"id": 'solar', "value": LocaleKeys.component_solar.tr()},
      {"id": 'lunar', "value": LocaleKeys.component_lunar.tr()},
      {"id": 'leap', "value": LocaleKeys.component_leap.tr()},
    ];
    dayselVal = widget.selectedDay != null ? widget.selectedDay.toString() : '';
    monthselVal =
        widget.selectedMonth != null ? widget.selectedMonth.toString() : '';
    yearselVal =
        widget.selectedYear != null ? widget.selectedYear.toString() : '';
    typeselVal = widget.selectedType;
  }

  ///Month selection dropdown function
  monthSelected(value) {
    widget.onChangedMonth!(value);
    monthselVal = value;
    int days = daysInMonth(
        yearselVal == '' ? DateTime.now().year : int.parse(yearselVal),
        int.parse(value));
    listdates = Iterable<int>.generate(days + 1).skip(1).toList();
    checkDates(days);
    update();
  }

  void checkDates(days) {
    // Check if the selected date is not null
    if (dayselVal != '') {
      // Check if the selected date is greater than the number of days
      if (int.parse(dayselVal) > days) {
        // If the selected date is greater than the number of days, clear the selected date
        dayselVal = '';
        widget.onChangedDay!('');
        update();
      }
    }
  }

  // Return the number of days in the given month.
  //
  // This function assumes that the month is in the range [1, 12].
  // If the month is out of range, this function throws a RangeError.
  int daysInMonth(year, month) => DateTimeRange(
          start: DateTime(year, month, 1), end: DateTime(year, month + 1))
      .duration
      .inDays;

  // daysSelected is a function that is called when a user selects a day from the dropdown menu
  // The function takes a value as a parameter and calls the onChangedDay function in the parent widget
  // The onChangedDay function updates the day value in the parent widget and causes the widget to rebuild
  // value is the day that the user selected from the dropdown menu
  daysSelected(value) {
    widget.onChangedDay!(value);
    dayselVal = value;
    update();
  }

  yearsSelected(value) {
    widget.onChangedYear!(value);
    yearselVal = value;
    if (monthselVal != '') {
      int days = daysInMonth(
          yearselVal == '' ? DateTime.now().year : int.parse(yearselVal),
          int.parse(monthselVal));
      listdates = Iterable<int>.generate(days + 1).skip(1).toList();
      checkDates(days);
      update();
    }
    update();
  }

  typeSelected(value) {
    widget.onChangedType!(value);
    typeselVal = value;
    update();
  }

  ///update function
  update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // dayselVal = widget.selectedDay != null ? widget.selectedDay.toString() : '';
    // monthselVal =
    //     widget.selectedMonth != null ? widget.selectedMonth.toString() : '';
    // yearselVal =
    //     widget.selectedYear != null ? widget.selectedYear.toString() : '';
    // typeselVal = widget.selectedType;
    return Row(
      children: [
        if (widget.showDay) w(widget.width),
        if (widget.showYear)
          Expanded(
            flex: widget.yearFlex,
            child: Container(
              alignment: Alignment.centerLeft,
              decoration: widget.boxDecoration ?? const BoxDecoration(),
              child: widget.isDropdownHideUnderline
                  ? DropdownButtonHideUnderline(
                      child: yearDropdown(),
                    )
                  : yearDropdown(),
            ),
          ),
        if (widget.showMonth)
          Expanded(
            flex: widget.monthFlex,
            child: Container(
              decoration: widget.boxDecoration ?? const BoxDecoration(),
              child: widget.isDropdownHideUnderline
                  ? DropdownButtonHideUnderline(
                      child: monthDropdown(),
                    )
                  : monthDropdown(),
            ),
          ),
        if (widget.showMonth) w(widget.width),
        if (widget.showDay)
          Expanded(
            flex: widget.dayFlex,
            child: Container(
              decoration: widget.boxDecoration ?? const BoxDecoration(),
              child: widget.isDropdownHideUnderline
                  ? DropdownButtonHideUnderline(
                      child: dayDropdown(),
                    )
                  : dayDropdown(),
            ),
          ),
        Expanded(
          flex: widget.dayFlex,
          child: Container(
            decoration: widget.boxDecoration ?? const BoxDecoration(),
            child: widget.isDropdownHideUnderline
                ? DropdownButtonHideUnderline(
                    child: typeDropdown(),
                  )
                : typeDropdown(),
          ),
        ),
        const Spacer()
      ],
    );
  }

  ///month dropdown
  DropdownButtonFormField<String> monthDropdown() {
    return DropdownButtonFormField<String>(
        borderRadius: BorderRadius.circular(AppSize.extraMediumRadius),
        selectedItemBuilder: (context) {
          return listMonths
              .map(
                (e) => Container(
                  color: Colors.transparent,
                  child: AutoSizeText(
                    widget.locale == 'ko' ? '${e['value']}월' : '${e['value']}',
                    style: AppStyles.text15.preMed,
                  ),
                ),
              )
              .toList();
        },
        decoration: const InputDecoration(
          border: InputBorder.none,
          isCollapsed: true,
        ),
        isExpanded: widget.isExpanded,
        hint: Text(widget.hintMonth, style: widget.hintTextStyle),
        icon: widget.icon,
        value: monthselVal == '' ? null : monthselVal,
        onChanged: (value) {
          monthSelected(value);
        },
        validator: (value) {
          return widget.isFormValidator
              ? value == null
                  ? widget.errorMonth
                  : null
              : null;
        },
        items: listMonths.map((item) {
          return DropdownMenuItem<String>(
            value: item["id"].toString(),
            child: CustomDropdownItem(
                item:
                    widget.locale == 'ko' ? '${item["value"]}월' : item["value"],
                isSelected: monthselVal == item["value"]),
          );
        }).toList());
  }

  ///Remove underline from dropdown
  InputDecoration removeUnderline() {
    return const InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)));
  }

  ///year dropdown
  DropdownButtonFormField<String> yearDropdown() {
    return DropdownButtonFormField<String>(
        borderRadius: BorderRadius.circular(AppSize.extraMediumRadius),
        selectedItemBuilder: (context) {
          return listyears
              .map(
                (e) => Container(
                  color: Colors.transparent,
                  child: AutoSizeText(
                    widget.locale == 'ko' ? '$e년' : '$e',
                    style: AppStyles.text15.preMed,
                  ),
                ),
              )
              .toList();
        },
        decoration: const InputDecoration(
          border: InputBorder.none,
          isCollapsed: true,
        ),
        hint: Text(widget.hintYear, style: widget.hintTextStyle),
        isExpanded: widget.isExpanded,
        icon: widget.icon,
        value: yearselVal == '' ? null : yearselVal,
        onChanged: (value) {
          yearsSelected(value);
        },
        validator: (value) {
          return widget.isFormValidator
              ? value == null
                  ? widget.errorYear
                  : null
              : null;
        },
        items: listyears.map((item) {
          return DropdownMenuItem<String>(
            value: item.toString(),
            child: CustomDropdownItem(
              item: widget.locale == 'ko' ? '$item년' : item,
              isSelected: yearselVal == item.toString(),
            ),
          );
        }).toList());
  }

  ///day dropdown
  DropdownButtonFormField<String> dayDropdown() {
    return DropdownButtonFormField<String>(
        borderRadius: BorderRadius.circular(AppSize.extraMediumRadius),
        selectedItemBuilder: (context) {
          return listdates
              .map(
                (e) => Container(
                  color: Colors.transparent,
                  child: AutoSizeText(
                    widget.locale == 'ko' ? '$e일' : '$e',
                    style: AppStyles.text15.preMed,
                  ),
                ),
              )
              .toList();
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintDay,
          hintStyle: widget.hintTextStyle,
          isCollapsed: true,
        ),
        isExpanded: widget.isExpanded,
        icon: widget.icon,
        value: dayselVal == '' ? null : dayselVal,
        onChanged: (value) {
          daysSelected(value);
        },
        validator: (value) {
          return widget.isFormValidator
              ? value == null
                  ? widget.errorDay
                  : null
              : null;
        },
        items: listdates.map((item) {
          return DropdownMenuItem<String>(
            value: item.toString(),
            child: CustomDropdownItem(
              item: widget.locale == 'ko' ? '$item일' : item.toString(),
              isSelected: dayselVal == item.toString(),
            ),
          );
        }).toList());
  }

  DropdownButtonFormField<String> typeDropdown() {
    return DropdownButtonFormField<String>(
        borderRadius: BorderRadius.circular(AppSize.extraMediumRadius),
        selectedItemBuilder: (context) {
          return listType
              .map(
                (e) => Container(
                  color: Colors.transparent,
                  child: AutoSizeText(
                    '${e['value']}',
                    style: AppStyles.text15.preMed,
                  ),
                ),
              )
              .toList();
        },
        decoration: widget.inputDecoration ??
            (widget.isDropdownHideUnderline ? removeUnderline() : null),
        isExpanded: widget.isExpanded,
        hint: Text(widget.hintType, style: widget.hintTextStyle),
        icon: widget.icon,
        value: typeselVal == '' ? null : typeselVal,
        onChanged: (value) {
          typeSelected(value);
        },
        validator: (value) {
          return widget.isFormValidator
              ? value == null
                  ? widget.errorMonth
                  : null
              : null;
        },
        items: listType.map((item) {
          return DropdownMenuItem<String>(
            value: item["id"],
            child: CustomDropdownItem(
              item: widget.locale == 'ko' ? '${item["value"]}' : item["value"],
              isSelected: typeselVal == item['id'],
            ),
          );
        }).toList());
  }

  /* This code creates a blank space that is count pixels wide. */
  Widget w(double count) => SizedBox(width: count);
}
