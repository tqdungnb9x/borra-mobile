import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/app_base/services/deep_link_service.dart';
import 'package:borra_app/app_base/utils/app_utils.dart';
import 'package:borra_app/common/pages/p_stateful.dart';
import 'package:borra_app/common/widgets/app_header.dart';
import 'package:borra_app/common/widgets/dialogs/w_app_dialog.dart';
import 'package:borra_app/common/widgets/dialogs/w_share_dialog.dart';
import 'package:borra_app/src/content_feedback/business_logic/feedback/feedback_bloc.dart';
import 'package:borra_app/src/content_recommend/business_logic/recommend/recommend_bloc.dart';
import 'package:borra_app/src/content_recommend/presentation/recommend_widget.dart';
import 'package:borra_app/src/content_result/business_logic/content_result/content_result_bloc.dart';
import 'package:clipboard/clipboard.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../../app_base/config/app_routes.dart';
import '../../../../common/main_bloc.dart';
import '../../../../common/widgets/app_button.dart';
import '../../../authentication/auth/business_logic/blocs/authentication_bloc.dart';
import '../../../content_feedback/presentations/feedback_widget.dart';
import '../../data/repositories/content_detail_repo.dart';
import 'form_juyeog_result.dart';
import 'form_saju_result_replays.dart';
import 'form_tarot_result.dart';

class ContentResultReplaysArguments {
  final int id;
  final String? shareCode;
  ContentResultReplaysArguments({
    required this.id,
    this.shareCode,
  });
}

class ContentResultScreen extends StatefulWidget {
  const ContentResultScreen(
      {super.key, required this.contentId, this.shareCode});
  final int contentId;
  final String? shareCode;

  @override
  State<ContentResultScreen> createState() => _ContentResultScreenState();
}

class _ContentResultScreenState
    extends PageStateful<ContentResultScreen, ContentResultBloc> {
  late ScrollController _scrollController;
  final ContentResultRepository repo = ContentResultRepository();
  @override
  void afterFirstBuild(BuildContext context) {
    bloc.initial(widget.contentId, widget.shareCode);
    _scrollController = ScrollController();
    super.afterFirstBuild(context);
  }

  @override
  Widget buildPage(BuildContext context, ContentResultBloc bloc) {
    AuthenticationBloc authenticationBloc = context.watch<AuthenticationBloc>();
    return BlocListener<ContentResultBloc, ContentResultState>(
      listener: (context, state) {
        state.status.whenOrNull(
          idle: () {
            showLoading(context, false);
          },
          loading: () {
            showLoading(context, true);
          },
          success: (data) {
            showLoading(context, false);
          },
          failure: (error) async {
            showLoading(context, false);
            showDialog(
                context: context,
                builder: (context) {
                  return WAppDialog(
                    content:
                        LocaleKeys.content_detail_replay_expired_message.tr(),
                    onActionProceed: () {
                      Navigator.pop(context);
                    },
                  );
                });
          },
        );
      },
      listenWhen: (previous, current) => previous.status != current.status,
      child: BlocBuilder<ContentResultBloc, ContentResultState>(
        buildWhen: (previous, current) =>
            previous.contentResult != current.contentResult,
        builder: (context, state) {
          var result = state.contentResult;
          if (result == null) {
            return Scaffold(
              appBar: AppHeader(
                context,
                titleText: '',
              ),
            );
          }
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
                        ? FormSajuResultReplays(
                            contentResult: result,
                            isLiked: false,
                          )
                        : const SizedBox(),
                    result.content.type.id == 2
                        ? FormJuyeogResult(
                            contentResult: result,
                          )
                        : const SizedBox(),
                    result.content.type.id == 3
                        ? state.tarotList != null
                            ? FormTarotResult(
                                listTarots: state.tarotList!,
                                contentResult: result,
                                onScrollCallback: () {
                                  setState(() {
                                    _scrollController.animateTo(
                                      _scrollController
                                          .position.minScrollExtent,
                                      curve: Curves.easeOut,
                                      duration:
                                          const Duration(milliseconds: 500),
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
                    widget.shareCode != null
                        ? authenticationBloc.state.user != null
                            ? InkWell(
                                onTap: () => Navigator.pushNamed(
                                    context, AppRoutesMain.contentDetail,
                                    arguments: result.content.id),
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: AppSize.paddingWithScreen),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(
                                            vertical: AppSize
                                                .spaceBetweenWidgetMedium,
                                            horizontal: 10.r),
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          border: Border.all(
                                              width: AppSize.borderWidth,
                                              color: AppColors.black
                                                  .withOpacity(0.08)),
                                          borderRadius: BorderRadius.circular(
                                              AppSize.mediumRadius),
                                        ),
                                        child: Text(
                                          "${result.content.name} 보러 가기",
                                          textAlign: TextAlign.center,
                                          style: AppStyles.text16.preMed
                                              .copyWith(color: AppColors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppSize.paddingWithScreen),
                                child: const AppButton(
                                  text: '간편 가입하고 광고 보기',
                                  type: ButtonType.kakao,
                                ),
                              )
                        : AppButton(
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
                                        bool checkIns = await ShareClient
                                            .instance
                                            .isKakaoTalkSharingAvailable();
                                        if (checkIns) {
                                          try {
                                            var link = await DeepLinkService()
                                                .createDeeplink(
                                                    (bloc.state.contentResult
                                                            ?.purchase.id
                                                            .toString() ??
                                                        ""),
                                                    bloc.state.shareLink);

                                            DeepLinkService().shareToKakao(
                                                link,
                                                result.content.name ?? "",
                                                "${MainBloc.authBloc.state.user!.name}님이 보라에서 ${result.content.name}에 관한 이야기를 펼쳐보았어요. 같이 보러가실래요?",
                                                bloc.state.contentResult!
                                                            .content.banner !=
                                                        null
                                                    ? bloc
                                                            .state
                                                            .contentResult!
                                                            .content
                                                            .banner["path"] ??
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
                                                bloc.state.contentResult
                                                        ?.purchase.id
                                                        .toString() ??
                                                    "",
                                                bloc.state.shareLink);
                                        Navigator.pop(context);
                                        FlutterClipboard.copy(link.toString())
                                            .then((value) =>
                                                UiUtils.showInfoSnackBar(
                                                    context,
                                                    message: LocaleKeys
                                                        .content_detail_result_share_message
                                                        .tr(),
                                                    position: FlushbarPosition
                                                        .BOTTOM))
                                            .onError((error, stackTrace) =>
                                                print(error));
                                      },
                                    );
                                  });
                            },
                          ),
                    AppSize.space32.verticalSpace,
                    BlocProvider(
                      create: (context) => RecommendBloc(),
                      child: const FormRecommend(),
                    ),
                    AppSize.spaceBetweenBottomBar.verticalSpace,
                  ],
                )),
          );
        },
      ),
    );
  }
}
