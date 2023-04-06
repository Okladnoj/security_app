import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../themes/app_theme.dart';

class AppCircleButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;

  const AppCircleButton._({
    super.key,
    required this.child,
    required this.onPressed,
    required this.onLongPress,
  });

  factory AppCircleButton.fromSvgAsset({
    Key? key,
    required String asset,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
  }) {
    return AppCircleButton._(
      key: key,
      onPressed: onPressed,
      onLongPress: onLongPress,
      child: SvgPicture.asset(asset),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: 32,
      child: TextButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(90),
          ),
          backgroundColor: context.designs.light.tone900,
          padding: const EdgeInsets.only(),
        ),
        child: child,
      ),
    );
  }
}
