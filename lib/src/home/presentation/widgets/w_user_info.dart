import 'package:borra_app/app_base/config/app_routes.dart';
import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/src/authentication/auth/data/models/user.dart';
import 'package:borra_app/src/home/data/models/tag.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../../app_base/utils/app_utils.dart';

class WUserInfo extends StatelessWidget {
  const WUserInfo({super.key, required this.user, required this.listTags});
  final User user;
  final List<AppTag> listTags;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              // width: 200.r,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${user.name}',
                      style: AppStyles.text24.preBold
                          .copyWith(color: AppColors.primary01),
                    ),
                    TextSpan(
                      text: LocaleKeys.home_user_welcome.tr(),
                      style: AppStyles.text24.preBold,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(
                  context, AppRoutesMain.userInfoEdit,
                  arguments: listTags),
              child: CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.primary01,
                child: SvgPicture.asset(AppImages.icEdit),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              StringUtils.mapGenderToString(user.gender ?? 0),
              style: AppStyles.text13.preReg
                  .copyWith(color: AppColors.black.withOpacity(0.5)),
            ),
            Padding(
              padding: EdgeInsets.all(5.r),
              child: Container(
                height: 14.h,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 0.5, color: AppColors.black.withOpacity(0.5))),
              ),
            ),
            Text(
              UtilTimeZone.formatDate(DateTime.parse('${user.birthedAt}'),
                  format: 'yyyy-MM-dd'),
              style: AppStyles.text13.preReg
                  .copyWith(color: AppColors.black.withOpacity(0.5)),
            ),
            Padding(
              padding: EdgeInsets.all(5.r),
              child: Container(
                height: 2,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: AppColors.black.withOpacity(0.5))),
              ),
            ),
            Text(
              StringUtils.mapCalendarToString(user.calendar),
              style: AppStyles.text13.preReg
                  .copyWith(color: AppColors.black.withOpacity(0.5)),
            ),
            Padding(
              padding: EdgeInsets.all(5.r),
              child: Container(
                height: 2,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: AppColors.black.withOpacity(0.5))),
              ),
            ),
            Text(
              UtilTimeZone.formatDate(DateTime.parse('${user.birthedAt}'),
                  format: LocaleKeys.common_format_time.tr()),
              style: AppStyles.text13.preReg
                  .copyWith(color: AppColors.black.withOpacity(0.5)),
            ),
          ],
        )
      ],
    );
  }
}
