import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../gen/assets.gen.dart';
import '../../../l10n/localization_helper.dart';
import '../../../themes/app_theme.dart';
import '../design/app_shader_mask.dart';
import 'app_bottom_sheet.dart';

class LanguageBottomSheet {
  final BuildContext _context;

  const LanguageBottomSheet._(this._context);

  factory LanguageBottomSheet.of(BuildContext context) {
    return LanguageBottomSheet._(context);
  }

  Future<Locale?> showLanguageDialog(
    Locale? currentLocale,
  ) async {
    final action = AppBottomSheet<Locale?>.of(_context);
    final selectedLocale = await action.showBottomSheet(
      body: Material(
        color: _context.designs.light.tone75,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: SizedBox(
          height: 356,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            child: Column(
              children: [
                _buildTitle(),
                const SizedBox(height: 18),
                _buildDivider(),
                Expanded(child: _buildContent(currentLocale)),
              ],
            ),
          ),
        ),
      ),
    );
    if (currentLocale == selectedLocale) return null;

    return selectedLocale;
  }

  Widget _buildTitle() {
    return Text(
      _context.strings.languages,
      style: _context.textTheme.bodyLarge?.copyWith(
        fontVariations: FontVariantConfigs.w700,
      ),
    );
  }

  Widget _buildContent(Locale? currentLocale) {
    return AppShaderMask(
      child: ListView(
        children: [
          const SizedBox(height: 24),
          _buildLanguageSection(currentLocale),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildLanguageSection(Locale? currentLocale) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _context.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _context.designs.light.tone300),
      ),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: AppLocalizations.supportedLocales.length,
        itemBuilder: (_, index) {
          final locale = AppLocalizations.supportedLocales[index];
          return _buildLanguageTile(
            locale: locale,
            current: currentLocale == locale,
          );
        },
        separatorBuilder: (_, __) => _buildDivider(),
      ),
    );
  }

  Widget _buildLanguageTile({
    required Locale locale,
    bool current = false,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.of(_context).pop(locale);
      },
      child: ListTile(
        leading: _buildIcon(locale),
        minLeadingWidth: 20,
        title: Text(
          locale.name,
          style: _context.textTheme.bodyLarge,
        ),
        trailing: _buildTrailing(current),
      ),
    );
  }

  Widget _buildIcon(Locale locale) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        color: _context.designs.light.tone300,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(1),
      child: ClipOval(
        child: SvgPicture.asset(
          locale.flagSvg,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: _context.designs.light.tone300,
      height: 1,
      thickness: 1,
    );
  }

  Widget? _buildTrailing(bool current) {
    if (!current) return null;

    return SvgPicture.asset(Assets.svg.checkLanguage);
  }
}
