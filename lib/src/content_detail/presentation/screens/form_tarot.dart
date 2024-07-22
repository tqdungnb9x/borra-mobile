import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/src/content_detail/data/models/content.dart';
import 'package:borra_app/src/content_detail/presentation/widgets/w_tarot.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../../app_base/config/app_routes.dart';
import '../../../../common/main_bloc.dart';
import '../../../../common/widgets/app_button.dart';
import '../../../authentication/auth/data/models/auth_status.dart';
import '../../../authentication/auth/data/models/user.dart';
import '../../business_logic/content_detail/content_detail_bloc.dart';
import '../../data/models/content_input_argument.dart';
import '../widgets/w_bottom_buttons.dart';
import '../widgets/w_gender_select.dart';

class FormTarot extends StatefulWidget {
  const FormTarot({super.key, required this.content});
  final AppContent content;

  @override
  State<FormTarot> createState() => _FormTarotState();
}

class _FormTarotState extends State<FormTarot> {
  late User? user;
  TextEditingController name = TextEditingController();
  late List<String> selectedCard;
  late ContentDetailBloc bloc;
  late String gender;
  @override
  void initState() {
    bloc = context.read<ContentDetailBloc>();
    user = MainBloc.authBloc.state.user;
    if (user != null) {
      name.text = user!.name ?? '';
      gender = user!.gender.toString();
    } else {
      gender = '';
    }
    selectedCard = [];

    super.initState();
  }

  validateInput() {
    if (name.text.isNotEmpty &&
        selectedCard.length == widget.content.tarotCount &&
        gender.isNotEmpty) {
      bloc.add(const ValidateInput(true));
    } else {
      bloc.add(const ValidateInput(false));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: AppSize.paddingWithScreen),
          child: Column(
            children: [
              AppSize.space36.verticalSpace,
              //Name
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.r),
                width: MediaQuery.of(context).size.width,
                height: 45.r,
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
                        controller: name,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(bottom: 12.r),
                            hintText:
                                LocaleKeys.my_account_edit_user_name_hint.tr(),
                            hintStyle: AppStyles.text13.preLight.copyWith(
                                color: AppColors.black.withOpacity(0.5))),
                        style: AppStyles.text15.preMed,
                        onChanged: (value) {
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
                initialValue: user?.gender,
                onSelected: (value) {
                  gender = value.toString();
                  validateInput();
                },
              ),
              const Divider(
                color: AppColors.dividerColor,
                thickness: 1,
              ),
              AppSize.space22.verticalSpace,
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(17.r),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.black.withOpacity(0.08)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.06),
                      blurRadius: 8,
                      offset: const Offset(0, 6),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.imgLight,
                      height: 16.h,
                      width: 16.h,
                    ),
                    Text(
                      LocaleKeys.content_detail_tarot_choose_card.tr(),
                      style: AppStyles.text13.preBold,
                    ),
                  ],
                ),
              ),
              AppSize.space32.verticalSpace,
              WTarotSelect(
                listTarot: widget.content.tarot,
                onSelectCard: (value) {
                  if (value.isNotEmpty) {
                    selectedCard = value;
                  }
                  validateInput();
                },
              ),
              AppSize.space32.verticalSpace,

              AppSize.spaceBetweenWidgetExtraMedium.verticalSpace,
            ],
          ),
        ),
        MainBloc.authBloc.state.authStatus == const AuthStatus.unauthenticated()
            ? Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppSize.paddingWithScreen),
                child: const AppButton(
                  text: '',
                  type: ButtonType.kakao,
                ),
              )
            : Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppSize.paddingWithScreen),
                child: WContentButtomButtons(
                  content: widget.content,
                  onSubmitClicked: () {
                    ContentInputArgument inputArgument = ContentInputArgument(
                      widget.content,
                      user: ContentBasicArgument(
                        name: name.text,
                        gender: int.parse(gender),
                        value: selectedCard.join(','),
                      ),
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
              ),
      ],
    );
  }
}
