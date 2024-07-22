import 'package:borra_app/app_base/config/app_config.dart';
import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/app_base/utils/app_utils.dart';
import 'package:borra_app/common/main_bloc.dart';
import 'package:borra_app/common/pages/p_stateful.dart';
import 'package:borra_app/common/widgets/app_header.dart';
import 'package:borra_app/src/content_detail/business_logic/content_detail/content_detail_bloc.dart';
import 'package:borra_app/src/content_detail/presentation/screens/form_juyeog.dart';
import 'package:borra_app/src/content_detail/presentation/screens/form_saju.dart';
import 'package:borra_app/src/content_detail/presentation/screens/form_tarot.dart';
import 'package:borra_app/src/home/presentation/widgets/w_tag_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app_base/constants/ad_unit_id.dart';
import '../../../../app_base/models/ad_unit_id_model.dart';
import '../../../../common/admob/rewarded_ad.dart';
import '../../../../common/widgets/app_image.dart';
import '../../../authentication/auth/business_logic/blocs/authentication_bloc.dart';
import '../../../home/data/models/tag.dart';

class ContentDetailScreen extends StatefulWidget {
  const ContentDetailScreen({super.key, required this.contentId});
  final int contentId;
  @override
  State<ContentDetailScreen> createState() => _ContentDetailScreenState();
}

class _ContentDetailScreenState
    extends PageStateful<ContentDetailScreen, ContentDetailBloc> {
  @override
  void afterFirstBuild(BuildContext context) {
    super.afterFirstBuild(context);
    bloc.initial(widget.contentId);
  }

  @override
  void dispose() {
    MainBloc.appBloc.setDetailIsOpen(false);
    super.dispose();
  }

  void handleUserEarnedReward(user) {
    MainBloc.authBloc.userWatchAds(user: user, isPageResultWatchAds: true);
  }

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

  @override
  Widget buildPage(BuildContext context, ContentDetailBloc bloc) {
    final double bannerHeight = 202.h;
    final double iconSize = 28.r;
    AuthenticationBloc authenticationBloc = context.watch<AuthenticationBloc>();

    return BlocListener<ContentDetailBloc, ContentDetailState>(
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
          },
        );
      },
      listenWhen: (previous, current) => previous.status != current.status,
      child: BlocBuilder<ContentDetailBloc, ContentDetailState>(
        builder: (context, state) {
          List<AppTag> tempList = [];
          if (state.content == null) {
            return Scaffold(
              appBar: AppHeader(
                context,
              ),
            );
          }
          if (state.content!.tags.length > 3) {
            tempList = state.content!.tags.sublist(0, 3);
          } else {
            tempList.addAll(state.content!.tags);
          }
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppHeader(
              context,
              titleText: state.content!.name,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: bannerHeight,
                    width: double.infinity,
                    child: AppImage(
                      imageUrl:
                          state.content!.banner ?? AppImages.imgDefaultImage,
                    ),
                  ),
                  AppSize.spaceBetweenWidgetLarge.verticalSpace,
                  //Summmary, content
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.paddingWithScreen,
                    ),
                    child: Text(
                      StringUtils.convertHtmlToText(state.content!.contents),
                      style: AppStyles.text14.preLight,
                    ),
                  ),
                  //Tags, Like and share
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.paddingWithScreen,
                      vertical: AppSize.paddingWithScreen,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        state.content!.tags.isNotEmpty
                            ? WTagList(
                                listTag: tempList,
                                onSelectedTag: (AppTag value) {},
                                userTags: [],
                              )
                            : const SizedBox.shrink(),
                        BlocBuilder<ContentDetailBloc, ContentDetailState>(
                          builder: (context, state) {
                            return Row(
                              children: [
                                state.isLiked
                                    ? Container(
                                        padding: EdgeInsets.all(7.r),
                                        height: iconSize,
                                        width: iconSize,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: AppColors.black
                                                  .withOpacity(0.06),
                                            ),
                                            shape: BoxShape.circle),
                                        child: SvgPicture.asset(
                                          AppImages.icLikeFill,
                                        ),
                                      )
                                    : SvgPicture.asset(
                                        AppImages.icLikeOutline,
                                        height: iconSize,
                                        width: iconSize,
                                      ),
                                AppSize.spaceBetweenWidgetSmall.horizontalSpace,
                                Text(
                                  state.content!.likeCount.toString(),
                                  style: AppStyles.text12.preMed,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(14.r),
                                  child: Container(
                                    width: 1.r,
                                    height: 9.r,
                                    decoration: BoxDecoration(
                                        color: AppColors.black.withOpacity(.2)),
                                  ),
                                ),
                                SvgPicture.asset(
                                  AppImages.icShareOutline,
                                  height: iconSize,
                                  width: iconSize,
                                ),
                                AppSize.spaceBetweenWidgetSmall.horizontalSpace,
                                Text(
                                  state.content!.shareCount.toString(),
                                  style: AppStyles.text12.preMed,
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: AppColors.dividerColor,
                    thickness: 1,
                  ),
                  if (state.content!.type.id == 1)
                    FormSaju(content: state.content!),
                  if (state.content!.type.id == 2)
                    FormJuyeog(content: state.content!),
                  if (state.content!.type.id == 3)
                    FormTarot(content: state.content!),
                  AppSize.space15.verticalSpace,
                  authenticationBloc.state.user != null
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSize.paddingWithScreen),
                          child: (authenticationBloc
                                          .state.user!.pageResultWatchAd !=
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
                                        color:
                                            AppColors.black.withOpacity(0.08),
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          AppSize.mediumRadius),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(AppImages.icCurrency),
                                        AppSize.space15.horizontalSpace,
                                        Text(
                                          LocaleKeys
                                              .content_result_get_coin_free
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
                        )
                      : const SizedBox(),

                  AppSize.spaceBetweenBottomBar.verticalSpace,
                ],
              ),
            ),
          );
        },
        buildWhen: (previous, current) => previous.content != current.content,
      ),
    );
  }
}
