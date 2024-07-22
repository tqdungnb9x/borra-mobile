import 'package:borra_app/app_base/utils/app_utils.dart';
import 'package:borra_app/src/content_result/data/models/children_data_model.dart';
import 'package:borra_app/src/content_result/data/models/content_children_model.dart';
import 'package:borra_app/src/content_result/data/models/content_purchase_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app_base/config/app_config.dart';

class WSajuContent extends StatelessWidget {
  const WSajuContent({
    super.key,
    required this.signUrl,
    required this.contentTitle,
    required this.children,
    required this.purchase,
  });
  final String signUrl;
  final String contentTitle;
  final ContentPurchase purchase;
  final List<ChildrenData> children;

  @override
  Widget build(BuildContext context) {
    Size signSize = Size(20.r, 20.r);
    return (children.first.summary != null && children.last.summary != null)
        ? Column(
            children: [
              Container(
                width: double.infinity,
                decoration: AppStyles.containerDecoration,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(AppSize.paddingWithScreen),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(137, 134, 255, 0.12),
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(AppSize.mediumRadius)),
                        // borderRadius: BorderRadius.circular(AppSize.mediumRadius),
                      ),
                      child: Row(
                        children: children
                            .map((e) => Expanded(
                                  flex: 1,
                                  child: Text(
                                    e.name ?? '',
                                    style: AppStyles.text14.preReg.copyWith(
                                        color:
                                            AppColors.black.withOpacity(0.8)),
                                    textAlign: TextAlign.center,
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    Divider(
                      height: 0.r,
                      color: AppColors.black.withOpacity(0.3),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(AppSize.paddingWithScreen),
                      child: Row(
                        children: children
                            .map((e) => Expanded(
                                  flex: 1,
                                  child: Container(
                                    // color: Colors.black,
                                    alignment: Alignment.center,
                                    child: _buildSummaryString(e.summary ?? ''),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    AppSize.spaceBetweenWidgetSmall.verticalSpace,
                  ],
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(top: AppSize.paddingWithScreen),
              //   child: Divider(
              //     height: 0.r,
              //     color: AppColors.black.withOpacity(0.3),
              //   ),
              // ),
            ],
          )
        : Container(
            width: double.infinity,
            // padding: EdgeInsets.all(AppSize.paddingWithScreen),
            // decoration: AppStyles.containerDecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                contentTitle != "null"
                    ? Row(
                        children: [
                          SvgPicture.network(
                            signUrl,
                            width: signSize.width,
                            height: signSize.height,
                          ),
                          AppSize.spaceBetweenWidgetSmall.horizontalSpace,
                          Text(
                            contentTitle,
                            style: AppStyles.text17.preBold,
                          ),
                        ],
                      )
                    : const SizedBox(),
                AppSize.spaceBetweenWidgetSmall.verticalSpace,
                children.length > 1
                    ? children.first.summary != null
                        ? const SizedBox()
                        : ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Text(
                                StringUtils.convertContentToDisplay(
                                    children[index].contents ?? "",
                                    person1Name: purchase.name,
                                    partnerName: purchase.partner != null
                                        ? purchase.partner?.name
                                        : ''),
                                style: AppStyles.text15.preReg,
                              );
                            },
                            itemCount: children.length,
                            separatorBuilder: (context, index) =>
                                AppSize.space15.verticalSpace,
                          )
                    : Text(
                        StringUtils.convertContentToDisplay(
                            children.first.contents ?? "",
                            person1Name: purchase.name,
                            partnerName: purchase.partner != null
                                ? purchase.partner?.name
                                : ''),
                        style: AppStyles.text15.preReg,
                      )
              ],
            ),
          );
  }

  _buildSummaryString(String summary) {
    var temp = summary.split(RegExp(r'<\/?\w+\/?>'));
    if (!summary.contains(RegExp(r'<\/?\w+\/?>'))) {
      return Text(
        summary,
        style: AppStyles.text20.preBold,
      );
    }
    return temp.length < 5
        ? Text.rich(
            TextSpan(
              text: temp[0],
              children: [
                TextSpan(
                  text: temp[1],
                  style: AppStyles.text20.preBold.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primary01.withOpacity(0.5),
                    decorationThickness: 5,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                ),
                TextSpan(
                  text: temp[2],
                  style: AppStyles.text20.preBold,
                )
              ],
              style: AppStyles.text20.preBold,
            ),
            textAlign: TextAlign.center,
          )
        : Text.rich(
            TextSpan(
              text: temp[0],
              children: [
                TextSpan(
                  text: temp[1],
                  style: AppStyles.text20.preBold.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primary01.withOpacity(0.5),
                    decorationThickness: 5,
                    decorationStyle: TextDecorationStyle.dashed,
                  ),
                ),
                TextSpan(
                  text: temp[2],
                  style: AppStyles.text20.preBold,
                ),
                TextSpan(
                  text: temp[3],
                  style: AppStyles.text20.preBold.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primary01.withOpacity(0.5),
                    decorationThickness: 5,
                    decorationStyle: TextDecorationStyle.dashed,
                  ),
                ),
                TextSpan(
                  text: temp[4],
                  style: AppStyles.text20.preBold,
                ),
              ],
              style: AppStyles.text20.preBold,
            ),
            textAlign: TextAlign.center,
          );
  }
}
