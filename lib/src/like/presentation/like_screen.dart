import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/app_base/models/ad_unit_id_model.dart';
import 'package:borra_app/common/pages/p_stateful.dart';
import 'package:borra_app/common/widgets/app_header.dart';
import 'package:borra_app/common/widgets/loading/app_loading.dart';
import 'package:borra_app/common/admob/banner_ad.dart';
import 'package:borra_app/src/like/business_logic/like_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../app_base/config/app_config.dart';
import '../../../app_base/constants/ad_unit_id.dart';
import 'widgets/w_main_content.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({super.key});

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends PageStateful<LikeScreen, LikeBloc> {
  @override
  void afterFirstBuild(BuildContext context) {
    super.afterFirstBuild(context);
    bloc.initial();
  }

  @override
  Widget buildPage(BuildContext context, LikeBloc bloc) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        // appBar: AppHeader(
        //   context,
        //   titleText: LocaleKeys.favourite_title.tr(),
        //   showAction: false,
        // ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.paddingWithScreen,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.favourite_header.tr(),
                      style: AppStyles.text18.preBold,
                    ),
                    AppSize.paddingWithScreen.verticalSpace,
                    BlocBuilder<LikeBloc, LikeState>(
                      buildWhen: (previous, current) =>
                          previous.listLikedContent != current.listLikedContent,
                      builder: (context, state) {
                        if (state.listLikedContent == null) {
                          return const AppCircularLoading();
                        }
                        if (state.listLikedContent!.isEmpty) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                                vertical: AppSize.paddingWithScreen),
                            width: double.infinity,
                            child: Text(
                              LocaleKeys.common_no_content.tr(),
                              style: AppStyles.text15.preMed,
                              textAlign: TextAlign.center,
                            ),
                          );
                        }
                        return Expanded(
                          child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return WMainContentUser(
                                    likeContent:
                                        state.listLikedContent![index]);
                              },
                              separatorBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: AppSize.space15),
                                  child: const Divider(
                                    thickness: 1,
                                  ),
                                );
                              },
                              itemCount: state.listLikedContent!.length),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            BannerAdmob(
              size: AdSize.largeBanner,
              adUnitId: AdUnitId(
                  android: AppAdUnitId.likeTabAndroid,
                  iOS: AppAdUnitId.likeTabAdiOS),
            ),
          ],
        ),
      ),
    );
  }
}
