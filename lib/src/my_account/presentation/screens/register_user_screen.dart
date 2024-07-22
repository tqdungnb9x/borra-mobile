import 'package:borra_app/app_base/config/app_routes.dart';
import 'package:borra_app/app_base/extensions/extension.dart';
import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/app_base/utils/app_utils.dart';
import 'package:borra_app/common/pages/p_stateful.dart';
import 'package:borra_app/common/widgets/app_header.dart';
import 'package:borra_app/src/authentication/auth/data/models/user.dart';
import 'package:borra_app/src/dashboard/business_logic/cubits/dashboard_cubit.dart';
import 'package:borra_app/src/home/data/models/tag.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../../app_base/constants/link_constant.dart';
import '../../../../common/main_bloc.dart';
import '../../../../common/widgets/app_button.dart';
import '../../../../common/widgets/dialogs/w_app_dialog.dart';
import '../../../../common/widgets/dialogs/w_question_dialog.dart';
import '../../../../common/widgets/w_app_divider.dart';
import '../../../content_detail/presentation/widgets/w_gender_select.dart';
import '../../../content_detail/presentation/widgets/w_select_date.dart';
import '../../../content_detail/presentation/widgets/w_select_marital.dart';
import '../../../content_detail/presentation/widgets/w_select_time.dart';
import '../../../home/presentation/widgets/w_section_header.dart';
import '../../../home/presentation/widgets/w_tag_list.dart';
import '../../business_logic/manage_profile/manage_profile_bloc.dart';
import '../widgets/w_checkbox_field.dart';

class RegisterUserScreen extends StatefulWidget {
  const RegisterUserScreen(
      {super.key, required this.listTag, required this.currentUser});
  final List<AppTag> listTag;
  final User currentUser;
  @override
  State<RegisterUserScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState
    extends PageStateful<RegisterUserScreen, ManageProfileBloc> {
  bool allowNext = false;
  TextEditingController name = TextEditingController();
  late User editUser;
  bool checkAll = false;
  bool allowCollectInfo = false;
  bool isNotify = false;
  bool allowSendInfo = false;
  int? gender;
  String? marital;
  String? calendar;
  int? year, month, day;
  int? hour, min;
  bool? gotBirthDay;
  DateTime? dateTime;
  List<int> tags = [];
  @override
  void initState() {
    editUser = widget.currentUser;
    name.text = widget.currentUser.name ?? '';
    dateTime = DateTime.parse(widget.currentUser.birthedAt!);
    calendar = widget.currentUser.calendar;
    gender = widget.currentUser.gender;
    marital = widget.currentUser.marital;
    calendar = widget.currentUser.calendar;
    year = dateTime!.year;
    month = dateTime!.month;
    day = dateTime!.day;
    hour = dateTime!.hour;
    min = dateTime!.minute;
    gotBirthDay = widget.currentUser.isBirthedTime == 1 ? true : false;
    isNotify = widget.currentUser.isNotify;
    tags = widget.currentUser.tags;
    super.initState();
  }

  validateCheck() {
    if (allowCollectInfo && isNotify && allowSendInfo) {
      checkAll = true;
    } else {
      checkAll = false;
    }
    setState(() {});
  }

  validateInput() {
    if (name.text.isNotEmpty &&
        (gender != null) &&
        marital != null &&
        calendar != null &&
        year != null &&
        month != null &&
        day != null &&
        gotBirthDay != null &&
        allowCollectInfo &&
        tags.isNotEmpty) {
      allowNext = true;
    } else {
      allowNext = false;
    }
    setState(() {});
  }

  @override
  Widget buildPage(BuildContext context, ManageProfileBloc bloc) {
    return BlocListener<ManageProfileBloc, ManageProfileState>(
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
                      Navigator.pushNamedAndRemoveUntil(
                          context, AppRoutesMain.account, (route) => false);
                    },
                  );
                });
          },
          failure: (error) async {
            showLoading(context, false);
            UiUtils.showInfoSnackBar(context, message: error);
          },
        );
      },
      listenWhen: ((previous, current) =>
          previous.statusChanging != current.statusChanging),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppHeader(
            context,
            titleText: LocaleKeys.my_account_register_user_title.tr(),
            actionWidgets: [],
          ),
          body: BlocBuilder<ManageProfileBloc, ManageProfileState>(
            buildWhen: (previous, current) => previous.user != current.user,
            builder: (context, state) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(
                    AppSize.paddingWithScreen,
                  ),
                  child: Column(
                    children: [
                      WSectionHeader(
                        headerTitle:
                            LocaleKeys.my_account_register_user_header.tr(),
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
                                bloc.updateProfile(editUser);
                                validateInput();
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
                        onSelected: (value) {
                          gender = value;
                          editUser = editUser.copyWith(gender: gender);
                          bloc.updateProfile(editUser);
                          validateInput();
                        },
                        initialValue: editUser.gender,
                      ),
                      AppSize.space15.verticalSpace,
                      const AppDivider(
                        color: AppColors.dividerColor,
                      ),
                      AppSize.space15.verticalSpace,
                      WMaritalSelect(
                        initialMarital: editUser.marital,
                        onMaritalSelected: (value) {
                          marital = value;
                          editUser = editUser.copyWith(marital: value);
                          bloc.updateProfile(editUser);
                          validateInput();
                        },
                      ),
                      AppSize.space15.verticalSpace,
                      const AppDivider(
                        color: AppColors.dividerColor,
                      ),
                      AppSize.space15.verticalSpace,
                      WSelectDate(
                        initialDate: editUser.birthedAt,
                        initialType: editUser.calendar,
                        onSelectedDay: (value) {
                          day = value;
                          var birthday = DateTime.parse(
                              editUser.birthedAt ?? DateTime.now().toString());
                          birthday = birthday.copyWith(day: day);
                          editUser =
                              editUser.copyWith(birthedAt: birthday.toString());
                          bloc.updateProfile(editUser);
                          validateInput();
                        },
                        onSelectedMonth: (value) {
                          month = value;
                          var birthday = DateTime.parse(
                              editUser.birthedAt ?? DateTime.now().toString());
                          birthday = birthday.copyWith(month: month);
                          editUser =
                              editUser.copyWith(birthedAt: birthday.toString());
                          bloc.updateProfile(editUser);
                          validateInput();
                        },
                        onSelectedYear: (value) {
                          year = value;
                          var birthday = DateTime.parse(
                              editUser.birthedAt ?? DateTime.now().toString());
                          birthday = birthday.copyWith(year: year);
                          editUser =
                              editUser.copyWith(birthedAt: birthday.toString());
                          bloc.updateProfile(editUser);
                          validateInput();
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
                        initialTime: DateTime.tryParse(
                            editUser.birthedAt ?? DateTime.now().toString()),
                        isBirthedTime:
                            editUser.isBirthedTime.toBool, //true: checked
                        onSelectedTime: (h, m, gotTime) {
                          hour = h;
                          min = m;
                          gotBirthDay = gotTime;
                          String dateTime =
                              editUser.birthedAt ?? DateTime.now().toString();
                          DateTime temp = DateTime.parse(dateTime)
                              .copyWith(hour: h ?? 0, minute: m ?? 0);
                          editUser = editUser.copyWith(
                              birthedAt: temp.toString(),
                              isBirthedTime: gotTime.toInt);
                          bloc.updateProfile(editUser);
                          validateInput();
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
                          tags = value;
                          editUser = editUser.copyWith(tags: value);
                          bloc.updateProfile(editUser);
                          validateInput();
                        },
                        listTag: widget.listTag,
                        userTags: editUser.tags,
                      ),
                      AppSize.space32.verticalSpace,
                      Column(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    checkAll = !checkAll;
                                    if (checkAll == true) {
                                      allowCollectInfo = true;
                                      isNotify = true;
                                      allowSendInfo = true;
                                    } else {
                                      allowCollectInfo = false;
                                      isNotify = false;
                                      allowSendInfo = false;
                                    }
                                    editUser = editUser.copyWith(
                                        isNotify: isNotify,
                                        isAgree: 1,
                                        isAgreeAll: true);
                                    bloc.updateProfile(editUser);
                                    validateInput();
                                  });
                                },
                                child: checkAll
                                    ? SvgPicture.asset(AppImages.icChecked)
                                    : SvgPicture.asset(AppImages.icUncheck),
                              ),
                              AppSize.spaceBetweenWidgetMedium.horizontalSpace,
                              Text(
                                LocaleKeys
                                    .my_account_register_user_agree_all_term
                                    .tr(),
                                style: AppStyles.text16.preReg,
                              )
                            ],
                          ),
                          AppSize.space15.verticalSpace,
                          WConditionCheck(
                            title: LocaleKeys
                                .my_account_register_user_allow_collect_info
                                .tr(),
                            initialValue: allowCollectInfo,
                            onValueChanged: (value) {
                              allowCollectInfo = value;
                              editUser = editUser.copyWith(
                                isNotify: isNotify,
                                isAgree: 1,
                              );
                              bloc.updateProfile(editUser);
                              validateCheck();
                              validateInput();
                            },
                            onDetailClicked: () {
                              List<String> links = [
                                AppLinksConstant.collectDataPolicy1,
                                AppLinksConstant.collectDataPolicy2,
                              ];
                              Navigator.pushNamed(
                                  context, AppRoutesMain.notificationDetail,
                                  arguments: links);
                            },
                          ),
                          AppSize.space15.verticalSpace,
                          WConditionCheck(
                            title: LocaleKeys
                                .my_account_register_user_allow_noti
                                .tr(),
                            initialValue: isNotify,
                            onValueChanged: (value) {
                              isNotify = value;
                              editUser = editUser.copyWith(isNotify: value);
                              bloc.updateProfile(editUser);
                              validateCheck();
                            },
                            onDetailClicked: () {
                              List<String> links = [
                                AppLinksConstant.notificationPolicy1,
                                AppLinksConstant.notificationPolicy2,
                              ];
                              Navigator.pushNamed(
                                  context, AppRoutesMain.notificationDetail,
                                  arguments: links);
                            },
                          ),
                          AppSize.space15.verticalSpace,
                          WConditionCheck(
                            title: LocaleKeys
                                .my_account_register_user_consent_info
                                .tr(),
                            initialValue: allowSendInfo,
                            onValueChanged: (value) {
                              allowSendInfo = value;
                              validateCheck();
                            },
                            onDetailClicked: () {
                              List<String> links = [
                                AppLinksConstant.consentDataPolicy1,
                                AppLinksConstant.consentDataPolicy2,
                              ];
                              Navigator.pushNamed(
                                  context, AppRoutesMain.notificationDetail,
                                  arguments: links);
                            },
                          ),
                        ],
                      ),
                      AppSize.space22.verticalSpace,
                      AppButton(
                        onClicked: allowNext
                            ? () async {
                                await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return WQuestionDialog(
                                        title: LocaleKeys
                                            .my_account_register_user_popup_title
                                            .tr()
                                            .tr(),
                                        content: LocaleKeys
                                            .my_account_register_user_popup_content
                                            .tr(),
                                        actionString: LocaleKeys
                                            .my_account_register_user_action_string
                                            .tr(),
                                        onConfirmClicked: () {
                                          bloc.confirmUpdate(editUser);
                                        },
                                        onCancelClicked: () {});
                                  },
                                );
                              }
                            : null,
                        text: allowNext
                            ? LocaleKeys.button_sign_up.tr()
                            : LocaleKeys.my_account_edit_user_enter_info.tr(),
                        color: allowNext
                            ? AppColors.black.withOpacity(0.8)
                            : AppColors.buttonDisable,
                        type: allowNext ? ButtonType.fill : ButtonType.disabled,
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
    );
  }
}
