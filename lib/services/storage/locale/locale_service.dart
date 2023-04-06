import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../l10n/localization_helper.dart';

@injectable
class LocaleService {
  static const _localeKey = 'locale';
  final SharedPreferences _storage;

  const LocaleService(this._storage);

  Future<void> saveLocale(Locale locale) async {
    await _storage.setString(_localeKey, locale.languageCode);
  }

  Locale getLocale() {
    final codeLocale = _storage.getString(_localeKey);

    if (codeLocale == null) return defaultLocale;

    return Locale(codeLocale);
  }
}
