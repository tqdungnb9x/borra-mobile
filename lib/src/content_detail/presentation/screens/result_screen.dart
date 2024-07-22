// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:borra_app/app_base/constants/ad_unit_id.dart';
import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/app_base/models/ad_unit_id_model.dart';
import 'package:borra_app/common/pages/p_stateful.dart';
import 'package:borra_app/src/authentication/auth/data/models/auth_status.dart';
import 'package:borra_app/src/content_detail/business_logic/content_purchased/content_purchased_bloc.dart';
import 'package:borra_app/src/home/data/models/app_main_content.dart';
import 'package:clipboard/clipboard.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:borra_app/common/widgets/app_header.dart';
import 'package:borra_app/src/content_result/data/models/content_detail_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../../app_base/services/deep_link_service.dart';
import '../../../../app_base/utils/app_utils.dart';

import '../../../../common/main_bloc.dart';
import '../../../../common/widgets/app_button.dart';

import '../../../../common/widgets/dialogs/w_share_dialog.dart';
import '../../../../common/admob/rewarded_ad.dart';
import '../../../authentication/auth/business_logic/blocs/authentication_bloc.dart';
import '../../../content_feedback/business_logic/feedback/feedback_bloc.dart';
import '../../../content_feedback/presentations/feedback_widget.dart';
import '../../../content_recommend/business_logic/recommend/recommend_bloc.dart';
import '../../../content_recommend/presentation/recommend_widget.dart';
import '../../../content_result/presentation/screens/form_juyeog_result.dart';
import '../../../content_result/presentation/screens/form_saju_result.dart';
import '../../../content_result/presentation/screens/form_tarot_result.dart';

import '../../data/models/content_input_argument.dart';
import 'content_purchased_result_screen.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, this.contentResultArguments});

  final ContentResultArguments? contentResultArguments;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState
    extends PageStateful<ResultScreen, ContentPurchasedBloc> {
  late ScrollController _scrollController;
  late ContentResult result;
  late bool isLike;
  late List<AppMainContent> listRecommend;
  late dynamic tarotList;
  Color buttonColor = AppColors.neutral03;

  handleAdLoaded() {
    setState(() {
      if (buttonColor == AppColors.neutral03) {
        buttonColor = AppColors.white;
      } else {
        buttonColor = AppColors.neutral03;
      }
    });
  }

  void handleUserEarnedReward(user) {
    MainBloc.authBloc.userWatchAds(user: user, isPageResultWatchAds: true);
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    if (widget.contentResultArguments != null) {
      result = widget.contentResultArguments!.contentResult;
      tarotList = widget.contentResultArguments!.tarotList;
      isLike = widget.contentResultArguments!.checkLiked;
    }

    super.initState();
  }

  @override
  void afterFirstBuild(BuildContext context) {
    bloc.checkLike(result.content.id);
    bloc.getUserInfo(result.content.id);
    bloc.add(LoadFeedback(result.content.id));
    bloc.loadShareLink(result.purchase.id);
    super.afterFirstBuild(context);
  }

  @override
  Widget buildPage(BuildContext context, ContentPurchasedBloc bloc) {
    AuthenticationBloc authenticationBloc = context.watch<AuthenticationBloc>();
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppHeader(
        context,
        titleText: result.content.name,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            result.content.type.id == 1
                ? FormSajuResult(contentResult: result, isLiked: isLike)
                : const SizedBox(),
            result.content.type.id == 2
                ? FormJuyeogResult(
                    contentResult: result,
                  )
                : const SizedBox(),
            result.content.type.id == 3
                ? tarotList != null
                    ? FormTarotResult(
                        listTarots: tarotList!,
                        contentResult: result,
                        onScrollCallback: () {
                          setState(() {
                            _scrollController.animateTo(
                              _scrollController.position.minScrollExtent,
                              curve: Curves.easeOut,
                              duration: const Duration(milliseconds: 500),
                            );
                          });
                        },
                      )
                    : const SizedBox()
                : const SizedBox(),
            AppSize.space15.verticalSpace,
            Text(
              LocaleKeys.content_detail_result_share_desc.tr(),
              style: AppStyles.text14.preReg
                  .copyWith(color: AppColors.black.withOpacity(0.5)),
            ),
            AppSize.spaceBetweenWidgetExtraSmall.verticalSpace,
            authenticationBloc.state.user != null
                ? Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSize.paddingWithScreen),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppButton(
                          text: LocaleKeys.button_share.tr(),
                          type: ButtonType.outline,
                          textStyle: AppStyles.text18.preMed
                              .copyWith(color: AppColors.black),
                          colorBorder: AppColors.black.withOpacity(0.08),
                          onClicked: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return WShareDialog(
                                    content: LocaleKeys
                                        .content_detail_result_share_dialog_content
                                        .tr(),
                                    onKakaoClicked: () async {
                                      Navigator.pop(context);
                                      bool checkIns = await ShareClient.instance
                                          .isKakaoTalkSharingAvailable();
                                      if (checkIns) {
                                        try {
                                          var link = await DeepLinkService()
                                              .createDeeplink(
                                                  result.purchase.id.toString(),
                                                  bloc.state.shareLink);

                                          DeepLinkService().shareToKakao(
                                              link,
                                              result.content.name ?? "",
                                              "${MainBloc.authBloc.state.user!.name}님이 보라에서 ${result.content.name}에 관한 이야기를 펼쳐보았어요. 같이 보러가실래요?",
                                              (bloc.state.content != null &&
                                                      bloc.state.content!
                                                              .banner !=
                                                          null)
                                                  ? bloc.state.content!
                                                          .banner ??
                                                      "${AppConfig.instance.env.siteUrl}assets/contents/thumbnail/default_thumbnail_rectangle.png"
                                                  : "${AppConfig.instance.env.siteUrl}assets/contents/thumbnail/default_thumbnail_rectangle.png");
                                          print(
                                              'Succeeded in Kakao Talk Sharing.');
                                        } catch (error) {
                                          print(
                                              'Kakao Talk Sharing failed. $error');
                                        }
                                      } else {
                                        // If Kakao Talk is not installed, we recommend sending the Kakao Talk Sharing message via web.

                                        try {
                                          await launchUrl(
                                            Uri.parse(Platform.isAndroid
                                                ? "https://play.google.com/store/apps/details?id=com.kakao.talk&hl=en&gl=US&pli=1"
                                                : "https://apps.apple.com/us/app/kakaotalk/id362057947"),
                                          );
                                        } catch (error) {
                                          print(
                                              'Kakao Talk Sharing failed. $error');
                                        }
                                      }
                                    },
                                    onShareLinkClicked: () async {
                                      var link = await DeepLinkService()
                                          .createDeeplink(
                                              result.purchase.id.toString(),
                                              bloc.state.shareLink);
                                      Navigator.pop(context);
                                      FlutterClipboard.copy(link.toString())
                                          .then((value) => UiUtils.showInfoSnackBar(
                                              context,
                                              message: LocaleKeys
                                                  .content_detail_result_share_message
                                                  .tr(),
                                              position:
                                                  FlushbarPosition.BOTTOM))
                                          .onError((error, stackTrace) =>
                                              print(error));
                                    },
                                  );
                                });
                          },
                        ),
                        AppSize.space15.verticalSpace,
                        (authenticationBloc.state.user!.pageResultWatchAd !=
                                    null &&
                                authenticationBloc
                                        .state.user!.pageResultWatchAd ==
                                    false)
                            ? RewardedAdmob(
                                userId: authenticationBloc.state.user!.id,
                                adUnitId: AdUnitId(
                                    android: AppAdUnitId.freeCoinTabAndroid,
                                    iOS: AppAdUnitId.freeCoinTabiOS),
                                button: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          AppSize.spaceBetweenWidgetMedium),
                                  decoration: BoxDecoration(
                                    color: buttonColor,
                                    border: Border.all(
                                      width: AppSize.borderWidth,
                                      color: AppColors.black.withOpacity(0.08),
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        AppSize.mediumRadius),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(AppImages.icCurrency),
                                      AppSize.space15.horizontalSpace,
                                      Text(
                                        LocaleKeys.content_result_get_coin_free
                                            .tr(),
                                        style: AppStyles.text18.preMed
                                            .copyWith(color: AppColors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                onAdLoaded: handleAdLoaded,
                                onUserEarnedReward: () =>
                                    handleUserEarnedReward(
                                        authenticationBloc.state.user),
                                customData: '{"RESULT_PAGE_WATCH_ADS": true}',
                              )
                            : const SizedBox(
                                height: 0,
                              ),
                        // AppSize.space15.verticalSpace,
                        // Text(
                        //     LocaleKeys.content_detail_result_share_suggest.tr(
                        //         args: [
                        //           result.content.name
                        //         ]), //'방금 보신 <${result.content.name}> 콘텐츠는 어떠셨나요?',
                        //     style: AppStyles.text16.preBold
                        //         .copyWith(color: AppColors.black)),
                        // BlocBuilder<AuthenticationBloc, AuthenticationState>(
                        //     builder: (context, state) {
                        //   return Text(
                        //     LocaleKeys.content_detail_result_share_please
                        //         .tr(args: [state.user?.name ?? ""]),
                        //     style: AppStyles.text16.preBold
                        //         .copyWith(color: AppColors.black),
                        //   );
                        // }),
                      ],
                    ))
                : Container(),
            // AppSize.space32.verticalSpace,
            // BlocProvider(
            //   create: (context) => FeedbackBloc(),
            //   child: FormFeedback(
            //     contentId: result.content.id,
            //     purchaseId: result.purchase.id,
            //   ),
            // ),
            AppSize.space32.verticalSpace,
            BlocProvider(
              create: (context) => RecommendBloc(),
              child: const FormRecommend(),
            ),
            AppSize.spaceBetweenBottomBar.verticalSpace,
          ],
        ),
      ),
    );
  }
}
