import 'package:borra_app/app_base/config/app_routes.dart';
import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/src/content_result/data/models/saju_detail_model.dart';
import 'package:borra_app/src/content_result/presentation/screens/saju_kanji_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../../app_base/utils/app_utils.dart';
import '../../../content_detail/business_logic/content_purchased/content_purchased_bloc.dart';
import '../../business_logic/content_result/content_result_bloc.dart';

// ignore: must_be_immutable
class WSajuPurchaseHeader extends StatelessWidget {
  WSajuPurchaseHeader({
    super.key,
    required this.purchaseInfo,
    this.isLiked,
    required this.sajuDetail,
    required this.contentId,
  });
  final dynamic purchaseInfo;
  final SajuDetail sajuDetail;
  final int contentId;
  bool? isLiked;
  @override
  Widget build(BuildContext context) {
    Size signSize = Size(20.r, 20.r);

    return BlocBuilder<ContentPurchasedBloc, ContentPurchasedState>(
      builder: (context, state) {
        return SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    purchaseInfo.name,
                    style: AppStyles.text24.preBold,
                  ),
                  isLiked != null
                      ? InkWell(
                          onTap: () {
                            var bloc = context.read<ContentPurchasedBloc>();
                            bloc.clickLikeButton(context, contentId);
                          },
                          child: SvgPicture.asset(
                            state.isLiked
                                ? AppImages.icLikeFill
                                : AppImages.icLikeNoFill,
                            width: signSize.width,
                            height: signSize.height,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    mapGenderToString(purchaseInfo.gender),
                    style: AppStyles.text14.preReg
                        .copyWith(color: AppColors.black.withOpacity(0.5)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.r),
                    child: Container(
                      height: 14.h,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 0.5,
                              color: AppColors.black.withOpacity(0.5))),
                    ),
                  ),
                  Text(
                    UtilTimeZone.formatDate(
                        DateTime.parse(purchaseInfo.birthedAt),
                        format: 'yyyy-MM-dd'),
                    style: AppStyles.text14.preReg
                        .copyWith(color: AppColors.black.withOpacity(0.5)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.r),
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: AppColors.black.withOpacity(0.5))),
                    ),
                  ),
                  Text(
                    mapCalendarToString(purchaseInfo.calendar),
                    style: AppStyles.text14.preReg
                        .copyWith(color: AppColors.black.withOpacity(0.5)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.r),
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: AppColors.black.withOpacity(0.5))),
                    ),
                  ),
                  Text(
                    UtilTimeZone.formatDate(
                        DateTime.parse(purchaseInfo.birthedAt),
                        format: LocaleKeys.common_format_time.tr()),
                    style: AppStyles.text14.preReg
                        .copyWith(color: AppColors.black.withOpacity(0.5)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.r),
                    child: Container(
                      height: 14.h,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 0.5,
                              color: AppColors.black.withOpacity(0.5))),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      var sajuArgs = SajuGanJiArgument(
                          name: purchaseInfo.name, sajuDetail: sajuDetail);
                      Navigator.pushNamed(
                          context, AppRoutesMain.contentSajuDetail,
                          arguments: sajuArgs);
                    },
                    child: Text(
                      LocaleKeys.content_detail_view_saju_analysis.tr(),
                      style: AppStyles.text14.preReg
                          .copyWith(color: AppColors.primary01),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  mapGenderToString(int gender) {
    switch (gender) {
      case 0:
        return LocaleKeys.component_gender_male.tr();
      case 1:
        return LocaleKeys.component_gender_female.tr();

      default:
        return LocaleKeys.component_gender_male.tr();
    }
  }

  mapCalendarToString(String calendar) {
    switch (calendar) {
      case 'solar':
        return LocaleKeys.component_solar.tr();
      case 'lunar':
        return LocaleKeys.component_lunar.tr();

      default:
        return LocaleKeys.component_leap.tr();
    }
  }
}
