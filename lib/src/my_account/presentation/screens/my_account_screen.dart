import 'package:borra_app/app_base/config/app_routes.dart';
import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/app_base/models/ad_unit_id_model.dart';
import 'package:borra_app/common/pages/p_stateful.dart';
import 'package:borra_app/common/widgets/app_header.dart';
import 'package:borra_app/common/widgets/loading/app_loading.dart';
import 'package:borra_app/common/admob/banner_ad.dart';
import 'package:borra_app/src/home/presentation/widgets/w_section_header.dart';
import 'package:borra_app/src/home/presentation/widgets/w_tarot_today.dart';
import 'package:borra_app/src/home/presentation/widgets/w_user_word.dart';
import 'package:borra_app/src/my_account/presentation/widgets/account_header.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../../app_base/constants/ad_unit_id.dart';
import '../../../content_result/presentation/screens/content_result_screen.dart';
import '../../business_logic/account_bloc.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends PageStateful<MyAccountScreen, AccountBloc> {
  @override
  void afterFirstBuild(BuildContext context) {
    bloc.initial();
    super.afterFirstBuild(context);
    setState(() {});
  }

  @override
  Widget buildPage(BuildContext context, AccountBloc bloc) {
    final double bannerHeight = 202.h;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        // appBar: AppHeader(
        //   context,
        //   titleText: LocaleKeys.dashboard_my_account.tr(),
        //   showAction: false,
        // ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const WAccountHeader(),
                    AppSize.spaceBetweenWidgetExtraLarge.verticalSpace,
                    const WUserWord(),
                    Padding(
                      padding: EdgeInsets.all(
                        AppSize.paddingWithScreen,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WSectionHeader(
                            headerTitle: LocaleKeys.my_account_like_header.tr(),
                            onFunctionTitleClick: () {
                              Navigator.pushNamed(
                                  context, AppRoutesMain.userLikedList);
                            },
                          ),
                          10.verticalSpace,
                          BlocBuilder<AccountBloc, AccountState>(
                            buildWhen: (previous, current) =>
                                previous.listLikedContent !=
                                current.listLikedContent,
                            builder: (context, state) {
                              if (state.listLikedContent == null) {
                                return SizedBox(
                                  height: 180.h,
                                  child: const AppCircularLoading(),
                                );
                              }
                              if (state.listLikedContent!.isEmpty) {
                                return Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: AppSize.paddingWithScreen),
                                    width: double.infinity,
                                    child: Text(
                                      LocaleKeys.my_account_no_like.tr(),
                                      style: AppStyles.text15.preReg,
                                      textAlign: TextAlign.center,
                                    ));
                              }
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: state.listLikedContent!
                                      .map((e) => Padding(
                                            padding: EdgeInsets.only(
                                                right: AppSize
                                                    .spaceBetweenWidgetMedium),
                                            child: WUserContent(
                                              userContent: e,
                                              isLiked: true,
                                            ),
                                          ))
                                      .toList(),
                                ),
                              );
                            },
                          ),
                          30.verticalSpace,
                          WSectionHeader(
                            headerTitle:
                                LocaleKeys.my_account_replay_header.tr(),
                            onFunctionTitleClick: () {
                              Navigator.pushNamed(
                                  context, AppRoutesMain.userReplayList);
                            },
                          ),
                          10.verticalSpace,
                          BlocBuilder<AccountBloc, AccountState>(
                            buildWhen: (previous, current) =>
                                previous.listReplaysContent !=
                                current.listReplaysContent,
                            builder: (context, state) {
                              if (state.listReplaysContent == null) {
                                return SizedBox(
                                  height: 180.h,
                                  child: const AppCircularLoading(),
                                );
                              }
                              if (state.listReplaysContent!.isEmpty) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: AppSize.paddingWithScreen),
                                  width: double.infinity,
                                  child: Text(
                                    LocaleKeys.my_account_no_replay.tr(),
                                    style: AppStyles.text15.preReg,
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              }
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                clipBehavior: Clip.none,
                                child: Row(
                                  children: state.listReplaysContent!
                                      .map((e) => Padding(
                                          padding: EdgeInsets.only(
                                              right: AppSize
                                                  .spaceBetweenWidgetMedium),
                                          child: WUserContent(
                                            userContent: e,
                                            onClicked: () => Navigator.pushNamed(
                                                context,
                                                AppRoutesMain.contentResult,
                                                arguments:
                                                    ContentResultReplaysArguments(
                                                        id: e.id)),
                                            isLiked: e.isLike ?? false,
                                          )))
                                      .toList(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    55.verticalSpace,
                    InkWell(
                      onTap: () => Navigator.pushNamed(
                          context, AppRoutesMain.contentDetail,
                          arguments: 47),
                      child: SizedBox(
                        height: bannerHeight,
                        width: double.infinity,
                        child: Image.asset(
                          AppImages.imgAccountBanner,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BannerAdmob(
              size: AdSize.largeBanner,
              adUnitId: AdUnitId(
                  android: AppAdUnitId.myPageTabAndroid,
                  iOS: AppAdUnitId.myPageTabiOS),
            ),
          ],
        ),
      ),
    );
  }
}
