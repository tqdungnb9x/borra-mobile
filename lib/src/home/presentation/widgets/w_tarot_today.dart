// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:borra_app/app_base/config/app_config.dart';
import 'package:borra_app/app_base/utils/app_utils.dart';
import 'package:borra_app/common/widgets/app_image.dart';
import 'package:borra_app/src/my_account/data/models/user_content.dart';

import '../../../../app_base/config/app_routes.dart';
import '../../data/models/app_main_content.dart';

class WTarotToday extends StatelessWidget {
  const WTarotToday({super.key, required this.tarotToday});
  final AppMainContent tarotToday;
  @override
  Widget build(BuildContext context) {
    final double widgetWidth = 125.w;
    return SizedBox(
      width: widgetWidth,
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () => Navigator.pushNamed(context, AppRoutesMain.contentDetail,
            arguments: tarotToday.id),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.extraMediumRadius),
              child: AppImage(
                imageUrl: tarotToday.thumbnail ?? AppImages.imgDefaultImage,
                width: widgetWidth,
                height: widgetWidth,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10.r),
                  alignment: Alignment.topLeft,
                  child: Text(
                    tarotToday.name,
                    style: AppStyles.text15.preMed,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(AppImages.icView),
                    AppSize.spaceSmall.horizontalSpace,
                    Text(
                      StringUtils.formatNumber(tarotToday.viewCount.toDouble()),
                      style: AppStyles.text14.preReg
                          .copyWith(color: AppColors.black.withOpacity(0.5)),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class WTarotFree extends StatelessWidget {
  const WTarotFree({super.key, required this.tarotToday});
  final AppMainContent tarotToday;
  @override
  Widget build(BuildContext context) {
    final double widgetWidth = 103.w;
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () => Navigator.pushNamed(context, AppRoutesMain.contentDetail,
          arguments: tarotToday.id),
      child: SizedBox(
        width: widgetWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.extraMediumRadius),
              child: AppImage(
                imageUrl: tarotToday.thumbnail ?? AppImages.imgDefaultImage,
                width: widgetWidth,
                height: widgetWidth,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10.r),
                  alignment: Alignment.topLeft,
                  child: Text(
                    tarotToday.name,
                    style: AppStyles.text15.preMed,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(AppImages.icView),
                    AppSize.spaceSmall.horizontalSpace,
                    Text(
                      StringUtils.formatNumber(tarotToday.viewCount.toDouble()),
                      style: AppStyles.text14.preReg
                          .copyWith(color: AppColors.black.withOpacity(0.5)),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class WContentWithLike extends StatelessWidget {
  WContentWithLike({super.key, required this.tarotToday, this.isLiked = false});
  final AppMainContent tarotToday;
  bool isLiked;
  @override
  Widget build(BuildContext context) {
    final double widgetWidth = 103.w;
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () => Navigator.pushNamed(context, AppRoutesMain.contentDetail,
          arguments: tarotToday.id),
      child: SizedBox(
        width: widgetWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(AppSize.extraMediumRadius),
                  child: AppImage(
                    imageUrl: tarotToday.thumbnail ?? AppImages.imgDefaultImage,
                    width: widgetWidth,
                    height: widgetWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: isLiked
                      ? SvgPicture.asset(AppImages.icLikeFill)
                      : SvgPicture.asset(
                          AppImages.icLikeNoFill,
                          colorFilter: const ColorFilter.mode(
                              AppColors.white, BlendMode.srcIn),
                        ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    tarotToday.name,
                    style: AppStyles.text15.preMed,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(AppImages.icView),
                    AppSize.spaceSmall.horizontalSpace,
                    Text(
                      StringUtils.formatNumber(tarotToday.viewCount.toDouble()),
                      style: AppStyles.text14.preReg,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class WUserContent extends StatelessWidget {
  WUserContent({
    Key? key,
    required this.userContent,
    this.isLiked = false,
    this.onClicked,
  }) : super(key: key);
  final UserContent userContent;
  bool isLiked;
  final VoidCallback? onClicked;
  @override
  Widget build(BuildContext context) {
    final double widgetWidth = 103.w;
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onClicked ??
          () => Navigator.pushNamed(context, AppRoutesMain.contentDetail,
              arguments: userContent.contentId),
      child: SizedBox(
        width: widgetWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(AppSize.extraMediumRadius),
                  child: AppImage(
                    imageUrl:
                        userContent.thumbnail ?? AppImages.imgDefaultThumbnail,
                    width: widgetWidth,
                    height: widgetWidth,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(AppSize.iconSmall),
                  child: isLiked
                      ? SvgPicture.asset(AppImages.icLikeFill)
                      : SvgPicture.asset(
                          AppImages.icLikeNoFill,
                          colorFilter: const ColorFilter.mode(
                              AppColors.white, BlendMode.srcIn),
                        ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(maxHeight: 50.h),
                  alignment: Alignment.topLeft,
                  child: Text(
                    userContent.name,
                    style: AppStyles.text15.preMed,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(AppImages.icView),
                    AppSize.spaceSmall.horizontalSpace,
                    Text(
                      StringUtils.formatNumber(
                          userContent.viewCount.toDouble()),
                      style: AppStyles.text14.preReg,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
