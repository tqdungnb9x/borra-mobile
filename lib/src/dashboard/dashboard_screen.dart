import 'package:advertising_id/advertising_id.dart';
import 'package:borra_app/app_base/config/app_config.dart';
import 'package:borra_app/app_base/config/app_routes.dart';
import 'package:borra_app/app_base/constants/in_app_review_constant.dart';
import 'package:borra_app/app_base/constants/shared_pref_constant.dart';
import 'package:borra_app/app_base/generated/locale_keys.g.dart';
import 'package:borra_app/app_base/services/in_app_review_service.dart';
import 'package:borra_app/app_base/services/local/shared_preferences/app_preference.dart';
import 'package:borra_app/common/pages/p_stateful.dart';
import 'package:borra_app/common/widgets/app_header.dart';
import 'package:borra_app/common/widgets/dashboard/dashboard_bottom_navigation_bar.dart';
import 'package:borra_app/common/widgets/dashboard/dashboard_bottom_navigation_bar_item.dart';
import 'package:borra_app/common/widgets/dialogs/app_dialog.dart';
import 'package:borra_app/common/widgets/dialogs/w_app_dialog.dart';
import 'package:borra_app/src/app_review/app_review_prompt.dart';
import 'package:borra_app/src/home/business_logic/blocs/home_bloc.dart';
import 'package:borra_app/src/home/business_logic/tag_content/tag_content_bloc.dart';
import 'package:borra_app/src/home/presentation/screens/home_screen.dart';
import 'package:borra_app/src/home/presentation/screens/search_screen.dart';
import 'package:borra_app/src/home/presentation/screens/tag_all_content_screen.dart';
import 'package:borra_app/src/home/presentation/widgets/w_side_menu.dart';
import 'package:borra_app/src/hot_content/business_logic/category_bloc.dart';
import 'package:borra_app/src/hot_content/hot_content_screen.dart';
import 'package:borra_app/src/like/presentation/like_screen.dart';
import 'package:borra_app/src/my_account/business_logic/account_bloc.dart';
import 'package:borra_app/src/my_account/presentation/screens/my_account_screen.dart';
import 'package:borra_app/src/tracking_agreement/tracking_agreement.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_segment/flutter_segment.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/widgets/w_media.dart';
import '../like/business_logic/like_bloc.dart';
import 'business_logic/cubits/dashboard_cubit.dart';

class DashBoardScreen extends StatefulWidget {
  final DashboardNav? initPage;
  const DashBoardScreen({super.key, this.initPage});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState
    extends PageStateful<DashBoardScreen, DashboardCubit> {
  late PageController _pageController;
  late final List<Widget> _pages;
  late final List<DashboardBottomNavigationBarItem> _tabs;
  String advertisingId = '';
  bool isLimitAdTrackingEnabled = false;
  late SharedPreferences _prefs;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initDependencies(BuildContext context) {
    super.initDependencies(context);
    _pageController = PageController(
      initialPage: widget.initPage != null
          ? widget.initPage!.index
          : bloc.state.currentPage.index,
    );
    _pages = [
      BlocProvider<HomeBloc>.value(
        value: HomeBloc(),
        child: const HomeScreen(),
      ),
      BlocProvider<TagContentBloc>.value(
        value: TagContentBloc(),
        child: TagAllContentScreen(
          input: TagAllContentScreenArguments(
              tag: null,
              listTags: null,
              isBottomTab: true,
              categoryId: 3,
              priceType: 'free'),
        ),
      ),
      BlocProvider<TagContentBloc>.value(
        value: TagContentBloc(),
        child: TagAllContentScreen(
          input: TagAllContentScreenArguments(
              tag: null,
              listTags: null,
              isBottomTab: true,
              categoryId: 4,
              priceType: 'free'),
        ),
      ),
      BlocProvider<CategoryBloc>.value(
        value: CategoryBloc(),
        child: const HotContentScreen(),
      ),
      // case tagAllContentList:
      //   final args = settings.arguments as TagAllContentScreenArguments;
      //   return RouteUtilsTemp.createPageBloc(
      //     bloc: (context) => TagContentBloc(),
      //     child: TagAllContentScreen(
      //       input: args,
      //     ),
      //   );
      // BlocProvider<TagContentBloc>.value(
      //   value: TagContentBloc(),
      //   child: const TagAllContentScreen(input: <TagAllContentScreenArguments>{tag: },),
      // ),
      BlocProvider(
        create: (context) => LikeBloc(),
        child: const LikeScreen(),
      ),
      BlocProvider(
        create: (context) => AccountBloc(),
        child: const MyAccountScreen(),
      ),
    ];
    _tabs = [
      DashboardBottomNavigationBarItem(
        activeIcon: SvgWidget.asset(
          AppImages.icHome,
          color: AppColors.primary01,
          height: 20.h,
        ),
        disabledIcon: SvgWidget.asset(
          AppImages.icHome,
          height: 20.h,
          color: AppColors.inActiveNav,
        ),
        label: LocaleKeys.dashboard_home.tr(),
      ),
      DashboardBottomNavigationBarItem(
        activeIcon: SvgWidget.asset(
          AppImages.icTabDarkBright,
          height: 20.h,
          color: AppColors.primary01,
        ),
        disabledIcon: SvgWidget.asset(
          AppImages.icTabDarkBright,
          height: 20.h,
          color: AppColors.inActiveNav,
        ),
        label: LocaleKeys.dashboard_fortune.tr(),
      ),
      DashboardBottomNavigationBarItem(
        activeIcon: SvgWidget.asset(
          AppImages.icTabCard,
          height: 20.h,
          color: AppColors.primary01,
        ),
        disabledIcon: SvgWidget.asset(
          AppImages.icTabCard,
          height: 20.h,
          color: AppColors.inActiveNav,
        ),
        label: LocaleKeys.dashboard_tarot.tr(),
      ),
      DashboardBottomNavigationBarItem(
        activeIcon: SvgWidget.asset(
          AppImages.icTabNote,
          height: 20.h,
          color: AppColors.primary01,
        ),
        disabledIcon: SvgWidget.asset(
          AppImages.icTabNote,
          height: 20.h,
          color: AppColors.inActiveNav,
        ),
        label: LocaleKeys.dashboard_premium.tr(),
      ),
      DashboardBottomNavigationBarItem(
        activeIcon: SvgWidget.asset(
          AppImages.icFavourite,
          height: 20.h,
          color: AppColors.primary01,
        ),
        disabledIcon: SvgWidget.asset(
          AppImages.icFavourite,
          height: 20.h,
          color: AppColors.inActiveNav,
        ),
        label: LocaleKeys.dashboard_favourite.tr(),
      ),
      DashboardBottomNavigationBarItem(
        activeIcon: SvgWidget.asset(
          AppImages.icMyAccount,
          height: 20.h,
          color: AppColors.primary01,
        ),
        disabledIcon: SvgWidget.asset(
          AppImages.icMyAccount,
          height: 20.h,
          color: AppColors.inActiveNav,
        ),
        label: LocaleKeys.dashboard_my_account.tr(),
      )
    ];
    if (widget.initPage != null) {
      bloc.onPageChange(widget.initPage!.index);
    }
  }

  @override
  void afterFirstBuild(BuildContext context) {
    super.afterFirstBuild(context);
    _initPrefsAppReview();
    final result =
        AppPreferences.instance.get<bool>(AppPreferenceKey.fromLoginPage);
    if (result != null && result == true) {
      AppPreferences.instance.set<bool>(AppPreferenceKey.fromLoginPage, false);
    }
  }

  void _initPrefsAppReview() async {
    _prefs = await SharedPreferences.getInstance();
    final isReviewed = _prefs.getBool(SharedPrefConstant.kCheckReviewed);
    final lastOpenedTimestamp = _prefs.getInt(SharedPrefConstant.kLastOpened);
    final now = DateTime.now().millisecondsSinceEpoch;

    if (isReviewed == null && lastOpenedTimestamp == null) {
      _prefs.setInt(SharedPrefConstant.kLastOpened, now);
      _prefs.setBool(SharedPrefConstant.kCheckReviewed, false);
    } else {
      if (isReviewed == false) {
        final hoursSinceLastOpened = ((now - lastOpenedTimestamp!) /
                InAppReviewConstant.millisecondsReview)
            .floor();
        if (hoursSinceLastOpened >= (24 * 3)) {
          _showDialogAppReview();
        }
      }
    }
  }

  _showDialogAppReview() {
    final now = DateTime.now().millisecondsSinceEpoch;
    _prefs.setInt(SharedPrefConstant.kLastOpened, now);
    showDialog(
        context: context,
        builder: (context) => AppReviewPrompt(
              onLater: () {
                _prefs.setBool(SharedPrefConstant.kCheckReviewed, false);
                Navigator.pop(context);
              },
              onReview: () async {
                _prefs.setBool(SharedPrefConstant.kCheckReviewed, true);
                InAppReviewService().openStoreListing();
                Navigator.pop(context);
              },
            ));
  }

  setAdvertisingId() async {
    try {
      advertisingId = await AdvertisingId.id(true) ?? '';
    } on PlatformException {
      advertisingId = '';
    }

    try {
      isLimitAdTrackingEnabled =
          await AdvertisingId.isLimitAdTrackingEnabled ?? false;
    } on PlatformException {
      isLimitAdTrackingEnabled = false;
    }

    await Segment.setContext({
      'device': {
        'adTrackingEnabled': isLimitAdTrackingEnabled,
        'advertisingId': advertisingId,
      },
    });
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget buildPage(BuildContext context, DashboardCubit bloc) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DashboardCubit>(
          create: (context) =>
              bloc, // Assuming it's provided from parent or elsewhere
        ),
        BlocProvider<HomeBloc>(
          create: (context) =>
              HomeBloc()..add(const HomeEvent.initial()), // Initialize HomeBloc
        ),
      ],
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            child: SafeArea(
              top: true,
              child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, homeEvent) {
                return Scaffold(
                  key: scaffoldKey,
                  drawer: WSideMenu(scaffoldKey: scaffoldKey),
                  appBar: AppHeader(
                    context,
                    showLeading: true,
                    leadingClicked: () =>
                        scaffoldKey.currentState?.openDrawer(),
                    onTitleClicked: () =>
                        context.read<HomeBloc>().add(const ActiveSearch(false)),
                    actionWidgets: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: AppSize.spaceBetweenWidgetMedium),
                        child: InkWell(onTap: () {
                          final homeBloc = context.read<HomeBloc>();
                          homeBloc.add(
                              ActiveSearch(!homeBloc.state.isActiveSearch));
                        }, child: BlocBuilder<HomeBloc, HomeState>(
                          builder: (context, state) {
                            return state.isActiveSearch
                                ? const Icon(Icons.close)
                                : SvgWidget.asset(AppImages.icSearch);
                          },
                        )),
                      ),
                    ],
                  ),
                  backgroundColor: AppColors.white,
                  body: BlocListener<DashboardCubit, DashboardState>(
                    listener: (context, state) {
                      _pageController.jumpToPage(
                        state.currentPage.index,
                      );
                    },
                    child: BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                      if (state.isActiveSearch) {
                        return const SearchScreen();
                      }
                      return PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _pageController,
                        children: _pages,
                        onPageChanged: (value) {
                          bloc.onPageChange(value);
                        },
                      );
                    }),
                  ),
                  bottomNavigationBar: DashBoardBottomNavigatorBar(
                    items: _tabs,
                    evaluate: 0,
                    currentIndex:
                        context.watch<DashboardCubit>().state.currentPage.index,
                    onTap: (index) {
                      if (index == 0 || index == 1) {
                        bloc.onPageChange(index);
                        return;
                      }
                      AppDialog.show(
                        context,
                        WAppDialog(
                            content: '로그인이 필요합니다.',
                            onActionProceed: () {
                              Navigator.pushNamed(
                                  context, AppRoutesMain.signIn);
                            }),
                        dismissible: true,
                        onNextAction: () {
                          bloc.onPageChange(index);
                        },
                      );
                    },
                  ),
                );
              }),
            ),
          ),
          TrackingAgreement(
            setPermission: setAdvertisingId,
          ),
        ],
      ),
    );
  }
}
