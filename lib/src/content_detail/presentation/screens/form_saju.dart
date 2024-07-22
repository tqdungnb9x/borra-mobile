import 'package:borra_app/app_base/extensions/extension.dart';
import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/app_base/utils/app_utils.dart';
import 'package:borra_app/common/main_bloc.dart';
import 'package:borra_app/common/widgets/dialogs/w_question_dialog.dart';
import 'package:borra_app/src/content_detail/data/models/content.dart';
import 'package:borra_app/src/content_detail/data/models/content_input_argument.dart';
import 'package:borra_app/src/content_detail/presentation/widgets/w_gender_select.dart';
import 'package:borra_app/src/content_detail/presentation/widgets/w_select_date.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../../app_base/config/app_routes.dart';
import '../../../../common/widgets/app_button.dart';
import '../../../authentication/auth/data/models/auth_status.dart';
import '../../../home/presentation/widgets/w_section_header.dart';
import '../../business_logic/content_detail/content_detail_bloc.dart';
import '../widgets/w_bottom_buttons.dart';
import '../widgets/w_select_marital.dart';
import '../widgets/w_select_time.dart';
import 'form_previews.dart';

class FormSaju extends StatefulWidget {
  const FormSaju({super.key, required this.content});
  final AppContent content;

  @override
  State<FormSaju> createState() => _FormSajuState();
}

class _FormSajuState extends State<FormSaju> {
  late ContentDetailBloc bloc;
  @override
  void initState() {
    bloc = context.read<ContentDetailBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSize.paddingWithScreen),
      child: Column(
        children: [
          AppSize.space36.verticalSpace,
          FormSajuInput(
            isParner: false,
            currentInputInfo: bloc.state.currentUser,
          ),
          if (widget.content.isPartner) ...[
            AppSize.spaceUltraLarge.verticalSpace,
            const FormSajuInput(
              isParner: true,
            ),
          ],
          AppSize.space22.verticalSpace,
          WSectionHeader(
              headerTitle: LocaleKeys.content_detail_saju_review_header.tr()),
          AppSize.spaceBetweenWidgetMedium.verticalSpace,
          const FormPreviews(),
          AppSize.spaceBetweenWidgetExtraMedium.verticalSpace,
          MainBloc.authBloc.state.authStatus ==
                  const AuthStatus.unauthenticated()
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSize.paddingWithScreen),
                  child: AppButton(
                    text: '',
                    type: ButtonType.kakao,
                    onClicked: () =>
                        Navigator.pushNamed(context, AppRoutesMain.signIn),
                  ),
                )
              : WContentButtomButtons(
                  content: widget.content,
                  onSubmitClicked: () {
                    ContentInputArgument inputArgument = ContentInputArgument(
                      widget.content,
                      user: bloc.state.currentUser,
                      partner: bloc.state.partner,
                      isShowAds: widget.content.price == 0,
                    );
                    if (widget.content.price == 0) {
                      Navigator.pushNamed(context,
                          AppRoutesMain.interstitialCustomAdvertisement,
                          arguments: inputArgument);
                    } else {
                      Navigator.of(context).pop();
                      Navigator.pushNamed(
                          context, AppRoutesMain.contentPurchasedResult,
                          arguments: inputArgument);
                    }
                  },
                ),
        ],
      ),
    );
  }
}

class FormSajuInput extends StatefulWidget {
  const FormSajuInput({
    super.key,
    required this.isParner,
    this.currentInputInfo,
  });

  final bool isParner;
  final ContentBasicArgument? currentInputInfo;

  @override
  State<FormSajuInput> createState() => _FormSajuInputState();
}

class _FormSajuInputState extends State<FormSajuInput> {
  TextEditingController controller = TextEditingController();
  int _resetCount = 0;
  int? gender;
  String? marital;
  String? calendar;
  int? year, month, day;
  int? hour, min;
  bool? gotBirthDay;
  late ContentBasicArgument currentUser;
  late DateTime dateTime;
  late ContentDetailBloc bloc;
  @override
  void initState() {
    bloc = context.read<ContentDetailBloc>();
    currentUser = widget.currentInputInfo ?? ContentBasicArgument.empty();

    controller.text = currentUser.name;
    dateTime =
        UtilTimeZone.getDateTime2FromString(time: currentUser.birthedAt!);
    calendar = currentUser.calendar;
    gender = currentUser.gender;
    marital = currentUser.marital;
    calendar = currentUser.calendar;
    year = dateTime.year;
    month = dateTime.month;
    day = dateTime.day;
    hour = dateTime.hour;
    min = dateTime.minute;
    gotBirthDay = (currentUser.isBirthedTime as int).toBool;

    validateInput();
    super.initState();
  }

  validateInput() {
    if (controller.text.isNotEmpty &&
        (gender != -1) &&
        marital != null &&
        calendar != null &&
        year != null &&
        month != null &&
        day != null &&
        gotBirthDay != null) {
      bloc.add(const ValidateInput(true));

      bloc.updateInput(currentUser, widget.isParner);
    } else {
      bloc.add(const ValidateInput(false));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: ValueKey<int>(_resetCount),
      child: Column(
        children: [
          WSectionHeader(
            headerTitle: widget.isParner
                ? LocaleKeys.content_detail_saju_input_partner.tr()
                : LocaleKeys.content_detail_saju_input_user.tr(),
            functionTitle: LocaleKeys.content_detail_saju_input_reset.tr(),
            onFunctionTitleClick: widget.isParner
                ? null
                : () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return WQuestionDialog(
                          title: LocaleKeys
                              .content_detail_saju_reset_dialog_title
                              .tr(),
                          content: LocaleKeys
                              .content_detail_saju_reset_dialog_content
                              .tr(),
                          actionString:
                              LocaleKeys.content_detail_saju_reset_action.tr(),
                          onConfirmClicked: () {
                            clearInputData();
                            ++_resetCount;
                            bloc.resetInput();
                            validateInput();
                          },
                        );
                      },
                    );
                  },
          ),
          //Name
          Container(
            height: 45.r,
            padding: EdgeInsets.symmetric(vertical: 10.r),
            width: MediaQuery.of(context).size.width,
            child: Row(
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
                    controller: controller,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(bottom: 12.r),
                        hintText:
                            LocaleKeys.my_account_edit_user_name_hint.tr(),
                        hintStyle: AppStyles.text13.preLight
                            .copyWith(color: AppColors.black.withOpacity(0.5))),
                    style: AppStyles.text15.preMed,
                    onChanged: (value) {
                      currentUser = currentUser.copyWith(name: value);
                      validateInput();
                    },
                  ),
                )
              ],
            ),
          ),
          const Divider(
            color: AppColors.dividerColor,
            thickness: 1,
          ),
          WGenderSelect(
            initialValue: gender,
            onSelected: (value) {
              gender = value;
              currentUser = currentUser.copyWith(gender: value);
              validateInput();
            },
          ),
          const Divider(
            color: AppColors.dividerColor,
            thickness: 1,
          ),
          WMaritalSelect(
            initialMarital: marital,
            onMaritalSelected: (value) {
              marital = value;
              currentUser = currentUser.copyWith(marital: value);
              validateInput();
            },
          ),
          const Divider(
            color: AppColors.dividerColor,
            thickness: 1,
          ),
          WSelectDate(
            initialDate: currentUser.birthedAt,
            initialType: currentUser.calendar,
            onCalendarTypeChanged: (value) {
              calendar = value;
              if (calendar != null) {
                currentUser = currentUser.copyWith(calendar: calendar);
              }
              validateInput();
            },
            onSelectedYear: (value) {
              year = value;
              if (value != null) {
                dateTime = dateTime.copyWith(year: value);
                currentUser = currentUser.copyWith(
                    birthedAt: UtilTimeZone.getStringDateTime(time: dateTime));
              }
              validateInput();
            },
            onSelectedMonth: (value) {
              month = value;
              if (value != null) {
                dateTime = dateTime.copyWith(month: value);
                currentUser = currentUser.copyWith(
                    birthedAt: UtilTimeZone.getStringDateTime(time: dateTime));
              }
              validateInput();
            },
            onSelectedDay: (value) {
              day = value;
              if (value != null) {
                dateTime = dateTime.copyWith(day: value);
                currentUser = currentUser.copyWith(
                    birthedAt: UtilTimeZone.getStringDateTime(time: dateTime));
              }
              validateInput();
            },
          ),

          const Divider(
            color: AppColors.dividerColor,
            thickness: 1,
          ),
          WSelectTime(
            initialTime: dateTime,
            isBirthedTime: gotBirthDay,
            onSelectedTime: (h, m, isForgot) {
              hour = h;
              min = m;
              gotBirthDay = isForgot;
              String dateTime = currentUser.birthedAt!;
              DateTime temp = DateTime.parse(dateTime)
                  .copyWith(hour: h ?? 0, minute: m ?? 0);
              currentUser = currentUser.copyWith(
                  birthedAt: UtilTimeZone.getStringDateTime(time: temp),
                  isBirthedTime: isForgot.toInt);
              validateInput();
            },
          ),
          const Divider(
            color: AppColors.dividerColor,
            thickness: 1,
          ),
        ],
      ),
    );
  }

  clearInputData() {
    currentUser = ContentBasicArgument.empty();
    controller.clear();
    gender = null;
    marital = null;
    calendar = 'solar';
    dateTime = DateTime(1990, 1, 1);
    year = dateTime.year;
    month = dateTime.month;
    day = dateTime.day;
    hour = null;
    min = null;
    gotBirthDay = null;
  }
}
