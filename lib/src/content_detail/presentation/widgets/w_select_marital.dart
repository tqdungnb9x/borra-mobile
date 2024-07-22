import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/common/input_component/app_dropdown_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_base/config/app_config.dart';

class WMaritalSelect extends StatefulWidget {
  const WMaritalSelect({
    super.key,
    this.initialMarital,
    required this.onMaritalSelected,
  });
  final String? initialMarital;
  final ValueChanged<String?> onMaritalSelected;
  @override
  State<WMaritalSelect> createState() => _WMaritalSelectState();
}

class _WMaritalSelectState extends State<WMaritalSelect> {
  late List<dynamic> menuItems = [];
  String? typeselVal;
  @override
  void initState() {
    menuItems = [
      {"id": 'single', "value": LocaleKeys.component_single.tr()},
      {"id": 'couple', "value": LocaleKeys.component_couple.tr()},
      {"id": 'married', "value": LocaleKeys.component_married.tr()},
    ];
    typeselVal = widget.initialMarital;
    super.initState();
  }

  typeSelected(value) {
    widget.onMaritalSelected(value);
    typeselVal = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.r),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          SizedBox(
            width: 80.r,
            child: Text(
              LocaleKeys.component_marital.tr(),
              style: AppStyles.text13.preLight,
            ),
          ),
          SizedBox(
            width: 100.r,
            child: DropdownButtonFormField(
              borderRadius: BorderRadius.circular(AppSize.extraMediumRadius),
              selectedItemBuilder: (context) {
                return menuItems
                    .map(
                      (e) => Container(
                        color: Colors.transparent,
                        child: Text(
                          '${e['value']}',
                          style: AppStyles.text15.preMed,
                        ),
                      ),
                    )
                    .toList();
              },
              hint: Text(
                LocaleKeys.component_hint_type.tr(),
                style: AppStyles.text13.preLight
                    .copyWith(color: AppColors.black.withOpacity(0.5)),
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                isCollapsed: true,
              ),
              value: typeselVal == '' ? null : typeselVal,
              items: menuItems.map((item) {
                return DropdownMenuItem<String>(
                  value: item["id"],
                  child: CustomDropdownItem(
                    item: item["value"],
                    isSelected: typeselVal == item['id'],
                  ),
                );
              }).toList(),
              onChanged: (value) {
                typeSelected(value);
              },
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
