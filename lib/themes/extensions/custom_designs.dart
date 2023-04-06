import 'package:flutter/material.dart';

@immutable
class CustomDesigns extends ThemeExtension<CustomDesigns> {
  final LinearGradient gradient;
  final List<BoxShadow> shadowSignIn;
  final List<BoxShadow> shadowReactions;
  final ColorsSet dark;
  final ColorsSet light;
  final ColorsSet main;
  final ColorsSet secondary;
  final ColorsSet success;
  final ColorsSet red;
  final ColorsSet orange;
  final ColorsSet blue;

  const CustomDesigns._({
    required this.gradient,
    required this.shadowSignIn,
    required this.shadowReactions,
    required this.dark,
    required this.light,
    required this.main,
    required this.secondary,
    required this.success,
    required this.red,
    required this.orange,
    required this.blue,
  });

  factory CustomDesigns.dark() {
    // TODO: change if we will add Dark Theme
    return CustomDesigns.light();
  }
  factory CustomDesigns.light() {
    return const CustomDesigns._(
      gradient: LinearGradient(
        colors: [
          Color(0xFF776DEB),
          Color(0x00D3FFB0),
          Color(0xBAF05050),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [
          0.00,
          0.55,
          1.0,
        ],
      ),
      shadowSignIn: [
        BoxShadow(
          color: Color(0x26000000),
          blurRadius: 24,
          offset: Offset(0, 6),
        ),
      ],
      shadowReactions: [
        BoxShadow(
          color: Color(0xFFc4cad3),
          blurRadius: 8,
          offset: Offset(0, 2),
        ),
      ],
      dark: ColorsSet(
        tone50: Color(0xFFE7EAEC),
        tone100: Color(0xFFB5BFC4),
        tone200: Color(0xFF919FA8),
        tone300: Color(0xFF5F7480),
        tone400: Color(0xFF405968),
        tone500: Color(0xFF102F42),
        tone600: Color(0xFF0F2B3C),
        tone700: Color(0xFF0B212F),
        tone800: Color(0xFF091A24),
        tone900: Color(0xFF07141C),
      ),
      light: ColorsSet(
        tone50: Color(0xFFFDFDFD),
        tone75: Color(0xFFF5F6F7),
        tone100: Color(0xFFF1F3F4),
        tone200: Color(0xFFEAEEEF),
        tone300: Color(0xFFE6EAEC),
        tone400: Color(0xFFA1A4A5),
        tone500: Color(0xFF8C8F90),
      ),
      main: ColorsSet(
        tone50: Color(0xFFE6F9FB),
        tone75: Color(0xFF96E8ED),
        tone100: Color(0xFF6BDEE5),
        tone200: Color(0xFF2BD0DA),
        tone300: Color(0xFF00C6D2),
        tone400: Color(0xFF008B93),
        tone500: Color(0xFF007980),
      ),
      secondary: ColorsSet(
        tone50: Color(0xFFE8EDFB),
        tone75: Color(0xFF9FB6EF),
        tone100: Color(0xFF7798E8),
        tone200: Color(0xFF3C6CDE),
        tone300: Color(0xFF144ED7),
        tone400: Color(0xFF0E3797),
        tone500: Color(0xFF0C3083),
      ),
      success: ColorsSet(
        tone50: Color(0xFFE6FCF5),
        tone75: Color(0xFF96F2D8),
        tone100: Color(0xFF6BEDC7),
        tone200: Color(0xFF2BE5AF),
        tone300: Color(0xFF00E09F),
        tone400: Color(0xFF009D6F),
        tone500: Color(0xFF008961),
      ),
      red: ColorsSet(
        tone50: Color(0xFFFFE6E8),
        tone75: Color(0xFFFF96A1),
        tone100: Color(0xFFFF6B7A),
        tone200: Color(0xFFFF2B40),
        tone300: Color(0xFFFF0019),
        tone400: Color(0xFFB30012),
        tone500: Color(0xFF9C000F),
      ),
      orange: ColorsSet(
        tone50: Color(0xFFFFF6E6),
        tone75: Color(0xFFFFD896),
        tone100: Color(0xFFFFC86B),
        tone200: Color(0xFFFFB02B),
        tone300: Color(0xFFFFA000),
        tone400: Color(0xFFB37000),
        tone500: Color(0xFF9C6200),
      ),
      blue: ColorsSet(
        tone25: Color(0xFFF3FEFF),
        tone50: Color(0xFFBCECF0),
        tone75: Color(0xFF84DAE0),
        tone100: Color(0xFF4DC8D1),
        tone200: Color(0xFF15b6c1),
      ),
    );
  }

  @override
  ThemeExtension<CustomDesigns> lerp(
      ThemeExtension<CustomDesigns>? other, double t) {
    if (other is! CustomDesigns) {
      return this;
    }
    return copyWith(
      gradient: LinearGradient.lerp(gradient, other.gradient, t),
    );
  }

  @override
  ThemeExtension<CustomDesigns> copyWith({
    LinearGradient? gradient,
    List<BoxShadow>? shadowSignIn,
    List<BoxShadow>? shadowReactions,
    ColorsSet? dark,
    ColorsSet? light,
    ColorsSet? main,
    ColorsSet? secondary,
    ColorsSet? success,
    ColorsSet? red,
    ColorsSet? orange,
    ColorsSet? blue,
  }) {
    return CustomDesigns._(
        gradient: gradient ?? this.gradient,
        shadowSignIn: shadowSignIn ?? this.shadowSignIn,
        shadowReactions: shadowReactions ?? this.shadowReactions,
        dark: dark ?? this.dark,
        light: light ?? this.light,
        main: main ?? this.main,
        secondary: secondary ?? this.secondary,
        success: success ?? this.success,
        red: red ?? this.red,
        orange: orange ?? this.orange,
        blue: blue ?? this.blue);
  }
}

class ColorsSet {
  final Color tone25;
  final Color tone50;
  final Color tone75;
  final Color tone100;
  final Color tone200;
  final Color tone300;
  final Color tone400;
  final Color tone500;
  final Color tone600;
  final Color tone700;
  final Color tone800;
  final Color tone900;

  const ColorsSet({
    this.tone25 = Colors.transparent,
    this.tone50 = Colors.transparent,
    this.tone75 = Colors.transparent,
    this.tone100 = Colors.transparent,
    this.tone200 = Colors.transparent,
    this.tone300 = Colors.transparent,
    this.tone400 = Colors.transparent,
    this.tone500 = Colors.transparent,
    this.tone600 = Colors.transparent,
    this.tone700 = Colors.transparent,
    this.tone800 = Colors.transparent,
    this.tone900 = Colors.transparent,
  });
}
