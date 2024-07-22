import 'package:borra_app/app_base/config/app_config.dart';
import 'package:borra_app/app_base/config/app_routes.dart';
import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/app_base/utils/app_utils.dart';
import 'package:borra_app/common/main_bloc.dart';
import 'package:borra_app/common/pages/p_stateful.dart';
import 'package:borra_app/common/widgets/app_button.dart';
import 'package:borra_app/src/content_detail/business_logic/content_purchased/content_purchased_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/dialogs/w_app_dialog.dart';
import '../../data/models/content_input_argument.dart';
import 'content_purchased_result_screen.dart';

class WaitingResultScreen extends StatefulWidget {
  const WaitingResultScreen({super.key, required this.appContentSubmit});
  final ContentInputArgument appContentSubmit;
  @override
  State<WaitingResultScreen> createState() => _WaitingResultScreenState();
}

class _WaitingResultScreenState
    extends PageStateful<WaitingResultScreen, ContentPurchasedBloc> {
  String name = '';
  @override
  void afterFirstBuild(BuildContext context) {
    name = widget.appContentSubmit.user != null
        ? widget.appContentSubmit.user!.name
        : '';
    bloc.initial(widget.appContentSubmit);
    super.afterFirstBuild(context);
  }

  @override
  Widget buildPage(BuildContext context, ContentPurchasedBloc bloc) {
    return BlocListener<ContentPurchasedBloc, ContentPurchasedState>(
      listener: (context, state) {
        state.status.whenOrNull(
          failure: (error) {
            String message = error.toString();
            if (message.contains('Payment')) {
              showDialog(
                context: context,
                builder: (context) {
                  return WAppDialog(
                    content:
                        LocaleKeys.content_detail_waiting_error_payment.tr(),
                    actionString: LocaleKeys.button_check.tr(),
                    onActionProceed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(
                          context, AppRoutesMain.accountPayment);
                    },
                  );
                },
              );
            } else {
              UiUtils.showInfoSnackBar(context,
                      message: 'Unknown error $message')
                  .then((value) => Navigator.pop(context));
            }
          },
          success: (data) {
            MainBloc.authBloc.updateUserInfo();
          },
        );
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: AppSize.paddingWithScreen),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.primary01.withOpacity(0.1),
                AppColors.white,
                AppColors.white,
                AppColors.white,
                AppColors.white,
                AppColors.white,
              ],
            ),
          ),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 120.r, horizontal: 0.r),
                child: Image.asset(AppImages.imgMiddleLogo),
              ),
              BlocBuilder<ContentPurchasedBloc, ContentPurchasedState>(
                buildWhen: (previous, current) =>
                    previous.contentResult != current.contentResult,
                builder: (context, state) {
                  if (state.contentResult == null) {
                    return Text(
                      '$name${LocaleKeys.content_detail_waiting_title.tr()}',
                      style: AppStyles.text16.preMed
                          .copyWith(color: AppColors.primary01),
                    );
                  }
                  return AppButton(
                    text: LocaleKeys.content_detail_waiting_to_result.tr(),
                    onClicked: () {
                      Navigator.of(context).pop();
                      if (state.contentResult!.content.type.id == 3) {
                        Navigator.pushNamed(
                            context, AppRoutesMain.resultContent,
                            arguments: ContentResultArguments(
                                contentResult: state.contentResult!,
                                onLikeContent: null,
                                tarotList: state.tarotList,
                                checkLiked: false));
                        return;
                      }
                      Navigator.pushNamed(context, AppRoutesMain.resultContent,
                          arguments: ContentResultArguments(
                            onLikeContent: null,
                            contentResult: state.contentResult!,
                            checkLiked: false,
                          ));
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
