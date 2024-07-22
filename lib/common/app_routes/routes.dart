import 'package:borra_app/src/authentication/sign_in/business_logic/blocs/sign_in_bloc.dart';
import 'package:borra_app/src/hot_content/hot_content_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
// import 'package:go_router/go_router.dart';

import '../../app_base/utils/app_utils.dart';
import '../../src/authentication/sign_in/presentation/screens/sign_in_screen.dart';

part 'action_navigation.dart';
part 'route_utils.dart';

/// Declare the screens used in app
enum ERoutes {
  /// Ex: The "products" screen show list of products, the "product-detail" screen show detailed information of the product
  /// and "product-detail" is sub-screen of the "products" screen.
  /// We will declare the screens as:
  /// The "products" screen: Products('products', '/products')
  /// The "product-detail" screen:  ProductDetail('product-detail', 'products/:id');
  Main('main', '/'),
  SignIn("sign-in", '/sign-in'),
  SignUp('sign-up', '/sign-up'),
  Dashboard('dashboard', '/dashboard'),
  HotContentDetail('hot-content', 'hot-content/:list_content');

  const ERoutes(this.id, this.path);

  /// Id of the screen
  final String id;

  /// Path of the screen:
  ///! NOTE: The screen is the sub-screen, this path doesn't have '/'
  ///
  final String path;
}

class AppRoutes {
  static final List<RouteBase> router = [
    GoRouteUtils.createPageBloc(
        route: ERoutes.SignIn, bloc: SignInBloc(), child: const SignInScreen()),
  ];
  static final List<RouteBase> routerDashboard = [
    GoRouteUtils.createPage(
        route: ERoutes.HotContentDetail, child: const HotContentScreen()),
  ];
}
