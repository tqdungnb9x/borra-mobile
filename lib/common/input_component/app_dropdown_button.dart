import 'package:borra_app/app_base/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInputDropdownButton<T> extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? suffixText;
  final TextInputType? type;
  final bool obscureText;
  final T value;
  final List<T> items;
  final Widget Function(T) child;
  final Function(T? value)? onChanged;
  final TextStyle? selectedItemStyle;
  const AppInputDropdownButton({
    super.key,
    this.label,
    this.hint,
    required this.value,
    this.onChanged,
    this.type,
    this.obscureText = false,
    this.suffixText,
    required this.child,
    required this.items,
    this.selectedItemStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Container(
            margin: EdgeInsets.only(
              bottom: 10.h,
            ),
            child: Text(label!, style: AppStyles.text16.preReg),
          ),
        SizedBox(
          child: DropdownButtonFormField<T>(
            //value: value,
            items: items
                .map<DropdownMenuItem<T>>(
                  (value) =>
                      DropdownMenuItem<T>(value: value, child: child(value)),
                )
                .toList(),
            onChanged: onChanged,
            isExpanded: true,
            icon: Icon(
              Icons.expand_more,
              size: AppSize.iconMedium,
            ),
            iconSize: AppSize.iconMedium,
            style: AppStyles.text14,
            decoration: InputDecoration(
              filled: true,
              hintText: hint,
              labelStyle: AppStyles.text14.preReg,
              hintStyle: AppStyles.text14.preReg.copyWith(
                color: AppColors.neutral01.withOpacity(0.5),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors.neutral01, width: AppSize.borderWidth),
                borderRadius: BorderRadius.circular(AppSize.mediumRadius),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors.neutral01, width: AppSize.borderWidth),
                borderRadius: BorderRadius.circular(AppSize.mediumRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors.neutral01, width: AppSize.borderWidth),
                borderRadius: BorderRadius.circular(AppSize.mediumRadius),
              ),
              fillColor: AppColors.white,
              contentPadding: EdgeInsets.symmetric(vertical: 8.h),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomDropdownItem extends StatelessWidget {
  const CustomDropdownItem(
      {super.key, this.item, required this.isSelected, this.symbol});
  final dynamic item;
  final bool isSelected;
  final String? symbol;
  @override
  Widget build(BuildContext context) {
    final double iconSize = 20.r;
    return DropdownMenuItem<dynamic>(
      value: item,
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          isSelected
              ? Icon(
                  Icons.check,
                  size: iconSize,
                )
              : SizedBox(
                  width: iconSize,
                ),
          AppSize.spaceBetweenWidgetSmall.horizontalSpace,
          Text(
            symbol == null ? '$item' : '$item$symbol',
            style: AppStyles.text15.preMed,
          ),
        ],
      ),
    );
  }
}
