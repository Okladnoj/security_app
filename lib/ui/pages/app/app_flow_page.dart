import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/app/app_cubit.dart';
import '../../../di/di.dart';
import '../../../routes/router.dart';
import '../../../themes/app_theme.dart';
import '../../views/base_builders/app_consumer.dart';
import 'views/drawer_products.dart';

class AppFlowPage extends StatelessWidget with AutoRouteWrapper {
  final bool login;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (_) => locator()..init(login),
      child: this,
    );
  }

  const AppFlowPage({
    super.key,
    required this.login,
  });

  void _onLogOut(BuildContext context) async {
    final router = context.router;
    await context.read<AppCubit>().logOut();
    router.replace(const AuthRoute());
  }

  @override
  Widget build(BuildContext context) {
    return AppConsumer<AppCubit, AppState>(
      listenDefault: (context, state) {
        if (state.login) return;

        context.router.replace(const AuthRoute());
      },
      withScaffold: false,
      builder: (state) {
        return Scaffold(
          drawer: DrawerProducts(onLogOut: () => _onLogOut(context)),
          body: Container(
            decoration: BoxDecoration(gradient: context.designs.gradient),
            child: const AutoRouter(),
          ),
        );
      },
    );
  }
}
