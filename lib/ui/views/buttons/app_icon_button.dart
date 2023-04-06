import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../themes/app_theme.dart';

class AppIconButton extends StatelessWidget {
  final String svgPath;
  final String text;
  final Color? backgroundColor;
  final Color? contentColor;
  final VoidCallback? onPressed;

  const AppIconButton({
    super.key,
    required this.svgPath,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.contentColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: _backgroundColor(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: SizedBox(
        height: 32,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svgPath,
              colorFilter: ColorFilter.mode(
                _contentColor(context),
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: context.textTheme.labelLarge?.copyWith(
                color: _contentColor(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _contentColor(BuildContext context) {
    return contentColor ?? context.colorScheme.surface;
  }

  Color _backgroundColor(BuildContext context) {
    return backgroundColor ?? context.colorScheme.secondary;
  }
}
