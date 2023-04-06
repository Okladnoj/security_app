/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/launcher_icon.png
  AssetGenImage get launcherIcon =>
      const AssetGenImage('assets/images/launcher_icon.png');

  /// File path: assets/images/splash_background.png
  AssetGenImage get splashBackground =>
      const AssetGenImage('assets/images/splash_background.png');

  /// File path: assets/images/splash_icon.png
  AssetGenImage get splashIcon =>
      const AssetGenImage('assets/images/splash_icon.png');

  /// File path: assets/images/splash_icon_android_12.png
  AssetGenImage get splashIconAndroid12 =>
      const AssetGenImage('assets/images/splash_icon_android_12.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [launcherIcon, splashBackground, splashIcon, splashIconAndroid12];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/anonymous.svg
  String get anonymous => 'assets/svg/anonymous.svg';

  /// File path: assets/svg/check_language.svg
  String get checkLanguage => 'assets/svg/check_language.svg';

  /// File path: assets/svg/checkbox.svg
  String get checkbox => 'assets/svg/checkbox.svg';

  /// File path: assets/svg/chevron_left.svg
  String get chevronLeft => 'assets/svg/chevron_left.svg';

  /// File path: assets/svg/empty_icon.svg
  String get emptyIcon => 'assets/svg/empty_icon.svg';

  /// File path: assets/svg/file.svg
  String get file => 'assets/svg/file.svg';

  /// File path: assets/svg/flag_gb.svg
  String get flagGb => 'assets/svg/flag_gb.svg';

  /// File path: assets/svg/flag_ru.svg
  String get flagRu => 'assets/svg/flag_ru.svg';

  /// File path: assets/svg/google_icon.svg
  String get googleIcon => 'assets/svg/google_icon.svg';

  /// File path: assets/svg/lock.svg
  String get lock => 'assets/svg/lock.svg';

  /// File path: assets/svg/mail.svg
  String get mail => 'assets/svg/mail.svg';

  /// File path: assets/svg/search.svg
  String get search => 'assets/svg/search.svg';

  /// File path: assets/svg/user.svg
  String get user => 'assets/svg/user.svg';

  /// List of all assets
  List<String> get values => [
        anonymous,
        checkLanguage,
        checkbox,
        chevronLeft,
        emptyIcon,
        file,
        flagGb,
        flagRu,
        googleIcon,
        lock,
        mail,
        search,
        user
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
