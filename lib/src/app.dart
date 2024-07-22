import 'dart:convert';
import 'dart:io';

import 'package:borra_app/app_base/config/app_config.dart';
import 'package:borra_app/common/app_routes/routes.dart';
import 'package:borra_app/common/widgets/dialogs/app_dialog.dart';
import 'package:borra_app/common/widgets/loading/app_loading.dart';
import 'package:borra_app/src/authentication/auth/business_logic/blocs/authentication_bloc.dart';
import 'package:borra_app/src/content_detail/business_logic/content_detail/content_detail_bloc.dart';
import 'package:borra_app/src/content_detail/presentation/screens/content_detail_screen.dart';
import 'package:borra_app/src/content_result/presentation/screens/content_result_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_widget/home_widget.dart';

import '../app_base/config/app_routes.dart';
import '../app_base/constants/home_widget_constants.dart';
import '../app_base/utils/app_utils.dart';
import '../common/main_bloc.dart';
import 'dashboard/business_logic/cubits/dashboard_cubit.dart';
import 'splash/business_logic/blocs/app_bloc.dart';
import 'splash/data/services/app_services.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>.value(value: AppBloc()),
        BlocProvider<DashboardCubit>.value(value: DashboardCubit()),
        ...MainBloc.providers
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: AppLoading()),
          RepositoryProvider.value(value: AppDialog()),
        ],
        child: ScreenUtilInit(
          designSize: AppSize.designSize,
          child: DevicePreview(
            enabled: AppConfig.instance.env.devicePreview,
            builder: (ctx) => EasyLocalization(
              path: AppLanguages.transPath,
              fallbackLocale: AppLanguages.defaultLang,
              supportedLocales: AppLanguages.spLangs,
              startLocale: ctx.watch<AppBloc>().state.locale,
              child: const AppView(),
            ),
          ),
          builder: (context, child) {
            return child!;
          },
        ),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  void initState() {
    super.initState();
    // _initWidgetData();
    initDynamicLinks();
  }

  NavigatorState get _navigator => navigatorKey.currentState!;

  Future<void> initDynamicLinks() async {
    // Handle incoming links - This gets called when the app is already open
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLink) {
      // Handle the received dynamic link here
      // For example, you can navigate to a specific page based on the link
      // For demonstration purposes, let's just print the link
      print('Dynamic link received: ${dynamicLink.link.path}');
      if (dynamicLink.link.path.isNotEmpty) {
        if (dynamicLink.link.path.startsWith('/contents/')) {
          var contentId = int.tryParse(
              dynamicLink.link.path.replaceAll(RegExp(r'/contents/'), ''));
          if (contentId != null) {
            if (MainBloc.appBloc.state.isContentDetailOpen) {
              _navigator.pop(navigatorKey.currentContext!);
            }
            _navigator.pushNamed(
              AppRoutesMain.contentDetail,
              arguments: contentId,
            );
          }
        }
        // Navigator.pushNamed(
        //     navigatorKey.currentContext!, AppRoutesMain.contentResult,
        //     arguments: ContentResultReplaysArguments(
        //         id: int.parse(dynamicLink.link.queryParameters["id"] ?? ""),
        //         shareCode: dynamicLink.link.queryParameters["shareCode"]));
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    MainBloc.dispose();
  }

  Future _sendData(String title) async {
    try {
      return Future.wait([
        HomeWidget.saveWidgetData<String>('title', title),
      ]);
    } on PlatformException catch (exception) {
      debugPrint('Error Sending Data. $exception');
    }
  }

  Future _savingToken(int? userId) async {
    print('_savingToken $userId');
    try {
      var fcmToken = await FirebaseMessaging.instance.getToken();

      AppService().saveFCMToken(deviceToken: fcmToken ?? "", userId: userId);

      print('--------fcmToken:$fcmToken');
    } on Exception catch (e) {
      print(e);
    }
  }

  Future _updateWidget() async {
    try {
      if (Platform.isAndroid) {
        return Future.wait([
          HomeWidget.updateWidget(
              androidName: HomeWidgetConstant.androidSmallWidgetProvider),
          HomeWidget.updateWidget(
              androidName: HomeWidgetConstant.androidLargeWidgetProvider),
        ]);
      }
      return Future.wait([
        HomeWidget.updateWidget(
          iOSName: HomeWidgetConstant.iosWidgetName,
        )
      ]);
    } on PlatformException catch (exception) {
      debugPrint('Error Updating Widget. $exception');
    }
  }

  Future<void> _initWidgetData() async {
    var value = await AppService().loadWidgetData();
    await _sendData(jsonEncode(value.data));
    await _updateWidget();
  }

  @override
  Widget build(BuildContext context) {
    MainBloc.unauthorizedCallback = context.read<AuthenticationBloc>().logOut;

    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        context.setLocale(state.locale);
      },
      child: MaterialApp(
        scrollBehavior: const ScrollBehaviorModified(),
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutesMain.initial,
        locale: context.watch<AppBloc>().state.locale,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        onGenerateRoute: AppRoutesMain.onGenerateRoute,
        themeMode: ThemeMode.light,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        builder: (builderContext, child) {
          return MediaQuery(
            data: MediaQuery.of(builderContext)
                .copyWith(textScaleFactor: 1.0, boldText: false),
            child: BlocListener<AuthenticationBloc, AuthenticationState>(
              listenWhen: ((previous, current) {
                return previous.authStatus != current.authStatus;
              }),
              listener: (context, state) {
                _savingToken(state.user?.id);
                _initWidgetData();
                _navigator.pushNamedAndRemoveUntil(
                    AppRoutesMain.dashBoard, (route) => false);
              },
              child: child,
            ),
          );
        },
      ),
    );
  }
}
