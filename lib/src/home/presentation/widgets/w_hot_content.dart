import 'package:borra_app/app_base/config/app_config.dart';
import 'package:borra_app/app_base/config/app_routes.dart';
import 'package:borra_app/common/widgets/app_image.dart';
import 'package:borra_app/src/home/data/models/hot_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WHotContent extends StatelessWidget {
  const WHotContent({
    Key? key,
    required this.hotContent,
  }) : super(key: key);
  final HotContent hotContent;
  @override
  Widget build(BuildContext context) {
    final double widgetHeight = 280.h;
    final double widgetWidth = 235.h;
    return InkWell(
      onTap: () => Navigator.pushNamed(context, AppRoutesMain.contentDetail,
          arguments: hotContent.id),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.extraMediumRadius),
            child: SizedBox(
              height: widgetHeight,
              width: widgetWidth,
              child: AppImage(
                  imageUrl: hotContent.thumbnail ?? AppImages.imgDefaultImage),
            ),
          ),
          Container(
            height: widgetHeight,
            width: widgetWidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.extraMediumRadius),
                gradient: LinearGradient(
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                    colors: [
                      AppColors.hotContentBg.withOpacity(.0),
                      AppColors.hotContentBg.withOpacity(.0),
                      AppColors.hotContentBg.withOpacity(.3),
                      AppColors.hotContentBg.withOpacity(.6),
                      AppColors.black.withOpacity(.8),
                    ])),
          ),
          Visibility(
              visible: hotContent.isNew == 0 && hotContent.isHot == 1,
              child: Positioned(
                  right: 20.w, child: SvgPicture.asset(AppImages.icHotLabel))),
          Visibility(
              visible: hotContent.isNew == 1 && hotContent.isNew == 1,
              child: Positioned(
                  right: 20.w, child: SvgPicture.asset(AppImages.icNewLabel))),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                  top: AppSize.paddingWithScreen,
                  bottom: AppSize.paddingWithScreen,
                  left: 24.w),
              width: 187.w,
              height: 120.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    hotContent.name,
                    style: AppStyles.text18.preSemiBold
                        .copyWith(color: AppColors.white),
                    // maxLines: 2,
                  ),
                  Text(
                    '보라 ONLY',
                    style: AppStyles.text12.copyWith(color: AppColors.white),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
