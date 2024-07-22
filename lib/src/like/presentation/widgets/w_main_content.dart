import 'package:borra_app/app_base/extensions/extension.dart';
import 'package:borra_app/src/like/data/models/user_liked_content_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../../app_base/config/app_routes.dart';
import '../../../../app_base/utils/app_utils.dart';
import '../../../../common/widgets/app_image.dart';
import '../../data/models/like_content_model.dart';

class WMainContent extends StatelessWidget {
  const WMainContent({
    super.key,
    required this.likeContent,
    this.isBottomTab,
  });
  final LikeContent likeContent;
  final bool? isBottomTab;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () => Navigator.pushNamed(context, AppRoutesMain.contentDetail,
          arguments: likeContent.id),
      child: SizedBox(
        height: 122.h,
        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.radius6),
                  child: AppImage(
                      height: 122.h,
                      width: 122.h,
                      imageUrl:
                          likeContent.thumbnail ?? AppImages.imgDefaultImage),
                ),
                Visibility(
                    visible: likeContent.isNew == 0 && likeContent.isHot == 1,
                    child: Positioned(
                        right: 12.w,
                        child: SvgPicture.asset(
                          AppImages.icHotLabel,
                          width: 28.w,
                          height: 45.h,
                        ))),
                Visibility(
                    visible: likeContent.isNew == 1 && likeContent.isNew == 1,
                    child: Positioned(
                        right: 12.w,
                        child: SvgPicture.asset(
                          AppImages.icNewLabel,
                          width: 28.w,
                          height: 45.h,
                        ))),
              ],
            ),
            AppSize.spaceUltraLarge.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    likeContent.name,
                    style: AppStyles.text15.preMed,
                    // overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    likeContent.summary ?? "",
                    style: AppStyles.text13.preLight,
                    // overflow: TextOverflow.ellipsis,
                  ),
                  AppSize.spaceSmall.verticalSpace,
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(AppImages.icLike),
                        AppSize.spaceSmall.horizontalSpace,
                        Text(
                          StringUtils.formatNumber(
                              likeContent.likeCount.toDouble()),
                          style: AppStyles.text12.preLight
                              .copyWith(color: AppColors.likeTextColor),
                        ),
                        VerticalDivider(
                          color: AppColors.black.withOpacity(.3),
                          thickness: 1,
                          indent: 5.h,
                          endIndent: 3.h,
                        ),
                        SvgPicture.asset(AppImages.icView),
                        AppSize.spaceSmall.horizontalSpace,
                        Text(
                          StringUtils.formatNumber(
                              likeContent.viewCount.toDouble()),
                          style: AppStyles.text12.preLight
                              .copyWith(color: AppColors.black.withOpacity(.5)),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  isBottomTab == null || isBottomTab == false
                      ? likeContent.isDiscount
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppImages.icDiscountCate,
                                          height: 16.r,
                                          width: 16.r,
                                        ),
                                        AppSize.spaceSmall.horizontalSpace,
                                        Text(
                                          likeContent.price
                                              .toDouble()
                                              .borraCoin,
                                          style: TextStyle(
                                              color: AppColors
                                                  .priceDiscountTextColor,
                                              fontSize: 16.r),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 1.r,
                                      width: 40.r,
                                      color:
                                          AppColors.priceDiscountTextColorLine,
                                    )
                                  ],
                                ),
                                AppSize.spaceSmall.horizontalSpace,
                                SvgPicture.asset(
                                  AppImages.icCurrency,
                                  height: 16.r,
                                  width: 16.r,
                                ),
                                AppSize.spaceSmall.horizontalSpace,
                                Text(
                                  // StringUtils.formatNumber(likeContent.price.toDouble()),
                                  likeContent.discountPrice!
                                      .toDouble()
                                      .borraCoin,
                                  style: TextStyle(
                                      color: AppColors.priceTextColor,
                                      fontSize: 16.r),
                                )
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AppImages.icCurrency,
                                ),
                                AppSize.spaceSmall.horizontalSpace,
                                Text(
                                  // StringUtils.formatNumber(likeContent.price.toDouble()),
                                  likeContent.price.toDouble().borraCoin,
                                  style: TextStyle(
                                      color: AppColors.priceTextColor,
                                      fontSize: 16.r),
                                )
                              ],
                            )
                      : const SizedBox()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WMainContentUser extends StatelessWidget {
  const WMainContentUser({
    super.key,
    required this.likeContent,
    this.onClicked,
  });
  final UserLikedContent likeContent;
  final VoidCallback? onClicked;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onClicked ??
          () => Navigator.pushNamed(context, AppRoutesMain.contentDetail,
              arguments: likeContent.contentId),
      child: SizedBox(
        height: 122.h,
        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.radius6),
                  child: AppImage(
                      height: 122.h,
                      width: 122.h,
                      imageUrl: likeContent.thumbnail),
                ),
                Visibility(
                    visible: likeContent.isNew == 0 && likeContent.isHot == 1,
                    child: Positioned(
                        right: 12.w,
                        child: SvgPicture.asset(
                          AppImages.icHotLabel,
                          width: 28.w,
                          height: 45.h,
                        ))),
                Visibility(
                    visible: likeContent.isNew == 1 && likeContent.isNew == 1,
                    child: Positioned(
                        right: 12.w,
                        child: SvgPicture.asset(
                          AppImages.icNewLabel,
                          width: 28.w,
                          height: 45.h,
                        ))),
              ],
            ),
            AppSize.spaceUltraLarge.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    likeContent.name,
                    style: AppStyles.text15.preMed,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    likeContent.summary,
                    style: AppStyles.text13.preLight,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AppSize.spaceSmall.verticalSpace,
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(AppImages.icLike),
                        AppSize.spaceSmall.horizontalSpace,
                        Text(
                          StringUtils.formatNumber(
                              likeContent.likeCount.toDouble()),
                          style: AppStyles.text12.preLight
                              .copyWith(color: AppColors.likeTextColor),
                        ),
                        VerticalDivider(
                          color: AppColors.black.withOpacity(.3),
                          thickness: 1,
                          indent: 5.h,
                          endIndent: 3.h,
                        ),
                        SvgPicture.asset(AppImages.icView),
                        AppSize.spaceSmall.horizontalSpace,
                        Text(
                          StringUtils.formatNumber(
                              likeContent.viewCount.toDouble()),
                          style: AppStyles.text12.preLight
                              .copyWith(color: AppColors.black.withOpacity(.5)),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppImages.icCurrency,
                      ),
                      AppSize.spaceSmall.horizontalSpace,
                      Text(
                        // StringUtils.formatNumber(likeContent.price.borraCoin .toDouble()),
                        likeContent.price.toDouble().borraCoin,
                        style: AppStyles.text16.preLight
                            .copyWith(color: AppColors.priceTextColor),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
