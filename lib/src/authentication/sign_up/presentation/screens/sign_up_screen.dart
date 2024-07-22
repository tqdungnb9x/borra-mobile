import 'package:borra_app/src/home/data/models/tag.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../app_base/config/app_config.dart';
import '../../../../../common/widgets/app_button.dart';
import '../../../../../common/widgets/app_header.dart';
import '../../../../../common/widgets/dialogs/w_question_dialog.dart';
import '../../../../../common/widgets/w_app_divider.dart';
import '../../../../content_detail/presentation/widgets/w_gender_select.dart';
import '../../../../content_detail/presentation/widgets/w_select_date.dart';
import '../../../../content_detail/presentation/widgets/w_select_marital.dart';
import '../../../../content_detail/presentation/widgets/w_select_time.dart';
import '../../../../home/presentation/widgets/w_section_header.dart';
import '../../../../home/presentation/widgets/w_tag_list.dart';
import '../../../../my_account/presentation/widgets/w_checkbox_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key, required this.listTag});
  final List<AppTag> listTag;
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool allowNext = false;
  TextEditingController name = TextEditingController();
  bool checkAll = false;
  bool check1 = false;
  bool check2 = false;
  bool check3 = false;
  int? gender;
  String? marital;
  String? calendar;
  String? year, month, day;
  int? hour, min;
  bool? gotBirthDay;
  DateTime? dateTime;
  @override
  void initState() {
    super.initState();
  }

  validateCheck() {
    if (check1 && check2 && check3) {
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
        gotBirthDay != null) {
      // bloc.add(ValidateInput(true));
      // bloc.updateInput(currentUser, widget.isParner);
    } else {
      // bloc.add(ValidateInput(false));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppHeader(
        context,
        titleText: '내 정보',
        actionWidgets: [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(
            AppSize.paddingWithScreen,
          ),
          child: Column(
            children: [
              const WSectionHeader(
                headerTitle: '내 정보 수정',
              ),
              AppSize.space22.verticalSpace,
              Row(
                children: [
                  SizedBox(
                    width: 80.r,
                    child: Text(
                      '이름',
                      style: AppStyles.text13.preLight,
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: TextFormField(
                      controller: name,
                      style: AppStyles.text15.preMed,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(
                            RegExp(r'[a-z A-Z 0-9]')),
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[^\x00-\x7F]')),
                        LengthLimitingTextInputFormatter(6),
                      ],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '이름을 입력해주세요',
                        hintStyle: AppStyles.text13.preLight.copyWith(
                          color: AppColors.black.withOpacity(0.5),
                        ),
                      ),
                      onChanged: (name) {
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
                onSelected: (gender) {
                  gender = gender;
                  validateInput();
                },
                initialValue: gender,
              ),
              AppSize.space15.verticalSpace,
              const AppDivider(
                color: AppColors.dividerColor,
              ),
              AppSize.space15.verticalSpace,
              WMaritalSelect(
                initialMarital: marital,
                onMaritalSelected: (value) {
                  marital = value;
                  validateInput();
                },
              ),
              AppSize.space15.verticalSpace,
              const AppDivider(
                color: AppColors.dividerColor,
              ),
              AppSize.space15.verticalSpace,
              WSelectDate(
                initialDate: null,
                initialType: calendar,
                onSelectedDay: (day) {
                  day = day;
                  validateInput();
                },
                onSelectedMonth: (month) {
                  month = month;
                  validateInput();
                },
                onSelectedYear: (year) {
                  year = year;
                  validateInput();
                },
                onCalendarTypeChanged: (calendar) {
                  calendar = calendar;
                  validateInput();
                },
              ),
              AppSize.space15.verticalSpace,
              const AppDivider(
                color: AppColors.dividerColor,
              ),
              AppSize.space15.verticalSpace,
              WSelectTime(
                isBirthedTime: gotBirthDay, //true: checked
                onSelectedTime: (h, m, gotTime) {
                  hour = h;
                  min = m;
                  gotBirthDay = gotTime;
                  validateInput();
                },
              ),
              AppSize.space15.verticalSpace,
              const AppDivider(
                color: AppColors.dividerColor,
              ),
              AppSize.space32.verticalSpace,
              const WSectionHeader(
                headerTitle: '지금 내 관심은...',
              ),
              AppSize.space15.verticalSpace,
              WTagUserList(
                onSelectedTag: (value) {},
                listTag: widget.listTag,
              ),
              AppSize.space32.verticalSpace,
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              checkAll = !checkAll;
                              if (checkAll == true) {
                                check1 = true;
                                check2 = true;
                                check3 = true;
                              } else {
                                check1 = false;
                                check2 = false;
                                check3 = false;
                              }
                            });
                          },
                          child: checkAll
                              ? SvgPicture.asset(AppImages.icChecked)
                              : SvgPicture.asset(AppImages.icUncheck),
                        ),
                        AppSize.spaceBetweenWidgetMedium.horizontalSpace,
                        Text(
                          '약관 전체 동의하기',
                          style: AppStyles.text16.preReg,
                        )
                      ],
                    ),
                    AppSize.space15.verticalSpace,
                    WConditionCheck(
                      title: '[필수] 개인정보 수집·이용 동의',
                      initialValue: check1,
                      onValueChanged: (value) {
                        check1 = value;
                        validateCheck();
                        validateInput();
                      },
                      onDetailClicked: () {},
                    ),
                    AppSize.space15.verticalSpace,
                    WConditionCheck(
                      title: '[선택] 마케팅 활용 및 광고성 정보 수신 동의',
                      initialValue: check2,
                      onValueChanged: (value) {
                        check2 = value;
                        validateCheck();
                      },
                      onDetailClicked: () {},
                    ),
                    AppSize.space15.verticalSpace,
                    WConditionCheck(
                      title: '[선택] 개인정보 제3자 제공 동의',
                      initialValue: check3,
                      onValueChanged: (value) {
                        check3 = value;
                        validateCheck();
                      },
                      onDetailClicked: () {},
                    ),
                  ],
                ),
              ),
              AppSize.space22.verticalSpace,
              AppButton(
                onClicked: allowNext
                    ? () async {
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return WQuestionDialog(
                                title: '변경사항 저장',
                                content: '변경사항을 저장하시겠습니까?',
                                actionString: '예',
                                onConfirmClicked: () {},
                                onCancelClicked: () {});
                          },
                        );
                      }
                    : null,
                text: allowNext ? '회원가입' : '정보를 입력해주세요',
                color: allowNext
                    ? AppColors.black.withOpacity(0.8)
                    : AppColors.buttonDisable,
                type: allowNext ? ButtonType.fill : ButtonType.disabled,
              ),
              AppSize.spaceBetweenBottomBar.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
