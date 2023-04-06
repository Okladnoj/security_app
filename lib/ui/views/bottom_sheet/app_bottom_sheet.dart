import 'package:flutter/material.dart';

import '../../../themes/app_theme.dart';

class AppBottomSheet<T> {
  final BuildContext _context;

  const AppBottomSheet._(this._context);

  factory AppBottomSheet.of(BuildContext context) => AppBottomSheet._(context);

  Future<T?> showBottomSheet({
    required Widget body,
  }) {
    return showModalBottomSheet<T>(
      context: _context,
      isScrollControlled: true,
      backgroundColor: _context.designs.light.tone900,
      elevation: 0,
      builder: (_) => body,
    );
  }
}
