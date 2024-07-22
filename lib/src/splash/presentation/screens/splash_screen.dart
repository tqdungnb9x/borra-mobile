import 'package:borra_app/app_base/config/app_config.dart';
import 'package:borra_app/app_base/services/local/secure_storage/local_storage_repo.dart';
import 'package:borra_app/app_base/services/local/shared_preferences/app_preference.dart';
import 'package:borra_app/common/main_bloc.dart';
import 'package:borra_app/src/splash/business_logic/blocs/app_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../animations/splash_animation.dart';
import '../widgets/w_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AppBloc appBloc;
  @override
  void initState() {
    checkFirstTime();

    appBloc = context.read<AppBloc>();
    super.initState();
    appBloc.add(const AppEventInitial());
  }

  checkFirstTime() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await LocalRepository().checkFirstTime();
    try {
      var fcmToken = await FirebaseMessaging.instance.getToken();

      if (fcmToken != null && pref.getString("fcmToken") == null) {
        pref.setString("fcmToken", fcmToken);
      }

      print('--------fcmToken:$fcmToken');

      var accessToken =
          AppPreferences.instance.get<String>(AppPreferenceKey.accessToken);
      print('--------accessToken:$accessToken');
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          state.status.whenOrNull(
            success: (_) async {
              MainBloc.authBloc.initial();
            },
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: AppColors.splashBgColor,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            const LogoAnimation(child: WLogo()),
          ],
        ),
      ),
    );
  }
}
