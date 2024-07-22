// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:borra_app/app_base/config/app_config.dart';
import 'package:borra_app/common/widgets/app_header.dart';
import 'package:borra_app/src/content_result/data/models/saju_detail_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SajuGanJiArgument {
  final String name;
  final SajuDetail sajuDetail;
  SajuGanJiArgument({
    required this.name,
    required this.sajuDetail,
  });
}

class ShachouKanjiScreen extends StatefulWidget {
  const ShachouKanjiScreen({super.key, required this.sajuArgs});
  final SajuGanJiArgument sajuArgs;
  @override
  State<ShachouKanjiScreen> createState() => _ShachouKanjiScreenState();
}

class _ShachouKanjiScreenState extends State<ShachouKanjiScreen> {
  late Daeun daeun;
  List<String> titleRow = [
    "",
    LocaleKeys.content_result_table_column_hour.tr(),
    LocaleKeys.content_result_table_column_date.tr(),
    LocaleKeys.content_result_table_column_month.tr(),
    LocaleKeys.content_result_table_column_year.tr()
  ];
  List<List<String>> cheongan = [
    [LocaleKeys.content_result_table_row_gan.tr(), "", ""]
  ];
  List<List<String>> jiji = [
    [LocaleKeys.content_result_table_row_ji.tr(), "", ""]
  ];
  @override
  void initState() {
    daeun = widget.sajuArgs.sajuDetail.daeun;
    cheongan.addAll(widget.sajuArgs.sajuDetail.cheongan);
    jiji.addAll(widget.sajuArgs.sajuDetail.jiji);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppHeader(
        context,
        titleText:
            "${widget.sajuArgs.name}${LocaleKeys.content_result_saju_detail_title.tr()}",
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            vertical: AppSize.paddingWithScreen,
            horizontal: AppSize.paddingWithScreen),
        child: Column(
          children: [
            Table(
              border: TableBorder.all(color: AppColors.tableBorder),
              children: [
                TableRow(
                  children: titleRow
                      .map((e) => Container(
                          color: AppColors.tableHeaderGreen,
                          padding:
                              EdgeInsets.all(AppSize.spaceBetweenWidgetMedium),
                          child: Text(
                            e,
                            textAlign: TextAlign.center,
                            style: AppStyles.text16.preBold
                                .copyWith(color: AppColors.blueText),
                          )))
                      .toList(),
                ),
                TableRow(
                  children: cheongan
                      .mapIndexed((i, e) => tableCell(list: e))
                      .toList(),
                ),
                TableRow(
                  children:
                      jiji.mapIndexed((i, e) => tableCell(list: e)).toList(),
                ),
              ],
            ),
            AppSize.spaceBetweenWidgetMedium.verticalSpace,
            Text(
              LocaleKeys.content_result_daeun_desc.tr(),
              style: AppStyles.text15.preMed,
            ),
            AppSize.space50.verticalSpace,
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  vertical: AppSize.spaceBetweenWidgetMedium),
              decoration: const BoxDecoration(
                  color: AppColors.tableHeaderBlue,
                  border: Border(
                      top: BorderSide(color: AppColors.tableHeaderBorder),
                      left: BorderSide(color: AppColors.tableHeaderBorder),
                      right: BorderSide(color: AppColors.tableHeaderBorder),
                      bottom: BorderSide(width: 0))),
              child: Text(
                // "대운 - 순운 제6운",
                daeun.name,
                style: AppStyles.text16,
                textAlign: TextAlign.center,
              ),
            ),
            Table(
              border: TableBorder.all(color: AppColors.tableBorder),
              children: [
                TableRow(
                    children: daeun.gan
                        .map((e) => Container(
                              padding: EdgeInsets.all(
                                  AppSize.spaceBetweenWidgetMedium),
                              child: Text(
                                e,
                                textAlign: TextAlign.center,
                                style: AppStyles.text24.preBold
                                    .copyWith(color: AppColors.blueText),
                              ),
                            ))
                        .toList()),
                TableRow(
                    children: daeun.ji
                        .map((e) => Container(
                              padding: EdgeInsets.all(
                                  AppSize.spaceBetweenWidgetMedium),
                              child: Text(
                                e,
                                textAlign: TextAlign.center,
                                style: AppStyles.text24.preBold
                                    .copyWith(color: AppColors.blueText),
                              ),
                            ))
                        .toList()),
                TableRow(
                    children: daeun.age
                        .map((e) => Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: AppSize.space15),
                              child: Text(e,
                                  textAlign: TextAlign.center,
                                  style: AppStyles.text14.preBold),
                            ))
                        .toList()),
              ],
            ),
            AppSize.space15.verticalSpace,
            Text(
              LocaleKeys.content_result_description_1.tr(),
              style: AppStyles.text15.preMed,
            ),
            AppSize.space24.verticalSpace,
            Text(
              LocaleKeys.content_result_description_2.tr(),
              style: AppStyles.text15.preMed,
            ),
          ],
        ),
      ),
    );
  }

  Widget tableCell({required List<String> list}) {
    bool isEmpty = checkIsTitle(list: list);
    return isEmpty
        ? Container(
            padding: EdgeInsets.symmetric(vertical: AppSize.spaceUltraLarge),
            child: Text(
              list.first,
              textAlign: TextAlign.center,
              style:
                  AppStyles.text16.preBold.copyWith(color: AppColors.brownText),
            ),
          )
        : Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Transform.translate(
                  offset: const Offset(0, -10),
                  child: Text(
                    list[1],
                    textAlign: TextAlign.center,
                    style: AppStyles.text12.preBold
                        .copyWith(color: AppColors.brownText),
                  ),
                ),
                Text(
                  list.first,
                  textAlign: TextAlign.center,
                  style: AppStyles.text28.preBold
                      .copyWith(color: AppColors.blueText),
                ),
                Transform.translate(
                  offset: const Offset(0, -10),
                  child: Text(
                    list.last,
                    textAlign: TextAlign.center,
                    style: AppStyles.text12.preBold
                        .copyWith(color: AppColors.brownText),
                  ),
                ),
              ],
            ),
          );
  }

  bool checkIsTitle({required List<String> list}) {
    bool isEmpty = false;
    for (var element in list) {
      if (element == "") isEmpty = true;
    }
    return isEmpty;
  }
}
