import 'package:flutter/material.dart';

import '../../../themes/app_theme.dart';
import 'app_circle_button.dart';

class AppCircleCounter extends StatelessWidget {
  final List<String> assets;
  final String text;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;

  const AppCircleCounter({
    super.key,
    required this.assets,
    required this.onPressed,
    this.onLongPress,
    this.text = '',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var asset in assets) ...[
          AppCircleButton.fromSvgAsset(
            asset: asset,
            onPressed: onPressed,
            onLongPress: onLongPress,
          ),
          const SizedBox(width: 4),
        ],
        Text(
          text,
          style: context.textTheme.titleLarge?.copyWith(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
