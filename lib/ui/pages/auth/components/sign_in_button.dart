import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../l10n/localization_helper.dart';
import '../../../../themes/app_theme.dart';
import '../../../views/buttons/app_button.dart';

enum SignType {
  anonymous,
  google,
}

class SignInButton extends StatelessWidget {
  final SignType type;
  final VoidCallback onTap;

  const SignInButton({
    super.key,
    required this.type,
    required this.onTap,
  });

  BorderRadius get _border {
    return BorderRadius.circular(8);
  }

  @override
  Widget build(BuildContext context) {
    return AppButton(
      borderRadius: _border,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: context.designs.secondary.tone75,
          borderRadius: _border,
        ),
        child: Row(
          children: [
            _buildIcon(),
            Expanded(child: _buildText()),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    late String path;
    const size = 36.0;

    switch (type) {
      case SignType.anonymous:
        path = Assets.svg.anonymous;
        break;
      case SignType.google:
        path = Assets.svg.googleIcon;
        break;
    }

    return SvgPicture.asset(
      path,
      width: size,
      height: size,
    );
  }

  Widget _buildText() {
    return Builder(builder: (context) {
      late String text;

      switch (type) {
        case SignType.anonymous:
          text = context.strings.signInAnonymously;
          break;
        case SignType.google:
          text = context.strings.signInGoogle;
          break;
      }
      return Text(
        text,
        textAlign: TextAlign.center,
        style: context.textTheme.titleMedium,
      );
    });
  }
}
