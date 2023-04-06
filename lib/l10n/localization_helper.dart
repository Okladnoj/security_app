import 'dart:ui';

import 'package:flutter/widgets.dart';

import '../gen/assets.gen.dart';
import 'generated/app_localizations.dart';
import 'generated/app_localizations_en.dart';

export 'generated/app_localizations.dart';

Locale helpLocale = window.locale;
const defaultLocale = Locale('en');
final defaultLocalize = AppLocalizationsEn(defaultLocale.languageCode);

AppLocalizations getLocaleLocalizations([Locale? locale]) {
  Locale? local;
  if (locale == null) {
    local = helpLocale;
  } else {
    local = locale;
  }

  final localeSupported = AppLocalizations.supportedLocales.contains(local);

  if (!localeSupported) return defaultLocalize;

  return lookupAppLocalizations(local);
}

String getLocaleFlag(Locale locale) {
  return getLocaleLocalizations(locale).flag;
}

AppLocalizations _getLocalizations(BuildContext context) {
  final localizations = AppLocalizations.of(context);
  if (localizations != null) return localizations;
  return defaultLocalize;
}

String _getLocaleSvgFlag(Locale locale) {
  return {
        const Locale('en'): Assets.svg.flagGb,
        const Locale('ru'): Assets.svg.flagRu,
      }[locale] ??
      Assets.svg.flagGb;
}

extension ContextExt on BuildContext {
  AppLocalizations get strings => _getLocalizations(this);
}

extension LocaleExt on Locale {
  AppLocalizations get localization => getLocaleLocalizations(this);
  String get name => localization.languageName;
  String get flag => localization.flag;
  String get flagSvg => _getLocaleSvgFlag(this);
}
