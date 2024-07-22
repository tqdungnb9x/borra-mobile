part of 'routes.dart';

abstract class GoRouteUtils {
  static GoRoute createPageBloc<T extends BlocBase>({
    required ERoutes route,
    required T bloc,
    required Widget child,
    RouteSettings? settings,
  }) {
    return GoRoute(
      path: route.path,
      name: route.id,
      builder: (_, state) => RouteUtils.createPageBloc(
          bloc: (context) => bloc, child: child, settings: settings),
    );
  }

  static GoRoute createPage({
    required ERoutes route,
    required Widget child,
    List<RouteBase> routes = const <RouteBase>[],
    RouteSettings? settings,
  }) {
    return GoRoute(
      path: route.path,
      name: route.id,
      builder: (_, state) =>
          RouteUtils.createPage(child: child, settings: settings),
      routes: routes,
    );
  }

  static String? guard(BuildContext context, GoRouterState state) {
    return null;
  }
}
