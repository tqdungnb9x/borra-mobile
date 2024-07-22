import 'dart:io';

import 'package:borra_app/app_base/config/app_config.dart';
import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/common/widgets/app_header.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app_base/config/app_routes.dart';
import '../../../../../app_base/utils/app_utils.dart';
import '../../../../../common/pages/p_stateful.dart';
import '../../../../../common/widgets/w_media.dart';
import '../../../auth/business_logic/blocs/authentication_bloc.dart';
import '../../business_logic/blocs/sign_in_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends PageStateful<SignInScreen, SignInBloc> {
  @override
  Widget buildPage(BuildContext context, SignInBloc bloc) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        state.status.whenOrNull(
          idle: () {
            showLoading(context, false);
          },
          loading: () {
            showLoading(context, true);
          },
          success: (data) {
            showLoading(context, false);
            context.read<AuthenticationBloc>().initial();
          },
          failure: (error) {
            showLoading(context, false);
            UiUtils.showInfoSnackBar(context, message: error);
          },
        );
      },
      listenWhen: (previous, current) => previous.status != current.status,
      child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppHeader(context),
          body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppSize.space113.verticalSpace,
                Image.asset(
                  AppImages.imgLogo,
                  width: AppSize.loginLogoSize,
                  height: AppSize.loginLogoSize,
                  fit: BoxFit.fill,
                ),
                AppSize.spaceBetweenWidgetExtraLarge.verticalSpace,
                InkWell(
                  onTap: () async {
                    bloc.onClicked();
                  },
                  child: Container(
                    height: AppSize.buttonLoginSize.height,
                    width: AppSize.buttonLoginSize.width,
                    padding: EdgeInsets.symmetric(
                        vertical: AppSize.spaceBetweenWidgetMedium,
                        horizontal: AppSize.paddingWithScreen),
                    decoration: ShapeDecoration(
                      color: AppColors.kakaoBg,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.radius6),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgWidget.asset(AppImages.icChat),
                        const Spacer(),
                        Text(LocaleKeys.sign_in_button_kakao.tr(),
                            style: AppStyles.text14.preMed),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
                AppSize.space15.verticalSpace,
                Visibility(
                  visible: Platform.isIOS,
                  child: InkWell(
                    onTap: () async {
                      bloc.onSignAppleClicked();
                    },
                    child: Container(
                      height: AppSize.buttonLoginSize.height,
                      width: AppSize.buttonLoginSize.width,
                      padding: EdgeInsets.symmetric(
                          vertical: AppSize.spaceBetweenWidgetMedium,
                          horizontal: AppSize.paddingWithScreen),
                      decoration: ShapeDecoration(
                        color: AppColors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.radius6),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.apple,
                            color: AppColors.white,
                          ),
                          const Spacer(),
                          Text(LocaleKeys.sign_in_button_apple.tr(),
                              style: AppStyles.text14.preMed
                                  .copyWith(color: AppColors.white)),
                          const Spacer()
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
