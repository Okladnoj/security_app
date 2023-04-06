import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../base/bloc/base_cubit.dart';
import '../../gen/fonts.gen.dart';
import '../../l10n/localization_helper.dart';
import '../../services/storage/fonts/fonts_service.dart';
import '../../services/storage/locale/locale_service.dart';
import '../../services/storage/theme/theme_service.dart';
import '../../themes/app_theme.dart';

part 'app_controller_state.dart';

@injectable
class AppControllerCubit extends BaseCubit<AppControllerState> {
  final LocaleService _localeService;
  final ThemeService _themeService;
  final FontsService _fontsService;

  AppControllerCubit(
    this._localeService,
    this._themeService,
    this._fontsService,
  ) : super(const AppControllerState());

  Future<void> init() async {
    emit(state.copyWith(
      locale: _getLocale(),
      themeType: _themeService.getTheme(),
      fontFamily: _fontsService.getFontFamily() ?? FontFamily.poppins,
    ));
  }

  Future<void> changeLanguage(Locale locale) async {
    helpLocale = locale;
    emit(state.copyWith(locale: locale));
    await _localeService.saveLocale(locale);
  }

  Future<void> changeTheme(ThemeType themeType) async {
    emit(state.copyWith(themeType: themeType));
    await _themeService.saveTheme(themeType);
  }

  Future<void> changeFontFamily(String fontFamily) async {
    emit(state.copyWith(fontFamily: fontFamily));
    await _fontsService.saveFontFamily(fontFamily);
  }

  Locale _getLocale() {
    final locale = _localeService.getLocale();
    helpLocale = locale;
    return locale;
  }

  @override
  void handleError(String message) {
    emit(state.copyWith(
      status: StateStatus.error,
      message: message,
    ));
  }
}
