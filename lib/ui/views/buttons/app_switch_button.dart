import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../gen/assets.gen.dart';
import '../../../themes/app_theme.dart';

class AppSwitchButton extends StatelessWidget {
  static const double _hightButton = 32;
  static const double _widthButton = 52;
  static const double _marginButton = 2;
  final _duration = const Duration(milliseconds: 150);

  final bool enable;
  final void Function(bool)? onTap;

  const AppSwitchButton({
    super.key,
    this.enable = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final designs = context.designs;
    return GestureDetector(
      onTap: () => onTap?.call(!enable),
      child: Container(
        height: _hightButton,
        width: _widthButton,
        decoration: BoxDecoration(
          color: enable ? designs.main.tone300 : designs.dark.tone200,
          borderRadius: BorderRadius.circular(_hightButton / 2),
        ),
        child: AnimatedAlign(
          alignment: enable ? Alignment.centerRight : Alignment.centerLeft,
          duration: _duration,
          child: Container(
            height: _hightButton - 2 * _marginButton,
            width: _hightButton - 2 * _marginButton,
            margin: const EdgeInsets.all(_marginButton),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              borderRadius: BorderRadius.circular(_hightButton / 2),
            ),
            child: AnimatedOpacity(
              duration: _duration,
              opacity: enable ? 1 : 0,
              child: SvgPicture.asset(Assets.svg.checkbox),
            ),
          ),
        ),
      ),
    );
  }
}
