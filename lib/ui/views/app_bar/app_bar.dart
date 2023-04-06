import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../gen/assets.gen.dart';
import '../../../themes/app_theme.dart';

class TitleAppBar extends StatelessWidget {
  final String title;

  const TitleAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    const size = 32.0;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 6),
      child: Row(
        children: [
          GestureDetector(
            child: SvgPicture.asset(
              Assets.svg.chevronLeft,
              width: size,
              height: size,
            ),
            onTap: () => Navigator.pop(context),
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge?.copyWith(
                fontSize: 18,
                fontVariations: FontVariantConfigs.w700,
                color: context.designs.dark.tone700,
              ),
            ),
          ),
          const SizedBox(width: size),
        ],
      ),
    );
  }
}
