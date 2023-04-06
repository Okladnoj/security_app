import 'package:flutter/material.dart';

import '../../../themes/app_theme.dart';
import 'app_button.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;

  const AppTextButton({
    super.key,
    required this.text,
    this.onTap,
    this.borderRadius,
  });

  BorderRadius get _border => BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return AppButton(
      borderRadius: _border,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: context.designs.blue.tone75,
          borderRadius: _border,
        ),
        child: Row(
          children: [
            Expanded(child: _buildText()),
          ],
        ),
      ),
    );
  }

  Widget _buildText() {
    return Builder(
      builder: (context) {
        return Text(
          text,
          textAlign: TextAlign.center,
          style: context.textTheme.titleMedium,
        );
      },
    );
  }
}
