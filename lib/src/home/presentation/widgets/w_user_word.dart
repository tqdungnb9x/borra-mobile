import 'package:borra_app/app_base/config/app_routes.dart';
import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/src/authentication/auth/business_logic/blocs/authentication_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../../common/widgets/app_button.dart';
import '../../../authentication/auth/data/models/auth_status.dart';

class WUserWord extends StatelessWidget {
  const WUserWord({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      buildWhen: (previous, current) =>
          previous.user != current.user ||
          previous.userWord != current.userWord,
      builder: (context, state) {
        var user = state.user;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.paddingWithScreen),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppSize.space24,
                vertical: AppSize.paddingWithScreen),
            width: double.infinity,
            decoration: ShapeDecoration(
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: AppSize.borderWidth,
                    color: AppColors.black.withOpacity(0.08),
                  ),
                  borderRadius:
                      BorderRadius.circular(AppSize.extraMediumRadius),
                ),
                shadows: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.05),
                    blurRadius: 19.r,
                    offset: const Offset(0, 9),
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    text: state.authStatus != const AuthStatus.unauthenticated()
                        ? user!.name != null
                            ? '${user.name}${LocaleKeys.home_user_word_of.tr()} '
                            : LocaleKeys.home_user_word_of.tr()
                        : '',
                    style: AppStyles.text18.preMed,
                    children: [
                      TextSpan(
                          text: LocaleKeys.home_user_word_fortune.tr(),
                          style: AppStyles.textUnderline.copyWith(
                              fontSize: 18.r,
                              decorationThickness: 6.r,
                              decorationStyle: TextDecorationStyle.solid))
                    ],
                  ),
                ),
                AppSize.spaceBetweenWidgetExtraMedium.verticalSpace,
                state.authStatus == const AuthStatus.unauthenticated()
                    ? const AppButton(
                        text: '',
                        type: ButtonType.kakao,
                      )
                    : InkWell(
                        onTap: () => Navigator.pushNamed(
                            context, AppRoutesMain.contentDetail,
                            arguments: 2),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            state.userWord,
                            style: AppStyles.text16,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
