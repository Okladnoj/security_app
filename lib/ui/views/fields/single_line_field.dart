import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../themes/app_theme.dart';

class SingleLineField extends StatelessWidget {
  final TextEditingController controller;
  final int? maxLength;
  final String? hintText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool withBorder;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final bool isDense;
  final int? maxLines;
  final TextInputType? textInputType;

  const SingleLineField({
    super.key,
    this.maxLength,
    required this.controller,
    this.hintText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.withBorder = true,
    this.backgroundColor,
    this.borderRadius,
    this.isDense = true,
    this.maxLines = 1,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: !withBorder
          ? BorderSide.none
          : BorderSide(
              color: context.colorScheme.outline,
            ),
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      gapPadding: 1,
    );
    final focusedBorder = border.copyWith(
      borderSide: !withBorder
          ? BorderSide.none
          : BorderSide(
              color: context.colorScheme.onSecondary,
            ),
    );
    final focusedErrorBorder = border.copyWith(
      borderSide: !withBorder
          ? BorderSide.none
          : BorderSide(
              color: context.designs.red.tone400,
            ),
    );
    return TextFormField(
      key: key,
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
      style: context.textTheme.bodyLarge,
      scrollPadding: const EdgeInsets.only(),
      keyboardType: textInputType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        border: InputBorder.none,
        fillColor: backgroundColor ?? context.colorScheme.surface,
        filled: true,
        focusedBorder: focusedBorder,
        disabledBorder: border,
        errorBorder: border,
        focusedErrorBorder: focusedErrorBorder,
        enabledBorder: border,
        isDense: isDense,
        errorMaxLines: 3,
        counterStyle: context.textTheme.bodyLarge,
        hintStyle: context.textTheme.bodyMedium,
        errorText: errorText,
      ),
    );
  }
}
