part of 'app_controller_cubit.dart';

@immutable
class AppControllerState extends BaseState {
  final Locale locale;
  final ThemeType themeType;
  final String? fontFamily;

  const AppControllerState({
    super.status,
    super.message,
    this.locale = const Locale('en'),
    this.themeType = ThemeType.light,
    this.fontFamily,
  });

  @override
  List<Object?> get props {
    return [
      ...super.props,
      locale,
      themeType,
      fontFamily,
    ];
  }

  AppControllerState copyWith({
    StateStatus? status,
    String? message,
    Locale? locale,
    ThemeType? themeType,
    String? fontFamily,
  }) {
    return AppControllerState(
      status: status ?? super.status,
      message: message ?? super.message,
      locale: locale ?? this.locale,
      themeType: themeType ?? this.themeType,
      fontFamily: fontFamily ?? this.fontFamily,
    );
  }
}
