import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/auth/auth_cubit.dart';
import '../../../di/di.dart';
import '../../../routes/router.dart';
import '../../../themes/app_theme.dart';

class SplashPage extends StatelessWidget with AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (_) => locator()..init(),
      child: this,
    );
  }

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        switch (state.auth) {
          case true:
            context.router.replace(AppFlowRoute(login: state.auth));
            break;
          case false:
            context.router.replace(const AuthRoute());
            break;
          default:
        }
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: context.designs.gradient),
        ),
      ),
    );
  }
}
