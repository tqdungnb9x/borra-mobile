import 'dart:convert';
import 'dart:io';

import 'package:borra_app/app_base/config/app_routes.dart';
import 'package:borra_app/app_base/constants/home_widget_constants.dart';
import 'package:borra_app/app_base/services/local/shared_preferences/app_preference.dart';
import 'package:borra_app/common/main_bloc.dart';
import 'package:borra_app/src/splash/data/services/app_services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:home_widget/home_widget.dart';
// import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kakao_flutter_sdk_auth/kakao_flutter_sdk_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_base/config/app_config.dart';
import 'app_base/env/env.dart';
import 'app_base/services/frc_service.dart';
import 'app_base/services/in_app_review_service.dart';
import 'firebase_options.dart';
import 'src/app.dart';

@pragma("vm:entry-point")
Future<void> backgroundCallback(Uri? uri) async {
  final appService = AppService();
  switch (uri?.host) {
    case HomeWidgetConstant.changeViewOfWidgets:
      var from = uri?.queryParameters["from"];
      if (from == "smallWidget") {
        var value = await HomeWidget.getWidgetData(
            HomeWidgetKeyConstant.changeSmallWidgetView,
            defaultValue: false);
        await HomeWidget.saveWidgetData<bool>(
            HomeWidgetKeyConstant.changeSmallWidgetView, !value!);
        await HomeWidget.updateWidget(
            name: HomeWidgetConstant.androidSmallWidgetProvider);
      } else {
        var value = await HomeWidget.getWidgetData(
            HomeWidgetKeyConstant.changeLargeWidgetView,
            defaultValue: false);
        await HomeWidget.saveWidgetData<bool>(
            HomeWidgetKeyConstant.changeLargeWidgetView, !value!);
        await HomeWidget.updateWidget(
            name: HomeWidgetConstant.androidLargeWidgetProvider);
      }
      break;
    case HomeWidgetConstant.refreshDataForWidgets:
      var from = uri?.queryParameters["from"];
      var value = await appService.loadWidgetData();
      await HomeWidget.saveWidgetData<String>(
          HomeWidgetKeyConstant.getData, jsonEncode(value.data));
      if (from == "smallWidget") {
        await HomeWidget.updateWidget(
            name: HomeWidgetConstant.androidSmallWidgetProvider);
      } else {
        await HomeWidget.updateWidget(
            name: HomeWidgetConstant.androidLargeWidgetProvider);
      }
      break;
    case HomeWidgetConstant.navigateToAScreen:
      final isContentDetailOpen = MainBloc.appBloc.state.isContentDetailOpen;

      if (!isContentDetailOpen) {
        Navigator.pushNamed(
          navigatorKey.currentContext!,
          AppRoutesMain.contentDetail,
          arguments: 2,
        );
        MainBloc.appBloc.setDetailIsOpen(true);
      }
      break;
    default:
      print("FROM NO WHERE");
  }
}

class AppRunner {
  AppRunner._internal();

  static final AppRunner instance = AppRunner._internal();

  Future<void> runApplication() async {
    WidgetsFlutterBinding.ensureInitialized();
    // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    MobileAds.instance.initialize();
    _registerBackgroundHomeWidget();
    try {
      // on press noti
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print('Got a message whilst in the foreground!');
        print('Message data: ${message.data}');

        if (message.data['page'] != null) {
          // print(message.data['page']);
          // print(message.data['pageId']);
          if (message.data['pageId'] == null) {
            AppRoutesMain.launchFromUrl(
                context: navigatorKey.currentContext!,
                url: message.data['page']);
          }
          AppRoutesMain.launchFromUrl(
              context: navigatorKey.currentContext!,
              url: message.data['page'],
              id: int.parse(message.data['pageId']));
        }
      });
    } on Exception catch (e) {
      print(e);
    }

    await Future.wait([
      _initializeDependencies(),
      _initServices(),
      _initFirebase(),
      _appConfigurations(),
      _initKakao(),
    ]);
    runApp(const App());
  }

  /// Initialize application internal dependencies
  Future<void> _initializeDependencies() async {
    WidgetsFlutterBinding.ensureInitialized();
  }

  //Registering background callback for home widget
  void _registerBackgroundHomeWidget() {
    HomeWidget.setAppGroupId(HomeWidgetConstant.appGroupID);
    HomeWidget.registerBackgroundCallback(backgroundCallback);
    HomeWidget.widgetClicked.listen(backgroundCallback);
  }

  /// Initialize external application service
  Future<void> _initServices() async {
    try {
      await Firebase.initializeApp(
        name: "firebase-test",
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await activeRequestPermissionFCM();
      await AppPreferences.instance.init();
      await InAppReviewService().init();
      await FrcService().init();
      await EasyLocalization.ensureInitialized();

      if (!kIsWeb) {
        await ScreenUtil.ensureScreenSize();
      }
    } catch (e) {
      print(e);
    }
  }

  /// Initialize application configuration
  Future<void> _appConfigurations() async {
    try {
      Intl.defaultLocale = AppLanguages.defaultLang.countryCode;
      AppConfig(env: Env.prod());

      await SystemChrome.setPreferredOrientations(AppValue.deviceOrientations);
      EasyLocalization.logger.enableLevels = [];
    } catch (e) {
      print(e);
    }
  }

  Future<void> _initKakao() async {
    KakaoSdk.init(
      nativeAppKey: AppConfig.instance.env.kakaoNativeAppKey,
      javaScriptAppKey: AppConfig.instance.env.kakaoJavaScriptAppKey,
    );
  }

  void showFlutterNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      var initializationSettingsAndroid =
          const AndroidInitializationSettings('@drawable/icon_menu_car_no');
      var initSettings =
          InitializationSettings(android: initializationSettingsAndroid);
      flutterLocalNotificationsPlugin.initialize(initSettings,
          onDidReceiveNotificationResponse: (response) {
        print('onDidReceiveNotificationResponse');
        print('response: ${response}');
      }, onDidReceiveBackgroundNotificationResponse: (response) {
        print('onDidReceiveBackgroundNotificationResponse');
        print('response: ${response.payload}');
      });
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(channel.id, channel.name,
              channelDescription: channel.description,
              icon: '@drawable/ic_money',
              color: Color(0xff02D3AE)),
        ),
      );
    }
  }

  Future<void> _initFirebase() async {
    try {
      setupFlutterNotifications();
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('Message foreground');
        showFlutterNotification(message);
      });
      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        onMessageOpenApp(message);
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  void onMessageOpenApp(RemoteMessage message) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (message.data['notiType'] == "deepLink") {
      if (message.data['url'] != null) {
        pref.setString("deepLink", message.data['url']);
      }
    }
  }

  late SharedPreferences pref;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @pragma('vm:entry-point')
  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {}

  bool isFlutterLocalNotificationsInitialized = false;

  late AndroidNotificationChannel channel;

  Future<void> setupFlutterNotifications() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    if (Platform.isIOS) {
      await FirebaseMessaging.instance.getAPNSToken();
    }
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }
    channel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    isFlutterLocalNotificationsInitialized = true;
  }

  Future<void> activeRequestPermissionFCM() async {
    print("activeRequestPermissionFCM");
    NotificationSettings settings;
    settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("====== Active FCM: AuthorizationStatus.authorized ======");
    } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
      settings = await FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      print("====== Active FCM: AuthorizationStatus.denied ======");
    }
  }
}
