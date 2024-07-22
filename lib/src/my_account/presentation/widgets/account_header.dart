import 'package:borra_app/app_base/config/app_routes.dart';
import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/src/authentication/auth/data/models/user.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../../app_base/utils/app_utils.dart';
import '../../../authentication/auth/business_logic/blocs/authentication_bloc.dart';
import '../../business_logic/account_bloc.dart';

class WAccountHeader extends StatefulWidget {
  const WAccountHeader({
    super.key,
  });

  @override
  State<WAccountHeader> createState() => _WAccountHeaderState();
}

class _WAccountHeaderState extends State<WAccountHeader> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state.user == null) return const SizedBox.shrink();
        User userState = state.user!;
        return Container(
          padding: EdgeInsets.symmetric(horizontal: AppSize.paddingWithScreen),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${userState.name}',
                    style: AppStyles.text24.preBold,
                  ),
                  BlocBuilder<AccountBloc, AccountState>(
                    builder: (context, state) {
                      return InkWell(
                        onTap: () async {
                          Navigator.pushNamed(
                              context, AppRoutesMain.userInfoEdit,
                              arguments: state.listTag);
                        },
                        child: CircleAvatar(
                          radius: 20.r,
                          backgroundColor: AppColors.primary01,
                          child: SvgPicture.asset(AppImages.icEdit),
                        ),
                      );
                    },
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    StringUtils.mapGenderToString(userState.gender ?? 0),
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
                        DateTime.parse('${userState.birthedAt}'),
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
                    StringUtils.mapCalendarToString(userState.calendar),
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
                        DateTime.parse('${userState.birthedAt}'),
                        format: LocaleKeys.common_format_time.tr()),
                    style: AppStyles.text14.preReg
                        .copyWith(color: AppColors.black.withOpacity(0.5)),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
