import 'package:borra_app/app_base/config/app_routes.dart';
import 'package:borra_app/app_base/extensions/extension.dart';
import 'package:borra_app/app_base/utils/app_utils.dart';
import 'package:borra_app/common/main_bloc.dart';
import 'package:borra_app/common/pages/p_stateful.dart';
import 'package:borra_app/common/widgets/app_button.dart';
import 'package:borra_app/common/widgets/app_header.dart';
import 'package:borra_app/common/widgets/dialogs/w_app_dialog.dart';
import 'package:borra_app/common/widgets/w_app_divider.dart';
import 'package:borra_app/src/authentication/auth/data/models/user.dart';
import 'package:borra_app/src/content_detail/presentation/widgets/w_gender_select.dart';
import 'package:borra_app/src/content_detail/presentation/widgets/w_select_date.dart';
import 'package:borra_app/src/content_detail/presentation/widgets/w_select_time.dart';
import 'package:borra_app/src/home/data/models/tag.dart';
import 'package:borra_app/src/home/presentation/widgets/w_section_header.dart';
import 'package:borra_app/src/home/presentation/widgets/w_tag_list.dart';
import 'package:borra_app/src/my_account/business_logic/manage_profile/manage_profile_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../../app_base/generated/locale_keys.g.dart';
import '../../../../common/widgets/dialogs/w_question_dialog.dart';
import '../../../content_detail/presentation/widgets/w_select_marital.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key, required this.listTag});
  final List<AppTag> listTag;
  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState
    extends PageStateful<EditAccountScreen, ManageProfileBloc> {
  bool allowNext = true;
  TextEditingController name = TextEditingController();
  late User editUser;

  @override
  @override
  void afterFirstBuild(BuildContext context) {
    bloc.initial();
    super.afterFirstBuild(context);
  }

  @override
  Widget buildPage(BuildContext context, ManageProfileBloc bloc) {
    return BlocListener<ManageProfileBloc, ManageProfileState>(
      listenWhen: ((previous, current) =>
          previous.statusLoadingData != current.statusLoadingData),
      listener: (context, state) {
        state.statusLoadingData.whenOrNull(
          idle: () {
            showLoading(context, false);
          },
          loading: () {
            showLoading(context, true);
          },
          success: (user) async {
            showLoading(context, false);
            final User u = user as User;
            editUser = u.copyWith();
            setState(() {
              name.text = u.name ?? '';
            });
          },
          failure: (error) {
            showLoading(context, false);
          },
        );
      },
      child: BlocListener<ManageProfileBloc, ManageProfileState>(
        listener: (context, state) {
          state.statusChanging.whenOrNull(
            idle: () {
              showLoading(context, false);
            },
            loading: () {
              showLoading(context, true);
            },
            success: (_) async {
              showLoading(context, false);
              MainBloc.authBloc.updateUserInfo();
              showDialog(
                  context: context,
                  builder: (context) {
                    return WAppDialog(
                      content: LocaleKeys.app_dialog_user_edit_inform.tr(),
                      onActionProceed: () {
                        Navigator.pop(context, true); // return;
                      },
                    );
                  });
            },
            failure: (error) async {
              showLoading(context, false);
            },
          );
        },
        listenWhen: ((previous, current) =>
            previous.statusChanging != current.statusChanging),
        child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppHeader(
            context,
            titleText: LocaleKeys.my_account_edit_user_title.tr(),
            actionWidgets: [
              Padding(
                padding: EdgeInsets.only(right: AppSize.paddingWithScreen),
                child: InkWell(
                  onTap: () async {
                    if (bloc.state.isChangedInfo == true) {
                      await showDialog(
                        context: context,
                        builder: (context) {
                          return WQuestionDialog(
                              content: LocaleKeys
                                  .app_dialog_user_edit_without_save
                                  .tr(),
                              actionString: LocaleKeys.button_yes.tr(),
                              onConfirmClicked: () {
                                Navigator.of(context).pop();
                              },
                              onCancelClicked: () {});
                        },
                      );
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Icon(
                    Icons.close,
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
          body: GestureDetector(
            onTap: () => KeyboardUtil.hideKeyboard(context),
            child: BlocBuilder<ManageProfileBloc, ManageProfileState>(
              buildWhen: (previous, current) => previous.user != current.user,
              builder: (context, state) {
                if (state.user == null) {
                  return const SizedBox();
                }
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(
                      AppSize.paddingWithScreen,
                    ),
                    child: Column(
                      children: [
                        WSectionHeader(
                          headerTitle:
                              LocaleKeys.my_account_edit_user_edit_info.tr(),
                        ),
                        AppSize.space22.verticalSpace,
                        Row(
                          children: [
                            SizedBox(
                              width: 80.r,
                              child: Text(
                                LocaleKeys.my_account_edit_user_name.tr(),
                                style: AppStyles.text13.preLight,
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: TextFormField(
                                controller: name,
                                style: AppStyles.text15.preMed,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp(
                                        r'[a-z A-Z \u1100-\u11FF\u3130-\u318F\uAC00-\uD7AF]'),
                                  ),
                                  LengthLimitingTextInputFormatter(40),
                                ],
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: LocaleKeys
                                      .my_account_edit_user_name_hint
                                      .tr(),
                                  hintStyle: AppStyles.text13.preLight.copyWith(
                                    color: AppColors.black.withOpacity(0.5),
                                  ),
                                ),
                                onChanged: (name) {
                                  editUser = editUser.copyWith(name: name);
                                  final User u =
                                      bloc.state.user!.copyWith(name: name);
                                  bloc.updateProfile(u);
                                  if (name == '') {
                                    allowNext = false;
                                  } else {
                                    allowNext = true;
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                        AppSize.space15.verticalSpace,
                        const AppDivider(
                          color: AppColors.dividerColor,
                        ),
                        AppSize.space15.verticalSpace,
                        WGenderSelect(
                          onSelected: (gender) {
                            editUser = editUser.copyWith(gender: gender);
                            bloc.updateProfile(editUser);
                          },
                          initialValue: state.user!.gender,
                        ),
                        AppSize.space15.verticalSpace,
                        const AppDivider(
                          color: AppColors.dividerColor,
                        ),
                        AppSize.space15.verticalSpace,
                        WMaritalSelect(
                          initialMarital: state.user!.marital,
                          onMaritalSelected: (value) {
                            editUser = editUser.copyWith(marital: value);
                            bloc.updateProfile(editUser);
                          },
                        ),
                        AppSize.space15.verticalSpace,
                        const AppDivider(
                          color: AppColors.dividerColor,
                        ),
                        AppSize.space15.verticalSpace,
                        WSelectDate(
                          initialDate: state.user!.birthedAt,
                          initialType: state.user!.calendar,
                          onSelectedDay: (day) {
                            var birthday = DateTime.parse(editUser.birthedAt ??
                                DateTime.now().toString());
                            birthday = birthday.copyWith(day: day);
                            editUser = editUser.copyWith(
                                birthedAt: birthday.toString());
                            bloc.updateProfile(editUser);
                          },
                          onSelectedMonth: (month) {
                            var birthday = DateTime.parse(editUser.birthedAt ??
                                DateTime.now().toString());
                            birthday = birthday.copyWith(month: month);
                            editUser = editUser.copyWith(
                                birthedAt: birthday.toString());
                            bloc.updateProfile(editUser);
                          },
                          onSelectedYear: (year) {
                            var birthday = DateTime.parse(editUser.birthedAt ??
                                DateTime.now().toString());
                            birthday = birthday.copyWith(year: year);
                            editUser = editUser.copyWith(
                                birthedAt: birthday.toString());
                            bloc.updateProfile(editUser);
                          },
                          onCalendarTypeChanged: (calendar) {
                            if (calendar != null) {
                              editUser = editUser.copyWith(calendar: calendar);
                              bloc.updateProfile(editUser);
                            }
                          },
                        ),
                        AppSize.space15.verticalSpace,
                        const AppDivider(
                          color: AppColors.dividerColor,
                        ),
                        AppSize.space15.verticalSpace,
                        WSelectTime(
                          initialTime: DateTime.tryParse(editUser.birthedAt!),
                          isBirthedTime:
                              editUser.isBirthedTime.toBool, //true: checked
                          onSelectedTime: (h, m, gotTime) {
                            String dateTime =
                                editUser.birthedAt ?? DateTime.now().toString();
                            DateTime temp = DateTime.parse(dateTime)
                                .copyWith(hour: h ?? 0, minute: m ?? 0);
                            editUser = editUser.copyWith(
                                birthedAt: temp.toString(),
                                isBirthedTime: gotTime.toInt);
                            bloc.updateProfile(editUser);
                          },
                        ),
                        AppSize.space15.verticalSpace,
                        const AppDivider(
                          color: AppColors.dividerColor,
                        ),
                        AppSize.space32.verticalSpace,
                        WSectionHeader(
                          headerTitle: LocaleKeys.home_tag_section_header.tr(),
                        ),
                        AppSize.space15.verticalSpace,
                        WTagUserList(
                          onSelectedTag: (value) {
                            editUser = editUser.copyWith(tags: value);
                            bloc.updateProfile(editUser);
                          },
                          listTag: widget.listTag,
                          userTags: state.user!.tags,
                        ),
                        AppSize.space32.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              LocaleKeys.my_account_edit_user_receive_setting
                                  .tr(),
                              style: AppStyles.text20.preBold,
                            ),
                            InkWell(
                              onTap: () async {
                                var result = await Navigator.pushNamed(
                                    context, AppRoutesMain.userSettingNoti,
                                    arguments: editUser);
                                if (result is bool) {
                                  editUser =
                                      editUser.copyWith(isNotify: result);
                                  bloc.updateProfile(editUser);

                                  bloc.setNoti(result);
                                }
                              },
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.black.withOpacity(0.5),
                              ),
                            )
                          ],
                        ),
                        AppSize.space22.verticalSpace,
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return WQuestionDialog(
                                  title: LocaleKeys
                                      .my_account_edit_user_withdraw_setting_title
                                      .tr(),
                                  content: LocaleKeys
                                      .my_account_edit_user_withdraw_setting_content
                                      .tr(),
                                  actionString: LocaleKeys
                                      .my_account_edit_user_action_string
                                      .tr(),
                                  onConfirmClicked: () async {
                                    Navigator.pushNamed(
                                        context, AppRoutesMain.userWithdraw);
                                  },
                                );
                              },
                            );
                          },
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              LocaleKeys.my_account_edit_user_withdraw.tr(),
                              style: AppStyles.text14.preMed.copyWith(
                                  color: AppColors.black.withOpacity(0.5)),
                            ),
                          ),
                        ),
                        AppSize.space22.verticalSpace,
                        BlocSelector<ManageProfileBloc, ManageProfileState,
                            bool>(
                          selector: (state) {
                            return state.isChangedInfo;
                          },
                          builder: (context, isChangedInfo) {
                            return AppButton(
                              onClicked: isChangedInfo && allowNext
                                  ? () async {
                                      await showDialog(
                                        context: context,
                                        builder: (context) {
                                          return WQuestionDialog(
                                              title: LocaleKeys
                                                  .my_account_edit_user_save_change
                                                  .tr(),
                                              content: LocaleKeys
                                                  .my_account_edit_user_save_change_question
                                                  .tr(),
                                              actionString:
                                                  LocaleKeys.button_yes.tr(),
                                              onConfirmClicked: () {
                                                bloc.confirmUpdate(editUser);
                                              },
                                              onCancelClicked: () {});
                                        },
                                      );
                                    }
                                  : null,
                              text: isChangedInfo && allowNext
                                  ? LocaleKeys.button_save.tr()
                                  : LocaleKeys.my_account_edit_user_enter_info
                                      .tr(),
                              color: isChangedInfo && allowNext
                                  ? AppColors.black.withOpacity(0.8)
                                  : AppColors.buttonDisable,
                              type: isChangedInfo && allowNext
                                  ? ButtonType.fill
                                  : ButtonType.disabled,
                            );
                          },
                        ),
                        AppSize.spaceBetweenBottomBar.verticalSpace,
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
