import 'package:borra_app/app_base/config/app_routes.dart';
import 'package:borra_app/app_base/constants/link_constant.dart';
import 'package:borra_app/common/widgets/app_header.dart';
import 'package:borra_app/common/widgets/dialogs/w_question_dialog.dart';
import 'package:borra_app/src/home/presentation/widgets/w_section_header.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../../app_base/generated/locale_keys.g.dart';
import '../../../authentication/auth/data/models/user.dart';

class SettingNotificationScreen extends StatefulWidget {
  const SettingNotificationScreen({
    super.key,
    required this.user,
  });
  final User user;
  @override
  State<SettingNotificationScreen> createState() =>
      _SettingNotificationScreenState();
}

class _SettingNotificationScreenState extends State<SettingNotificationScreen> {
  late bool allowedNoti;
  @override
  void initState() {
    allowedNoti = widget.user.isNotify;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppHeader(
        context,
        titleText: LocaleKeys.dashboard_my_account.tr(),
        actionClicked: () {
          if (allowedNoti != widget.user.isNotify) {
            Navigator.of(context).pop(allowedNoti);
            return;
          }
          Navigator.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(AppSize.paddingWithScreen),
          child: Column(
            children: [
              WSectionHeader(
                  headerTitle:
                      LocaleKeys.my_account_edit_user_receive_setting.tr()),
              AppSize.space32.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      List<String> links = [
                        AppLinksConstant.notificationPolicy1,
                        AppLinksConstant.notificationPolicy2,
                      ];
                      Navigator.pushNamed(
                          context, AppRoutesMain.notificationDetail,
                          arguments: links);
                    },
                    child: Text.rich(
                      TextSpan(
                        text: LocaleKeys.my_account_setting_noti_receive_fortune
                            .tr(),
                        children: [
                          TextSpan(
                            text: LocaleKeys.button_details.tr(),
                            style: AppStyles.text14.preMed.copyWith(
                                color: AppColors.black.withOpacity(0.5),
                                decoration: TextDecoration.underline,
                                decorationThickness: 0.5,
                                decorationStyle: TextDecorationStyle.solid),
                          ),
                        ],
                        style: AppStyles.text14.preMed,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Transform.scale(
                      scale: 0.8,
                      child: SwitchListTile.adaptive(
                          contentPadding: const EdgeInsets.all(0),
                          value: allowedNoti,
                          activeColor: AppColors.primary01,
                          onChanged: (value) {
                            if (!value) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return WQuestionDialog(
                                        content: LocaleKeys
                                            .my_account_setting_noti_question
                                            .tr(),
                                        actionString:
                                            LocaleKeys.button_yes.tr(),
                                        onConfirmClicked: () {
                                          setState(() {
                                            allowedNoti = !allowedNoti;
                                          });
                                        });
                                  });
                            } else {
                              setState(() {
                                allowedNoti = !allowedNoti;
                              });
                            }
                          }),
                    ),
                  ),
                ],
              ),
              AppSize.spaceBetweenWidgetMedium.verticalSpace,
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.r, horizontal: 17.r),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primary01),
                  borderRadius: BorderRadius.circular(AppSize.mediumRadius),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '• ',
                          style: AppStyles.text14.preReg,
                        ),
                        Expanded(
                          child: Text(
                            LocaleKeys.my_account_setting_noti_guide_1.tr(),
                            style: AppStyles.text14.preReg,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '• ',
                          style: AppStyles.text14.preReg,
                        ),
                        Expanded(
                          child: Text(
                            LocaleKeys.my_account_setting_noti_guide_2.tr(),
                            style: AppStyles.text14.preReg,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
