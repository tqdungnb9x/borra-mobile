import 'package:borra_app/app_base/constants/ad_unit_id.dart';
import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/app_base/models/ad_unit_id_model.dart';
import 'package:borra_app/src/home/presentation/widgets/w_user_info.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import '../../../../app_base/config/app_config.dart';
import '../../../../app_base/config/app_routes.dart';
import '../../../../app_base/services/in_app_review_service.dart';
import '../../../../app_base/utils/launcher_utils.dart';
import '../../../../common/main_bloc.dart';
import '../../../../common/widgets/dialogs/w_app_dialog.dart';
import '../../../../common/widgets/dialogs/w_question_dialog.dart';
import '../../../../common/admob/native_ad.dart';
import '../../../app_review/app_review_prompt.dart';
import '../../../authentication/auth/data/models/auth_status.dart';
import '../../../home_notice/data/models/notice_model.dart';
import 'w_menu_item.dart';

class WSideMenu extends StatefulWidget {
  WSideMenu({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<WSideMenu> createState() => _WSideMenuState();
}

class _WSideMenuState extends State<WSideMenu> {
  @override
  void initState() {
    // TODO: implement initState
    checkKakao();
    super.initState();
  }

  void checkKakao() async {
    print("------kakao:${await KakaoSdk.origin}");
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                horizontal: 23.r,
              ),
              children: [
                20.verticalSpace,
                Container(
                  width: 32.h,
                  height: 32.h,
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    iconSize: 25.h,
                    icon: Icon(
                      Icons.close,
                      color: AppColors.black.withOpacity(.32),
                    ),
                    onPressed: () {
                      widget.scaffoldKey.currentState!.closeDrawer();
                    },
                  ),
                ),
                20.verticalSpace,
                if (MainBloc.authBloc.state.authStatus ==
                    const AuthStatus.unauthenticated()) ...[
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutesMain.signIn);
                      widget.scaffoldKey.currentState!.closeDrawer();
                    },
                    child: Row(
                      children: [
                        Text(
                          LocaleKeys.home_side_menu_login.tr(),
                          style: AppStyles.text24.preBold,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.black.withOpacity(.2),
                        )
                      ],
                    ),
                  ),
                  AppSize.spaceBetweenWidgetSmall.verticalSpace,
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSize.mediumRadius,
                        vertical: AppSize.radius6),
                    decoration: BoxDecoration(
                        color: AppColors.black.withOpacity(.04),
                        borderRadius: BorderRadius.circular(AppSize.radius6)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          AppImages.imgLight,
                          height: AppSize.iconSize,
                          width: AppSize.iconSize,
                        ),
                        Text(
                          LocaleKeys.home_side_menu_login_desc.tr(),
                          style: AppStyles.text14,
                        )
                      ],
                    ),
                  )
                ] else ...[
                  WUserInfo(
                    user: MainBloc.authBloc.state.user!,
                    listTags: MainBloc.appBloc.state.listTags,
                  )
                ],
              ],
            ),
            AppSize.spaceBetweenWidgetExtraMedium.verticalSpace,
            NativeAdmob(
              templateType: TemplateType.small,
              adUnitId: AdUnitId(
                  android: AppAdUnitId.homepageSideBarAndroid,
                  iOS: AppAdUnitId.homepageSideBariOS),
            ),
            AppSize.spaceBetweenWidgetExtraMedium.verticalSpace,
            Divider(
              color: AppColors.black.withOpacity(.08),
              thickness: 1,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: AppSize.spaceBetweenWidgetExtraLarge,
                left: 23.r,
                right: AppSize.paddingWithScreen,
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      WMenuItem(
                        title: LocaleKeys.home_side_menu_my_coin.tr(),
                        icon: AppImages.icWallet,
                        onTap: () {
                          if (MainBloc.authBloc.state.authStatus ==
                              const AuthStatus.unauthenticated()) {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return WAppDialog(
                                  content:
                                      LocaleKeys.app_dialog_login_required.tr(),
                                  onActionProceed: () {
                                    Navigator.pushNamed(
                                        context, AppRoutesMain.signIn);
                                  },
                                );
                              },
                            );
                          } else {
                            Navigator.pushNamed(
                                context, AppRoutesMain.accountPayment);
                            widget.scaffoldKey.currentState?.closeDrawer();
                          }
                        },
                      ),
                      40.verticalSpace,
                      WMenuItem(
                        title: LocaleKeys.home_side_menu_announcement.tr(),
                        icon: AppImages.icReport,
                        onTap: () {
                          widget.scaffoldKey.currentState?.closeDrawer();
                          Navigator.pushNamed(
                              context, AppRoutesMain.noticeContentList);
                        },
                      ),
                      40.verticalSpace,
                      WMenuItem(
                        title: 'FAQ',
                        icon: AppImages.icFAQ,
                        onTap: () {
                          widget.scaffoldKey.currentState?.closeDrawer();
                          Navigator.pushNamed(
                              context, AppRoutesMain.favouriteQuestion);
                        },
                      ),
                      40.verticalSpace,
                      WMenuItem(
                        title: LocaleKeys.home_side_menu_contact_kakao.tr(),
                        icon: AppImages.icChat,
                        onTap: () {
                          UrlLauncherUtils.launcher(
                              value: AppConfig.instance.env.kakaoTalk);
                          widget.scaffoldKey.currentState?.closeDrawer();
                        },
                      ),
                      40.verticalSpace,
                      InkWell(
                        onTap: () => _showDialogAppReview(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AppImages.imgReviewRating,
                                  height: AppSize.iconMedium,
                                  width: AppSize.iconMedium,
                                ),
                                AppSize.spaceBetweenWidgetExtraMedium
                                    .horizontalSpace,
                                Text(
                                  LocaleKeys.home_side_menu_review.tr(),
                                  style: AppStyles.text16,
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.r,
                              color: AppColors.black.withOpacity(.5),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // const Spacer(),
            15.verticalSpace,
            if (MainBloc.authBloc.state.authStatus !=
                const AuthStatus.unauthenticated()) ...[
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(
                    right: AppSize.paddingWithScreen, bottom: AppSize.space50),
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return WQuestionDialog(
                              content:
                                  LocaleKeys.app_dialog_logout_question.tr(),
                              actionString: LocaleKeys.button_yes.tr(),
                              cancelString: LocaleKeys.button_no.tr(),
                              onConfirmClicked: () {
                                MainBloc.authBloc.logOut();
                              });
                        });
                  },
                  child: Text(
                    LocaleKeys.home_side_menu_logout.tr(),
                    style: AppStyles.text14.preMed
                        .copyWith(color: AppColors.black.withOpacity(0.5)),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  _showDialogAppReview(BuildContext context) {
    InAppReviewService().openStoreListing();
  }
}
