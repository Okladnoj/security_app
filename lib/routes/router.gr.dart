// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const SplashPage()),
      );
    },
    AuthRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const AuthPage()),
      );
    },
    AppFlowRoute.name: (routeData) {
      final args = routeData.argsAs<AppFlowRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: AppFlowPage(
          key: args.key,
          login: args.login,
        )),
      );
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'splash',
          fullMatch: true,
        ),
        RouteConfig(
          SplashRoute.name,
          path: 'splash',
        ),
        RouteConfig(
          AuthRoute.name,
          path: 'auth',
        ),
        RouteConfig(
          AppFlowRoute.name,
          path: 'appFlow',
          children: [
            RouteConfig(
              '#redirect',
              path: '',
              parent: AppFlowRoute.name,
              redirectTo: 'home',
              fullMatch: true,
            ),
            RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: AppFlowRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: 'splash',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [AuthPage]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: 'auth',
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [AppFlowPage]
class AppFlowRoute extends PageRouteInfo<AppFlowRouteArgs> {
  AppFlowRoute({
    Key? key,
    required bool login,
    List<PageRouteInfo>? children,
  }) : super(
          AppFlowRoute.name,
          path: 'appFlow',
          args: AppFlowRouteArgs(
            key: key,
            login: login,
          ),
          initialChildren: children,
        );

  static const String name = 'AppFlowRoute';
}

class AppFlowRouteArgs {
  const AppFlowRouteArgs({
    this.key,
    required this.login,
  });

  final Key? key;

  final bool login;

  @override
  String toString() {
    return 'AppFlowRouteArgs{key: $key, login: $login}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}
