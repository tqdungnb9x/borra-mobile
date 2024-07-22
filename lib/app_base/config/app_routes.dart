import 'package:borra_app/common/main_bloc.dart';
import 'package:borra_app/src/app.dart';
import 'package:borra_app/src/authentication/auth/data/models/user.dart';
import 'package:borra_app/src/authentication/sign_in/business_logic/blocs/sign_in_bloc.dart';
import 'package:borra_app/src/authentication/sign_in/presentation/screens/sign_in_screen.dart';
import 'package:borra_app/src/content_detail/business_logic/content_detail/content_detail_bloc.dart';
import 'package:borra_app/src/content_detail/business_logic/content_purchased/content_purchased_bloc.dart';
import 'package:borra_app/src/content_detail/data/models/content_input_argument.dart';
import 'package:borra_app/src/content_detail/presentation/screens/content_detail_screen.dart';
import 'package:borra_app/src/content_detail/presentation/screens/content_purchased_result_screen.dart';
import 'package:borra_app/src/content_detail/presentation/screens/waiting_result_screen.dart';
import 'package:borra_app/src/content_result/business_logic/content_result/content_result_bloc.dart';
import 'package:borra_app/src/content_result/presentation/screens/content_result_screen.dart';
import 'package:borra_app/src/dashboard/dashboard_screen.dart';
import 'package:borra_app/src/home/business_logic/blocs/home_bloc.dart';
import 'package:borra_app/src/home/business_logic/category_content/category_content_bloc.dart';
import 'package:borra_app/src/home/business_logic/hot_content/hot_content_bloc.dart';
import 'package:borra_app/src/home/business_logic/tag_content/tag_content_bloc.dart';
import 'package:borra_app/src/home/data/models/tag.dart';
import 'package:borra_app/src/home/presentation/screens/category_content.dart';
import 'package:borra_app/src/home/presentation/screens/hot_content_list_screen.dart';
import 'package:borra_app/src/home/presentation/screens/tag_all_content_screen.dart';
import 'package:borra_app/src/home_notice/business_logic/notice_bloc.dart';
import 'package:borra_app/src/home_notice/presentation/screens/notice_detail.dart';
import 'package:borra_app/src/home_notice/presentation/screens/notice_screen.dart';
import 'package:borra_app/src/hot_content/data/models/category.dart';
import 'package:borra_app/src/hot_content/presentation/category_list_screen.dart';
import 'package:borra_app/src/my_account/business_logic/account_bloc.dart';
import 'package:borra_app/src/my_account/business_logic/manage_profile/manage_profile_bloc.dart';
import 'package:borra_app/src/my_account/presentation/screens/edit_account_screen.dart';
import 'package:borra_app/src/my_account/presentation/screens/receive_notifination_detail.dart';
import 'package:borra_app/src/my_account/presentation/screens/register_user_screen.dart';
import 'package:borra_app/src/my_account/presentation/screens/setting_notification_screen.dart';
import 'package:borra_app/src/my_account/presentation/screens/user_likes_all_screen.dart';
import 'package:borra_app/src/my_account/presentation/screens/user_replays_all_screen.dart';
import 'package:borra_app/src/my_account/presentation/screens/withdraw_account_screen.dart';
import 'package:borra_app/src/payments/presentation/screens/payment_screen.dart';
import 'package:borra_app/src/payments/presentation/screens/policy_payment.dart';
import 'package:borra_app/src/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../src/content_detail/presentation/screens/interstitial_custom_advertisement_screen.dart';
import '../../src/content_detail/presentation/screens/result_screen.dart';
import '../../src/content_result/presentation/screens/saju_kanji_screen.dart';
import '../../src/dashboard/business_logic/cubits/dashboard_cubit.dart';
import '../../src/home/business_logic/free_content/free_content_bloc.dart';
import '../../src/home/data/repositories/home_repository.dart';
import '../../src/home/presentation/screens/free_content_list_screen.dart';
import '../../src/home_notice/data/models/notice_model.dart';
import '../../src/hot_content/business_logic/category_bloc.dart';
import '../utils/app_utils.dart';

class AppRoutesMain {
  static String get initial => splash;

  static const String splash = "/splash";

  /// Auth Personal
  static const String intro = "/intro";
  static const String loginGate = "/loginGate";
  static const String signIn = "/signIn";
  static const String signUp = '/signUp';
  static const String register = '/register';

  ///Main screen
  static const String dashBoard = "/dashBoard";
  static const String category = "/category";
  static const String like = "/like";
  static const String account = "/account";

  ///Home screen
  static const String hotContentList = "/hotContentList";
  static const String categoryContentList = "/categoryContentList";
  static const String freeContentList = "/freeContentList";
  static const String tagAllContentList = "/tagAllContentList";
  static const String accountPayment = "/accountPayment";
  static const String historyPayment = "/historyPayment";
  static const String historyPurchase = "/historyPurchase";
  static const String freeCoin = "/freeCoin";
  static const String noticeContentList = "/noticeContentList";
  static const String favouriteQuestion = "/faqs";
  static const String noticeContentDetail = "/noticeContentDetail";
  static const String privacyPolicy = "/privacyPolicy";
  static const String collectInfoPolicy = "/privacyPolicy";

  ///Categories
  static const String contentCategoryList = "/contentCategoryList";

  ///Favorites

  ///Account
  static const String userLikedList = "/userLikedList";
  static const String userReplayList = "/userReplayList";
  static const String userInfoEdit = "/userInfoEdit";
  static const String userSettingNoti = "/userSettingNoti";
  static const String notificationDetail = "/notificationDetail";
  static const String userWithdraw = "/userWithdraw";

  ///Content detail
  static const String contentDetail = "/contentDetail";
  static const String contentResult = "/contentResult";
  static const String contentPurchasedResult = "/contentPurchasedResult";
  static const String contentPurchasedWaiting = "/contentPurchasedWaiting";
  static const String interstitialCustomAdvertisement =
      "/interstitialCustomAdvertisement";
  static const String resultContent = "/resultContent";
  static const String contentSajuDetail = "/contentSajuDetail";

  static const String testPage = "/testPage";
  static const String widgetNavigate = "/contentDetailWidget";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return RouteUtilsTemp.createPage(child: const SplashScreen());
      case signIn:
        return RouteUtilsTemp.createPageBloc(
            bloc: (context) => SignInBloc(), child: const SignInScreen());

      case dashBoard:
        return RouteUtilsTemp.createPageBloc(
          bloc: (context) => DashboardCubit(),
          child: const DashBoardScreen(initPage: DashboardNav.home),
          settings: settings,
        );
      case category:
        return RouteUtilsTemp.createPageBloc(
          bloc: (context) => DashboardCubit(),
          child: const DashBoardScreen(initPage: DashboardNav.category),
          settings: settings,
        );
      case like:
        return RouteUtilsTempPrivate.createPageBloc(
          bloc: (context) => DashboardCubit(),
          child: const DashBoardScreen(initPage: DashboardNav.like),
          settings: settings,
        );
      case account:
        return RouteUtilsTempPrivate.createPageBloc(
          bloc: (context) => DashboardCubit(),
          child: const DashBoardScreen(initPage: DashboardNav.account),
          settings: settings,
        );
      case hotContentList:
        return RouteUtilsTemp.createPageBloc(
            bloc: (context) => HotContentBloc(),
            child: const HotContentListScreen());
      case categoryContentList:
        final id = settings.arguments as int;
        return RouteUtilsTemp.createPageBloc(
            bloc: (context) => CategoryContentBloc(),
            child: CategoryContentListScreen(categoryId: id));
      case freeContentList:
        return RouteUtilsTemp.createPageBloc(
            bloc: (context) => FreeContentBloc(),
            child: const FreeContentListScreen());
      case tagAllContentList:
        final args = settings.arguments as TagAllContentScreenArguments;
        return RouteUtilsTemp.createPageBloc(
          bloc: (context) => TagContentBloc(),
          child: TagAllContentScreen(
            input: args,
          ),
        );
      case contentDetail:
        // case widgetNavigate:
        final args = (settings.arguments ?? 2) as int;
        if (MainBloc.appBloc.state.isContentDetailOpen) {
          Navigator.pop(navigatorKey.currentContext!);
        }
        return RouteUtilsTemp.createPageBloc(
          bloc: (context) => ContentDetailBloc(),
          child: ContentDetailScreen(
            contentId: args,
          ),
        );
      case contentCategoryList:
        final args = settings.arguments as ContentCategory;
        return RouteUtilsTemp.createPageBloc(
          bloc: (context) => CategoryBloc(),
          child: CategoryListContentScreen(
            category: args,
          ),
        );
      case userLikedList:
        return RouteUtilsTempPrivate.createPageBloc(
          bloc: (context) => AccountBloc(),
          child: const UserLikedAllScreen(),
        );
      case userReplayList:
        return RouteUtilsTempPrivate.createPageBloc(
          bloc: (context) => AccountBloc(),
          child: const UserReplayAllScreen(),
        );
      case contentResult:
        final args = settings.arguments as ContentResultReplaysArguments;

        return RouteUtilsTemp.createPageBloc(
          bloc: (context) => ContentResultBloc(),
          child: ContentResultScreen(
            contentId: args.id,
            shareCode: args.shareCode,
          ),
        );

      case contentPurchasedWaiting:
        final args = settings.arguments as ContentInputArgument;
        return RouteUtilsTempPrivate.createPageBloc(
          bloc: (context) => ContentPurchasedBloc(),
          child: WaitingResultScreen(
            appContentSubmit: args,
          ),
        );
      case interstitialCustomAdvertisement:
        final args = settings.arguments as ContentInputArgument;
        return RouteUtilsTempPrivate.createPageBloc(
          bloc: (context) => ContentPurchasedBloc(),
          child: InterstitialCustomAdvertisementScreen(
            appContentSubmit: args,
          ),
        );

      case contentPurchasedResult:
        final args = settings.arguments as ContentInputArgument;

        return RouteUtilsTempPrivate.createPageBloc(
          bloc: (context) => ContentPurchasedBloc(),
          child: ContentPurchasedResultScreen(
            appContentSubmit: args,
          ),
        );

      case resultContent:
        final args = settings.arguments as ContentResultArguments;

        return RouteUtilsTempPrivate.createPageBloc(
          bloc: (context) => ContentPurchasedBloc(),
          child: ResultScreen(
            contentResultArguments: args,
          ),
        );

      case contentSajuDetail:
        final args = settings.arguments as SajuGanJiArgument;
        return RouteUtilsTemp.createPage(
          child: ShachouKanjiScreen(
            sajuArgs: args,
          ),
        );

      case accountPayment:
        final args = settings.arguments as int?;
        return RouteUtilsTempPrivate.createPage(
          child: PaymentScreen(
            selectedIndex: args ?? 0,
          ),
        );
      case historyPayment:
        final args = settings.arguments as int?;
        return RouteUtilsTempPrivate.createPage(
          child: PaymentScreen(
            selectedIndex: args ?? 1,
          ),
        );
      case historyPurchase:
        final args = settings.arguments as int?;
        return RouteUtilsTempPrivate.createPage(
          child: PaymentScreen(
            selectedIndex: args ?? 2,
          ),
        );
      case freeCoin:
        final args = settings.arguments as int?;
        return RouteUtilsTempPrivate.createPage(
          child: PaymentScreen(
            selectedIndex: args ?? 3,
          ),
        );

      case collectInfoPolicy:
        return RouteUtilsTemp.createPage(
          child: const CollectDataPolicyScreen(),
        );
      case noticeContentList:
        return RouteUtilsTemp.createPageBloc(
          bloc: (context) => NoticeBloc(),
          child: NoticeScreen(
            type: NoticeType.notice.name,
          ),
        );

      case favouriteQuestion:
        return RouteUtilsTemp.createPageBloc(
          bloc: (context) => NoticeBloc(),
          child: NoticeScreen(
            type: NoticeType.faq.name,
          ),
        );

      case noticeContentDetail:
        final args = settings.arguments as dynamic;

        return RouteUtilsTemp.createPage(
          child: NoticeDetailScreen(
            notice: args,
          ),
        );

      case userInfoEdit:
        final args = settings.arguments as List<AppTag>;

        return RouteUtilsTempPrivate.createPageBloc(
          bloc: (context) => ManageProfileBloc(),
          child: EditAccountScreen(
            listTag: args,
          ),
        );
      case userSettingNoti:
        final args = settings.arguments as User;

        return RouteUtilsTempPrivate.createPage(
          child: SettingNotificationScreen(
            user: args,
          ),
        );

      case userWithdraw:
        return RouteUtilsTempPrivate.createPageBloc(
          bloc: (context) => ManageProfileBloc(),
          child: const WithdrawUserScreen(),
        );

      case notificationDetail:
        final args = settings.arguments as List<String>;
        return RouteUtilsTempPrivate.createPage(
          child: ReceiveNotificationDetailScreen(
            links: args,
          ),
        );
      case register:
        return RouteUtilsTempPrivate.createPageBloc(
          bloc: (context) => ManageProfileBloc(),
          child: RegisterUserScreen(
            currentUser: MainBloc.authBloc.state.user!,
            listTag: MainBloc.appBloc.state.listTags,
          ),
        );
      case widgetNavigate:
        return null;

      default:
        return RouteUtilsTemp.errorRoute();
    }
  }

  static String launchCommonUrl(String url) {
    print(url);
    if (url.contains("login")) {
      return signIn;
    } else if (url.contains("register")) {
      return register;
    } else if (url.contains("accounts/likes")) {
      return like;
    } else if (url.contains("accounts/replays")) {
      return userReplayList;
    } else if (url.contains("accounts/edit")) {
      return userInfoEdit;
    } else if (url.contains("accounts/setting")) {
      return userSettingNoti;
    } else if (url.contains("accounts")) {
      return account;
    } else if (url.contains("category/contents/free")) {
      return freeContentList;
    } else if (url.contains("category")) {
      return category;
    } else if (url.contains("posts")) {
      return noticeContentList;
    } else if (url.contains("faqs")) {
      return favouriteQuestion;
    } else if (url.contains("payments/charge")) {
      return collectInfoPolicy;
    } else if (url.contains("payments/purchases")) {
      return historyPurchase;
    } else if (url.contains("payments")) {
      return historyPayment;
    }
    return dashBoard;
  }

  static void launchFromUrl(
      {required BuildContext context, required String url, int? id}) async {
    print(id);
    if (id == null) {
      print("id null");
      print(url);
      print(launchCommonUrl(url));
      Navigator.pushNamed(context, launchCommonUrl(url));

      return;
    } else {
      if (url.contains("result")) {
        print("url.contains('result')");
        Navigator.pushNamed(context, contentResult,
            arguments: ContentResultReplaysArguments(id: id));
      } else if (url.contains("contents")) {
        Navigator.pushNamed(context, contentDetail, arguments: id);
      } else if (url.contains("category")) {
        Navigator.pushNamed(context, contentCategoryList,
            arguments: ContentCategory(id: id));
      } else if (url.contains("tags")) {
        final HomeRepository repo = HomeRepository();
        await repo.getTagList().then((res) {
          String name = res.data!.lastWhere((element) => element.id == id).name;
          print(name);
          Navigator.pushNamed(context, tagAllContentList,
              arguments: TagAllContentScreenArguments(
                  tag: AppTag(id: id, name: name), listTags: res.data ?? []));
        }).onError((error, stackTrace) {
          print(error);
        });
      } else {
        Navigator.pushNamed(context, dashBoard, arguments: DashboardNav.home);
      }
    }
  }
}
