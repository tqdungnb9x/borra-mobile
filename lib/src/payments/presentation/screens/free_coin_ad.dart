import 'package:borra_app/common/admob/rewarded_ad.dart';
import 'package:borra_app/common/main_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../../app_base/constants/ad_unit_id.dart';
import '../../../../app_base/generated/locale_keys.g.dart';
import '../../../../app_base/models/ad_unit_id_model.dart';
import '../../../authentication/auth/business_logic/blocs/authentication_bloc.dart';

class FeeCoinAd extends StatefulWidget {
  const FeeCoinAd({super.key});

  @override
  State<FeeCoinAd> createState() => _FeeCoinAdState();
}

class _FeeCoinAdState extends State<FeeCoinAd> {
  Color buttonColor = AppColors.neutral03;

  handleAdLoaded() {
    setState(() {
      if (buttonColor == AppColors.neutral03) {
        buttonColor = AppColors.primary01;
      } else
        buttonColor = AppColors.neutral03;
    });
  }

  void handleUserEarnedReward(user) {
    MainBloc.authBloc.userWatchAds(user: user, isPageResultWatchAds: false);
  }

  int getRemain(int remainingWatchAd, bool isPageResultWatchAds) {
    if (isPageResultWatchAds) {
      return remainingWatchAd;
    }
    return remainingWatchAd - 1;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthenticationBloc authenticationBloc = context.watch<AuthenticationBloc>();
    int remainingView = getRemain(
        authenticationBloc.state.user!.remainingWatchAd ?? 0,
        authenticationBloc.state.user!.pageResultWatchAd ?? false);
    return Column(children: [
      Container(
        color: Colors.red,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              child: Image.asset(AppImages.freeCoinBackground),
            ),
            Column(
              children: [
                Text("하루하루",
                    textAlign: TextAlign.center,
                    style: AppStyles.text28.preMed.copyWith(
                        color: const Color(0xFF174ecb),
                        fontWeight: FontWeight.bold,
                        fontSize: 34.r,
                        height: 1)),
                Text("10코인을 무료로\n받을 수 있다?!",
                    textAlign: TextAlign.center,
                    style: AppStyles.text28.preMed.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 27.5.r,
                        height: 1.2)),
                SizedBox(height: 14.r),
                RewardedAdmob(
                  userId: authenticationBloc.state.user!.id,
                  adUnitId: AdUnitId(
                      android: AppAdUnitId.freeCoinTabAndroid,
                      iOS: AppAdUnitId.freeCoinTabiOS),
                  button: Container(
                    height: 31.r,
                    width: 117.r,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: remainingView > 0
                          ? const Color(0xff174ecb)
                          : AppColors.neutral03,
                      border: Border.all(
                        width: AppSize.borderWidth,
                        color: AppColors.black.withOpacity(0.08),
                      ),
                      borderRadius: BorderRadius.circular(AppSize.mediumRadius),
                    ),
                    child: Text(
                      "광고 보기",
                      style: AppStyles.text17.preMed.copyWith(
                          color: AppColors.whiteCoreDream,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  onAdLoaded: handleAdLoaded,
                  onUserEarnedReward: () =>
                      handleUserEarnedReward(authenticationBloc.state.user),
                  allowWatching: remainingView > 0,
                  customData: '{"RESULT_PAGE_WATCH_ADS": false}',
                ),
                SizedBox(height: 15.r),
              ],
            ),
            Positioned(
                top: 10.r,
                right: 17.r,
                child: Text(
                    "충전 가능 횟수 ${2 - remainingView}${LocaleKeys.payment_list_free_coin_per_day.tr()} / 2${LocaleKeys.payment_list_free_coin_per_day.tr()}",
                    style: AppStyles.text13.preMed.copyWith(
                        color: AppColors.black, fontWeight: FontWeight.bold))),
          ],
        ),
      ),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 30.r),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "•",
                    style: TextStyle(fontSize: 20.r),
                  ),
                  SizedBox(
                    width: 10.r,
                  ),
                  Expanded(
                    child: Text(
                      "광고 영상을 시청하시면 1 일 2 회 , 10코인을 적립하실 수 있습니다",
                      style: TextStyle(fontSize: 15.r),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.r,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "•",
                    style: TextStyle(fontSize: 20.r),
                  ),
                  SizedBox(
                    width: 10.r,
                  ),
                  Expanded(
                    child: Text(
                      "코인의 유효기간은 1 년이며 , 그이후에는 자동으로 소멸됩니다",
                      style: TextStyle(fontSize: 15.r),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.r,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "•",
                    style: TextStyle(fontSize: 20.r),
                  ),
                  SizedBox(
                    width: 10.r,
                  ),
                  Expanded(
                    child: Text(
                      "광고 영상을 일정시간 이상 시청하실경우에만 코인이 정상 지급됩니다",
                      style: TextStyle(fontSize: 15.r),
                    ),
                  ),
                ],
              ),
            ],
          ))
    ]);
  }
}
