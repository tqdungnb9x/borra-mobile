import 'dart:io';

import 'package:borra_app/app_base/config/app_config.dart';
import 'package:borra_app/app_base/config/app_routes.dart';
import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/common/admob/rewarded_ad.dart';
import 'package:borra_app/common/pages/p_stateful.dart';
import 'package:borra_app/common/widgets/app_button.dart';
import 'package:borra_app/src/authentication/auth/business_logic/blocs/authentication_bloc.dart';
import 'package:borra_app/src/content_detail/business_logic/content_purchased/content_purchased_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../../app_base/constants/ad_unit_id.dart';
import '../../../../app_base/models/ad_unit_id_model.dart';
import '../../../../app_base/utils/app_utils.dart';
import '../../../../common/main_bloc.dart';
import '../../../../common/widgets/dialogs/w_app_dialog.dart';
import '../../../../common/admob/native_ad.dart';
import '../../data/models/content_input_argument.dart';
import 'content_purchased_result_screen.dart';

class InterstitialCustomAdvertisementScreen extends StatefulWidget {
  const InterstitialCustomAdvertisementScreen(
      {super.key, required this.appContentSubmit});
  final ContentInputArgument appContentSubmit;
  @override
  State<InterstitialCustomAdvertisementScreen> createState() =>
      _InterstitialCustomAdvertisementScreenState();
}

class _InterstitialCustomAdvertisementScreenState extends PageStateful<
    InterstitialCustomAdvertisementScreen, ContentPurchasedBloc> {
  String name = '';
  InterstitialAd? _interstitialAd;
  @override
  void afterFirstBuild(BuildContext context) {
    name = widget.appContentSubmit.user != null
        ? widget.appContentSubmit.user!.name
        : '';
    bloc.initial(widget.appContentSubmit);
    super.afterFirstBuild(context);
  }

  bool isLoadingCompleted = false;
  bool isContentResult = false;
  bool isAdLoaded = false;

  void _loadInterstitialAd(ContentPurchasedState argResult) {
    InterstitialAd.load(
      adUnitId: Platform.isIOS
          ? AppAdUnitId.freeContentViewIOS
          : AppAdUnitId.freeContentViewAOS,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              _moveToResult(argResult);
            },
          );

          setState(() {
            _interstitialAd = ad;
          });
        },
        onAdFailedToLoad: (err) {
          debugPrint('Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget buildPage(BuildContext context, ContentPurchasedBloc bloc) {
    AuthenticationBloc authenticationBloc = context.watch<AuthenticationBloc>();
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
              setState(() {
                isContentResult = true;
              });
            },
          );
        },
        child: Scaffold(
            backgroundColor: AppColors.white,
            body: Container(
                width: double.infinity,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50.r,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.centerRight,
                      padding:
                          EdgeInsets.only(right: AppSize.paddingWithScreen),
                      child: InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(
                          Icons.close,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.r,
                    ),
                    Image.asset(AppImages.imgMiddleLogo,
                        height: 100.r, fit: BoxFit.fitHeight),
                    SizedBox(
                      height: 30.r,
                    ),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20.r, horizontal: 0),
                        child: SizedBox(
                          width: 300.r,
                          height: 60.r,
                          child: BlocBuilder<ContentPurchasedBloc,
                              ContentPurchasedState>(
                            buildWhen: (previous, current) =>
                                previous.contentResult != current.contentResult,
                            builder: (context, state) {
                              if (state.contentResult == null) {
                                return SizedBox(
                                    height: 80.h,
                                    child: Text(
                                      '${widget.appContentSubmit.user!.name}${LocaleKeys.content_detail_waiting_title.tr()}',
                                      style: AppStyles.text18.preMed
                                          .copyWith(color: AppColors.primary01),
                                      textAlign: TextAlign.center,
                                    ));
                              }
                              _loadInterstitialAd(state);
                              return AppButton(
                                text: LocaleKeys
                                    .content_detail_waiting_to_result
                                    .tr(),
                                onClicked: () {
                                  if (_interstitialAd != null) {
                                    _interstitialAd?.show();
                                  } else {
                                    _moveToResult(state);
                                  }
                                },
                              );
                            },
                          ),
                        )),
                    SizedBox(
                      height: 20.h,
                    ),
                    NativeAdmob(
                        templateType: TemplateType.medium,
                        adUnitId: AdUnitId(
                            android: AppAdUnitId.freeHoroscopeTabAndroid,
                            iOS: AppAdUnitId.freeHoroscopeTabiOS),
                        height: 300.h,
                        onAdLoaded: () => handleAdLoaded()),
                  ],
                ))));
  }

  void handleAdLoaded() {
    setState(() {
      isAdLoaded = true;
    });
  }

  void _moveToResult(ContentPurchasedState state) {
    Navigator.popUntil(context, ModalRoute.withName(AppRoutesMain.dashBoard));
    if (state.contentResult!.content.type.id == 3) {
      Navigator.pushNamed(context, AppRoutesMain.resultContent,
          arguments: ContentResultArguments(
            checkLiked: state.isLiked,
            contentResult: state.contentResult!,
            tarotList: state.tarotList,
          ));
      return;
    }
    Navigator.pushNamed(context, AppRoutesMain.resultContent,
        arguments: ContentResultArguments(
          checkLiked: state.isLiked,
          contentResult: state.contentResult!,
        ));
  }
}
