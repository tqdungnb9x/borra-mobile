// import 'dart:async';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// AndroidNotificationChannel channel = const AndroidNotificationChannel(
//   'high_importance_channel', // id
//   'High Importance Notifications', // title
//   description:
//       'This channel is used for important notifications.', // description
//   importance: Importance.high,
// );

// class NotificationServices extends ChangeNotifier {
//   static final NotificationServices _internal = NotificationServices._();

//   NotificationServices._();

//   factory NotificationServices() => _internal;

//   final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

//   Future initialize() async {
//     await _setupNotification();

//     _setupBackgroundNotification();
//     _setupForegroundNotification();
//     await _handleBackgroundNotificationClick();
//   }

//   //region setup background notification handler

//   Future _setupBackgroundNotification() async {
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   }

//   //#endregion

//   //#region Setup foreground notification
//   late StreamSubscription onForegroundMessageSubscription;
//   String deviceToken = "";

//   Future _setupForegroundNotification() async {
//     onForegroundMessageSubscription =
//         FirebaseMessaging.onMessage.listen(_firebaseMessagingForegroundHandler);
//     _getDeviceToken();
//   }

//   void _getDeviceToken() async {
//     final String? token = await FirebaseMessaging.instance.getToken();
//     deviceToken = token ?? "";
//     print(deviceToken);
//   }

//   void _firebaseMessagingForegroundHandler(RemoteMessage message) {
//     notifyListeners();
//     _showNotification(message);
//   }

// //#endregion

//   //#region Setup Local Notification
//   Future _setupNotification() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     final DarwinInitializationSettings initializationSettingsIOS =
//         DarwinInitializationSettings(
//             onDidReceiveLocalNotification: _onDidReceiveLocalNotification);

//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: (res) {
//       _handleForegroundNotificationClick(res.payload);
//     });
//   }

//   //#endregion

//   //#region iOS notification received (for old iOS version)
//   void _onDidReceiveLocalNotification(
//       int id, String? title, String? body, String? payload) {}

//   //#endregion

//   //#region on notification selected

//   void _handleForegroundNotificationClick(String? payload) {
//     if (payload == null) return;
//   }

//   Future _handleBackgroundNotificationClick() async {
//     final NotificationAppLaunchDetails? notificationAppLaunchDetails =
//         await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

//     if (notificationAppLaunchDetails == null ||
//         notificationAppLaunchDetails.notificationResponse?.payload == null) {
//       return;
//     }
//     if (notificationAppLaunchDetails.didNotificationLaunchApp) {}
//   }

// //#endregion
// }

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();

//   _showNotification(message);
// }

// void _showNotification(RemoteMessage message) {
//   final androidNotification = AndroidNotificationDetails(
//     channel.id,
//     channel.name,
//     channelDescription: channel.description,
//     icon: "@mipmap/ic_launcher",
//   );

//   const iOSNotification = DarwinNotificationDetails();

//   final notificationDetail = NotificationDetails(
//     android: androidNotification,
//     iOS: iOSNotification,
//   );

//   flutterLocalNotificationsPlugin.show(
//     message.data.hashCode,
//     "Bạn có thông báo mới",
//     message.notification!.body ?? '',
//     notificationDetail,
//   );
// }
