import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/common/input_component/app_input_form_field.dart';
import 'package:borra_app/common/pages/p_stateful.dart';
import 'package:borra_app/common/widgets/app_button.dart';
import 'package:borra_app/common/widgets/app_header.dart';
import 'package:borra_app/src/my_account/business_logic/manage_profile/manage_profile_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../../app_base/utils/app_utils.dart';
import '../../../../common/main_bloc.dart';
import '../../../home/presentation/widgets/w_section_header.dart';

class WithdrawUserScreen extends StatefulWidget {
  const WithdrawUserScreen({super.key});

  @override
  State<WithdrawUserScreen> createState() => _WithdrawUserScreenState();
}

class _WithdrawUserScreenState
    extends PageStateful<WithdrawUserScreen, ManageProfileBloc> {
  TextEditingController controller = TextEditingController();
  bool allowNext = false;

  validate() {
    if (controller.text.isEmpty) {
      allowNext = false;
    } else {
      allowNext = true;
    }
    setState(() {});
  }

  @override
  Widget buildPage(BuildContext context, ManageProfileBloc bloc) {
    return BlocListener<ManageProfileBloc, ManageProfileState>(
      listener: (context, state) {
        state.statusChangingWithdraw.whenOrNull(
          idle: () {
            showLoading(context, false);
          },
          loading: () {
            showLoading(context, true);
          },
          success: (_) async {
            MainBloc.authBloc.logOut();
            showLoading(context, false);
          },
          failure: (error) {
            UiUtils.showInfoSnackBar(context, message: error, isError: false);
            showLoading(context, false);
          },
        );
      },
      listenWhen: ((previous, current) =>
          previous.statusChangingWithdraw != current.statusChangingWithdraw),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppHeader(
          context,
          titleText: LocaleKeys.my_account_withdraw_user_title.tr(),
        ),
        body: SafeArea(
          bottom: true,
          child: GestureDetector(
            onTap: () => KeyboardUtil.hideKeyboard(context),
            child: Container(
              height: double.infinity,
              padding: EdgeInsets.only(
                left: AppSize.paddingWithScreen,
                right: AppSize.paddingWithScreen,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      WSectionHeader(
                        headerTitle:
                            LocaleKeys.my_account_withdraw_user_header.tr(),
                      ),
                      AppSize.space22.verticalSpace,
                      Container(
                        padding: EdgeInsets.only(
                            bottom: AppSize.spaceBetweenWidgetMedium),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.black.withOpacity(0.1))),
                        child: ContentInputFormField(
                          controller: controller,
                          hint: LocaleKeys.my_account_withdraw_user_reason_hint
                              .tr(),
                          maxLength: 200,
                          maxLines: 10,
                          onChanged: (value) {
                            bloc.add(OnChangeOutReason(value));
                            validate();
                          },
                        ),
                      )
                    ],
                  ),
                  AppButton(
                    text: LocaleKeys.button_check.tr(),
                    type: allowNext ? ButtonType.fill : ButtonType.disabled,
                    onClicked: allowNext
                        ? () {
                            bloc.deleteUser();
                          }
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
