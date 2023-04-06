import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/pages/app/app_flow_page.dart';
import '../ui/pages/auth/auth_page.dart';
import '../ui/pages/app/home/home_page.dart';
import '../ui/pages/splash/splash_page.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: 'splash',
      page: SplashPage,
      initial: true,
    ),
    AutoRoute(
      path: 'auth',
      page: AuthPage,
    ),
    AutoRoute(
      path: 'appFlow',
      page: AppFlowPage,
      children: [
        AutoRoute(
          path: 'home',
          page: HomePage,
          initial: true,
        ),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {}
