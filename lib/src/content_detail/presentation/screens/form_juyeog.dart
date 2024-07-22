import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/common/main_bloc.dart';
import 'package:borra_app/src/authentication/auth/data/models/user.dart';
import 'package:borra_app/src/content_detail/business_logic/content_detail/content_detail_bloc.dart';
import 'package:borra_app/src/content_detail/data/models/content.dart';
import 'package:borra_app/src/content_detail/data/models/content_input_argument.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../../app_base/config/app_routes.dart';
import '../../../../common/widgets/app_button.dart';
import '../../../authentication/auth/data/models/auth_status.dart';
import '../widgets/w_bottom_buttons.dart';
import '../widgets/w_gender_select.dart';
import '../widgets/w_juyeog.dart';

class FormJuyeog extends StatefulWidget {
  const FormJuyeog({super.key, required this.content});
  final AppContent content;

  @override
  State<FormJuyeog> createState() => _FormJuyeogState();
}

class _FormJuyeogState extends State<FormJuyeog> {
  late User? user;
  TextEditingController name = TextEditingController();
  late List<int> selectedCard;
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
    if (name.text.isNotEmpty && selectedCard.length == 2 && gender.isNotEmpty) {
      bloc.add(const ValidateInput(true));
    } else {
      bloc.add(const ValidateInput(false));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSize.paddingWithScreen),
      child: Column(
        children: [
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
                      contentPadding: EdgeInsets.only(bottom: 12.r),
                      border: InputBorder.none,
                      hintText: LocaleKeys.my_account_edit_user_name_hint.tr(),
                      hintStyle: AppStyles.text13.preLight.copyWith(
                        color: AppColors.black.withOpacity(0.5),
                      ),
                    ),
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
          WJuyeogSelect(
            onSelectCard: (value) {
              if (value.length == 2) {
                selectedCard = value;
              }
              validateInput();
            },
          ),
          AppSize.space32.verticalSpace,
          Container(
            padding: EdgeInsets.all(17.r),
            width: double.infinity,
            decoration: AppStyles.containerDecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.content_detail_juyeog_protagonist.tr(),
                  style: AppStyles.text13.preBold,
                ),
                AppSize.space15.verticalSpace,
                Text(
                  LocaleKeys.content_detail_juyeog_detail.tr(),
                  style: AppStyles.text14.preLight,
                )
              ],
            ),
          ),
          AppSize.space32.verticalSpace,
          MainBloc.authBloc.state.authStatus ==
                  const AuthStatus.unauthenticated()
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSize.paddingWithScreen),
                  child: const AppButton(
                    text: '',
                    type: ButtonType.kakao,
                  ),
                )
              : WContentButtomButtons(
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
        ],
      ),
    );
  }
}
