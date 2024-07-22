import 'package:borra_app/app_base/config/app_config.dart';
import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/common/main_bloc.dart';
import 'package:borra_app/common/pages/p_stateful.dart';
import 'package:borra_app/common/widgets/app_header.dart';
import 'package:borra_app/src/home/business_logic/blocs/home_bloc.dart';
import 'package:borra_app/src/home/presentation/screens/banner_screen.dart';
import 'package:borra_app/src/home/presentation/screens/hottest_contents_screen.dart';
import 'package:borra_app/src/home/presentation/screens/search_screen.dart';
import 'package:borra_app/src/home/presentation/widgets/w_tarot_today.dart';
import 'package:borra_app/src/home/presentation/widgets/w_user_word.dart';
import 'package:borra_app/src/hot_content/data/models/category.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_base/config/app_routes.dart';
import '../../../../common/widgets/dialogs/w_app_dialog.dart';
import '../../../../common/widgets/w_media.dart';
import '../widgets/w_footer_info_row.dart';
import '../widgets/w_section_header.dart';
import '../widgets/w_side_menu.dart';
import 'interest_by_tag_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends PageStateful<HomeScreen, HomeBloc> {
  ScrollController? _scrollController;
  double height = 230;
  bool lastStatus = true;
  int bannerIndex = 1;
  String encryptor = "";
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  bool get _isShrink {
    return _scrollController != null &&
        _scrollController!.hasClients &&
        _scrollController!.offset > (height - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void afterFirstBuild(BuildContext context) {
    if (MainBloc.authBloc.state.user != null &&
        MainBloc.authBloc.state.user!.isAgree == 0) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return WAppDialog(
            content: LocaleKeys.my_account_register_user_guild_content.tr(),
            actionString: LocaleKeys.app_dialog_confirm_title.tr(),
            onActionProceed: () {
              Navigator.pushNamed(context, AppRoutesMain.register);
            },
          );
        },
      );
    }
    bloc.initial();

    super.afterFirstBuild(context);
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_scrollListener);
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget buildPage(BuildContext context, HomeBloc bloc) {
    return SafeArea(
      top: true,
      child: Scaffold(
        key: scaffoldKey,
        // appBar: AppHeader(
        //   context,
        //   showLeading: true,
        //   leadingClicked: () => scaffoldKey.currentState?.openDrawer(),
        //   onTitleClicked: () => bloc.add(const ActiveSearch(false)),
        //   actionWidgets: [
        //     Padding(
        //       padding: EdgeInsets.only(right: AppSize.spaceBetweenWidgetMedium),
        //       child: InkWell(onTap: () {
        //         // if(bloc.state)
        //         bloc.add(ActiveSearch(!bloc.state.isActiveSearch));
        //       }, child: BlocBuilder<HomeBloc, HomeState>(
        //         builder: (context, state) {
        //           return state.isActiveSearch
        //               ? const Icon(Icons.close)
        //               : SvgWidget.asset(AppImages.icSearch);
        //         },
        //       )),
        //     ),
        //   ],
        // ),
        // drawer: WSideMenu(scaffoldKey: scaffoldKey),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            // if (state.isActiveSearch) {
            //   return const SearchScreen();
            // }
            return Column(
              children: [
                // WHomeHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BannerScreen(),
                        AppSize.spaceBetweenWidgetExtraLarge.verticalSpace,
                        //Hot content
                        const HottestContentScreen(),
                        AppSize.spaceBetweenWidgetExtraLarge.verticalSpace,
                        const WUserWord(),
                        AppSize.spaceBetweenWidgetExtraLarge.verticalSpace,
                        BlocBuilder<HomeBloc, HomeState>(
                          buildWhen: (previous, current) =>
                              previous.listTarotToday != current.listTarotToday,
                          builder: (context, state) {
                            if (state.listTarotToday == null) {
                              return Container();
                            }
                            return Column(
                              children: [
                                Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: AppSize.paddingWithScreen,
                                      vertical: AppSize.paddingWithScreen,
                                    ),
                                    child: WSectionHeader(
                                        headerTitle: LocaleKeys
                                            .home_today_horoscope_section_header
                                            .tr())),
                                SingleChildScrollView(
                                  clipBehavior: Clip.none,
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: AppSize.paddingWithScreen),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: state.listTarotToday!
                                        .map((e) => Padding(
                                              padding: EdgeInsets.only(
                                                  right: AppSize
                                                      .spaceBetweenWidgetMedium),
                                              child: WTarotToday(tarotToday: e),
                                            ))
                                        .toList(),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        AppSize.spaceBetweenWidgetExtraLarge.verticalSpace,
                        // BlocBuilder<HomeBloc, HomeState>(
                        //   buildWhen: (previous, current) =>
                        //       previous.listTarotFree != current.listTarotFree,
                        //   builder: (context, state) {
                        //     if (state.listTarotFree == null) return Container();
                        //     return Column(
                        //       children: [
                        //         Container(
                        //           padding: EdgeInsets.symmetric(
                        //             horizontal: AppSize.paddingWithScreen,
                        //             vertical: AppSize.paddingWithScreen,
                        //           ),
                        //           child: WSectionHeader(
                        //             headerTitle: LocaleKeys
                        //                 .home_wait_free_section_header
                        //                 .tr(),
                        //             onFunctionTitleClick: () =>
                        //                 Navigator.pushNamed(context,
                        //                     AppRoutesMain.contentCategoryList,
                        //                     arguments:
                        //                         const ContentCategory(id: 8)),
                        //           ),
                        //         ),
                        //         SingleChildScrollView(
                        //           scrollDirection: Axis.horizontal,
                        //           clipBehavior: Clip.none,
                        //           padding: EdgeInsets.symmetric(
                        //               horizontal: AppSize.paddingWithScreen),
                        //           child: Row(
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.start,
                        //             children: state.listTarotFree!
                        //                 .map((e) => Padding(
                        //                       padding: EdgeInsets.only(
                        //                           right: AppSize
                        //                               .spaceBetweenWidgetMedium),
                        //                       child: WTarotToday(tarotToday: e),
                        //                     ))
                        //                 .toList(),
                        //           ),
                        //         ),
                        //       ],
                        //     );
                        //   },
                        // ),
                        // AppSize.spaceBetweenWidgetExtraLarge.verticalSpace,
                        //List tags
                        InterestByTagScreen(),
                        AppSize.spaceBetweenWidgetExtraLarge.verticalSpace,
                        // BlocBuilder<HomeBloc, HomeState>(
                        //   buildWhen: (previous, current) =>
                        //       previous.listTarotFirstFree !=
                        //       current.listTarotFirstFree,
                        //   builder: (context, state) {
                        //     if (state.listTarotFree == null) return Container();
                        //     return Column(
                        //       children: [
                        //         Container(
                        //           padding: EdgeInsets.symmetric(
                        //             horizontal: AppSize.paddingWithScreen,
                        //             vertical: AppSize.paddingWithScreen,
                        //           ),
                        //           child: WSectionHeader(
                        //             headerTitle: LocaleKeys
                        //                 .home_first_free_section_header
                        //                 .tr(),
                        //             onFunctionTitleClick: () =>
                        //                 Navigator.pushNamed(context,
                        //                     AppRoutesMain.contentCategoryList,
                        //                     arguments:
                        //                         const ContentCategory(id: 9)),
                        //           ),
                        //         ),
                        //         SingleChildScrollView(
                        //           scrollDirection: Axis.horizontal,
                        //           clipBehavior: Clip.none,
                        //           padding: EdgeInsets.symmetric(
                        //               horizontal: AppSize.paddingWithScreen),
                        //           child: Row(
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.start,
                        //             children: state.listTarotFirstFree!
                        //                 .map((e) => Padding(
                        //                       padding: EdgeInsets.only(
                        //                           right: AppSize
                        //                               .spaceBetweenWidgetMedium),
                        //                       child: WTarotFree(tarotToday: e),
                        //                     ))
                        //                 .toList(),
                        //           ),
                        //         ),
                        //       ],
                        //     );
                        //   },
                        // ),
                        // AppSize.spaceBetweenWidgetExtraLarge.verticalSpace,
                        // BlocBuilder<HomeBloc, HomeState>(
                        //   buildWhen: (previous, current) =>
                        //       previous.listTarotMainFree !=
                        //       current.listTarotMainFree,
                        //   builder: (context, state) {
                        //     if (state.listTarotMainFree == null) {
                        //       return Container();
                        //     }
                        //     return Column(
                        //       children: [
                        //         Container(
                        //           padding: EdgeInsets.symmetric(
                        //             horizontal: AppSize.paddingWithScreen,
                        //             vertical: AppSize.paddingWithScreen,
                        //           ),
                        //           child: WSectionHeader(
                        //             headerTitle: LocaleKeys
                        //                 .home_always_free_section_header
                        //                 .tr(),
                        //             onFunctionTitleClick: () =>
                        //                 Navigator.pushNamed(context,
                        //                     AppRoutesMain.freeContentList),
                        //           ),
                        //         ),
                        //         SingleChildScrollView(
                        //           scrollDirection: Axis.horizontal,
                        //           clipBehavior: Clip.none,
                        //           padding: EdgeInsets.symmetric(
                        //               horizontal: AppSize.paddingWithScreen),
                        //           child: Row(
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.start,
                        //             children: state.listTarotMainFree!
                        //                 .map((e) => Padding(
                        //                       padding: EdgeInsets.only(
                        //                           right: AppSize
                        //                               .spaceBetweenWidgetMedium),
                        //                       child: WTarotFree(tarotToday: e),
                        //                     ))
                        //                 .toList(),
                        //           ),
                        //         ),
                        //       ],
                        //     );
                        //   },
                        // ),
                        // AppSize.spaceBetweenWidgetExtraLarge.verticalSpace,

                        ///Company info
                        Container(
                          height: 316.h,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSize.paddingWithScreen,
                              vertical: 36.h),
                          color: AppColors.homeFooterBg,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                    text:
                                        '${LocaleKeys.home_company_info_privacy_policy.tr()}  |  ',
                                    style: AppStyles.text12.preSemiBold
                                        .copyWith(
                                            color:
                                                AppColors.homeFooterTextColor),
                                    mouseCursor: SystemMouseCursors.precise,
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => Navigator.pushNamed(
                                          context, AppRoutesMain.privacyPolicy),
                                    children: [
                                      TextSpan(
                                        text: LocaleKeys.home_company_info_term
                                            .tr(),
                                        style: AppStyles.text12.preReg.copyWith(
                                            color:
                                                AppColors.homeFooterTextColor),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () => Navigator.pushNamed(
                                              context,
                                              AppRoutesMain.noticeContentDetail,
                                              arguments: 17),
                                      )
                                    ]),
                              ),
                              AppSize
                                  .spaceBetweenWidgetExtraLarge.verticalSpace,
                              const Divider(
                                color: AppColors.homeFooterTextColor,
                              ),
                              AppSize
                                  .spaceBetweenWidgetExtraLarge.verticalSpace,
                              Text(
                                LocaleKeys.home_company_info_company_name.tr(),
                                style: AppStyles.text12.preReg.copyWith(
                                    color: AppColors.homeFooterTextColor),
                              ),
                              FooterInfoRow(
                                title:
                                    LocaleKeys.home_company_info_address.tr(),
                                content: LocaleKeys
                                    .home_company_info_company_add
                                    .tr(),
                              ),
                              FooterInfoRow(
                                title: LocaleKeys
                                    .home_company_info_representative
                                    .tr(),
                                content:
                                    LocaleKeys.home_company_info_ceo_name.tr(),
                              ),
                              FooterInfoRow(
                                title: LocaleKeys
                                    .home_company_info_registration_number
                                    .tr(),
                                content:
                                    LocaleKeys.home_company_info_number.tr(),
                              ),
                              FooterInfoRow(
                                title:
                                    LocaleKeys.home_company_info_sale_tel.tr(),
                                content: LocaleKeys.home_company_info_tel_number
                                    .tr(),
                              ),
                              FooterInfoRow(
                                title: LocaleKeys
                                    .home_company_info_customer_service
                                    .tr(),
                                content: '02-6956-5671 , fles@fles.co.kr',
                              ),
                              const FooterInfoRow(
                                title: 'FAX',
                                content: '02-6956-5672',
                              ),
                            ],
                          ),
                        ),
                        // AppSize.spaceBetweenBottomBar.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
