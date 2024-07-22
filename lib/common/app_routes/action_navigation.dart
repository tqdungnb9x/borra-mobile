part of 'routes.dart';

class ActionNavigation {
  static void goNamed(BuildContext context, ERoutes route,
      {Map<String, dynamic>? args}) {
    context.goNamed(route.id, queryParameters: args ?? {});
  }
}
