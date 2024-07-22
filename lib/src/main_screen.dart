import 'package:borra_app/common/app_routes/routes.dart';
import 'package:borra_app/common/widgets/loading/app_loading.dart';
import 'package:borra_app/src/authentication/auth/business_logic/blocs/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication/auth/data/models/auth_status.dart';
import 'splash/presentation/screens/splash_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        state.status.whenOrNull(idle: () {
          AppLoading.dismiss(context);
        }, loading: () {
          AppLoading.show(context);
        }, success: (_) async {
          AppLoading.dismiss(context);
          // if (state.authStatus is Authenticated) {
          //   ActionNavigation.goNamed(context, ERoutes.Dashboard);
          // } else {
          // ActionNavigation.goNamed(context, ERoutes.SignIn);
          // }
          ActionNavigation.goNamed(context, ERoutes.Dashboard);
        }, failure: (error) {
          AppLoading.dismiss(context);
        });
      },
      buildWhen: ((previous, current) =>
          previous.authStatus != current.authStatus),
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
            if (state.authStatus is Unknown) const SplashScreen()
          ],
        );
      },
    );
  }
}
