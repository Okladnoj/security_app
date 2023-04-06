import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/auth/auth_cubit.dart';
import '../../../di/di.dart';
import '../../../gen/assets.gen.dart';
import '../../../l10n/localization_helper.dart';
import '../../../routes/router.dart';
import '../../../themes/app_theme.dart';
import '../../../themes/extensions/custom_designs.dart';
import '../../views/base_builders/app_consumer.dart';
import '../../views/buttons/change_language.dart';
import '../../views/fields/password_field.dart';
import 'components/sign_in_button.dart';
import 'components/sign_in_field.dart';

class AuthPage extends StatefulWidget with AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (_) => locator(),
      child: this,
    );
  }

  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  AuthCubit get _cubit => context.read();
  AppLocalizations get _strings => context.strings;
  ColorScheme get _colorScheme => context.colorScheme;
  TextTheme get _textTheme => context.textTheme;
  CustomDesigns get _designs => context.designs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: context.designs.gradient),
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return AppConsumer<AuthCubit, AuthState>(
      withScaffold: false,
      listenDefault: (context, state) {
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
      builder: (state) {
        return SafeArea(
          child: Stack(
            children: [
              ListView(
                children: [
                  const SizedBox(height: 18),
                  _buildLogo(),
                  const SizedBox(height: 18),
                  _buildAnonymousButton(),
                  const SizedBox(height: 8),
                  _buildGoogleButton(),
                ],
              ),
              const Positioned(
                top: 8,
                right: 4,
                child: ChangeLanguage(),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildLogo() {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    final size = shortestSide * 0.6;
    return SizedBox(
      height: size,
      width: size,
      child: Assets.images.launcherIcon.image(),
    );
  }

  Widget _buildGoogleButton() {
    return SignInButton(
      type: SignType.google,
      onTap: _cubit.signInGoogle,
    ).wrap;
  }

  Widget _buildAnonymousButton() {
    return SignInButton(
      type: SignType.anonymous,
      onTap: _cubit.signInAnonymously,
    ).wrap;
  }
}

extension WidgetExt on Widget {
  Widget get wrap {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: this,
    );
  }
}
