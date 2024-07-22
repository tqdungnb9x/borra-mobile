import 'package:borra_app/src/content_result/data/models/children_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../../app_base/utils/app_utils.dart';
import '../../data/models/content_purchase_info_model.dart';

class WContentInfo extends StatelessWidget {
  const WContentInfo({
    super.key,
    required this.signUrl,
    required this.contentTitle,
    required this.children,
  });
  final String signUrl;
  final String contentTitle;
  final List<ChildrenData> children;

  @override
  Widget build(BuildContext context) {
    Size signSize = Size(20.r, 20.r);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSize.paddingWithScreen),
      decoration: AppStyles.containerDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
          ),
          AppSize.spaceBetweenWidgetSmall.verticalSpace,
          children.length > 1
              ? ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Text(
                      children[index].contents ?? "",
                      style: AppStyles.text15.preReg,
                    );
                  },
                  itemCount: children.length,
                  separatorBuilder: (context, index) =>
                      AppSize.space15.verticalSpace,
                )
              : Text(
                  children.first.contents ?? "",
                  style: AppStyles.text15.preReg,
                )
        ],
      ),
    );
  }
}

class WContentTarotInfo extends StatelessWidget {
  const WContentTarotInfo({
    super.key,
    required this.signUrl,
    required this.contentTitle,
    required this.children,
    required this.purchase,
  });
  final String signUrl;
  final String contentTitle;
  final List<ChildrenData> children;
  final ContentPurchase purchase;
  @override
  Widget build(BuildContext context) {
    Size signSize = Size(20.r, 20.r);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSize.paddingWithScreen),
      // decoration: AppStyles.containerDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
          ),
          AppSize.spaceBetweenWidgetSmall.verticalSpace,
          children.length > 1
              ? ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Text(
                      StringUtils.convertContentToDisplay(
                          children[index].contents ?? "",
                          person1Name: purchase.name),
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
                      person1Name: purchase.name),
                  style: AppStyles.text15.preReg,
                )
        ],
      ),
    );
  }
}
