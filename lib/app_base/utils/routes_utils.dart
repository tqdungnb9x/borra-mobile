part of 'app_utils.dart';

abstract class RouteUtils {
  static createPageBloc<T extends BlocBase>({
    required T Function(BuildContext context) bloc,
    required Widget child,
    RouteSettings? settings,
  }) {
    return Builder(
      builder: (context) => BlocProvider(
        create: (_) => bloc.call(context),
        child: child,
      ),
    );
  }

  static createPage({
    required Widget child,
    RouteSettings? settings,
  }) {
    return Builder(
      builder: (context) => child,
    );
  }

  static Route errorRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text('Error'),
        ),
      ),
      settings: const RouteSettings(
        name: '/error',
      ),
    );
  }
}

abstract class RouteUtilsTemp {
  static Route createPageBloc<T extends BlocBase>({
    required T Function(BuildContext context) bloc,
    required Widget child,
    RouteSettings? settings,
  }) {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (_) => bloc.call(context),
        child: child,
      ),
      settings: settings,
      fullscreenDialog: true,
    );
  }

  static Route createPage({
    required Widget child,
    RouteSettings? settings,
  }) {
    return MaterialPageRoute(
      builder: (context) => child,
      settings: settings,
      fullscreenDialog: true,
    );
  }

  static Route errorRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text('Error Route'),
        ),
      ),
      settings: const RouteSettings(
        name: '/error',
      ),
    );
  }
}

abstract class RouteUtilsTempPrivate {
  static Route createPageBloc<T extends BlocBase>({
    required T Function(BuildContext context) bloc,
    required Widget child,
    RouteSettings? settings,
  }) {
    return MaterialPageRoute(
      builder: (context) => MainBloc.authBloc.state.authStatus ==
              const AuthStatus.unauthenticated()
          ? BlocProvider(
              create: (_) => ((context) => SignInBloc()).call(context),
              child: const SignInScreen(),
            )
          : BlocProvider(
              create: (_) => bloc.call(context),
              child: child,
            ),
      settings: settings,
      fullscreenDialog: true,
    );
  }

  static Route createPage({
    required Widget child,
    RouteSettings? settings,
  }) {
    return MaterialPageRoute(
      builder: (context) => MainBloc.authBloc.state.authStatus ==
              const AuthStatus.unauthenticated()
          ? BlocProvider(
              create: (_) => ((context) => SignInBloc()).call(context),
              child: const SignInScreen(),
            )
          : child,
      settings: settings,
      fullscreenDialog: true,
    );
  }

  static Route errorRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text('Error Route'),
        ),
      ),
      settings: const RouteSettings(
        name: '/error',
      ),
    );
  }
}

class SlideLeftRoute extends PageRouteBuilder {
  final Widget page;
  SlideLeftRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}
