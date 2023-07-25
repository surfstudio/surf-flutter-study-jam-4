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

  /// File path: assets/images/ball_dark.png
  AssetGenImage get ballDark =>
      const AssetGenImage('assets/images/ball_dark.png');

  /// File path: assets/images/ball_error.png
  AssetGenImage get ballError =>
      const AssetGenImage('assets/images/ball_error.png');

  /// File path: assets/images/ball_light.png
  AssetGenImage get ballLight =>
      const AssetGenImage('assets/images/ball_light.png');

  /// File path: assets/images/ball_loading_dark.png
  AssetGenImage get ballLoadingDark =>
      const AssetGenImage('assets/images/ball_loading_dark.png');

  /// File path: assets/images/ball_loading_light.png
  AssetGenImage get ballLoadingLight =>
      const AssetGenImage('assets/images/ball_loading_light.png');

  /// File path: assets/images/big_stars.png
  AssetGenImage get bigStars =>
      const AssetGenImage('assets/images/big_stars.png');

  /// File path: assets/images/small_star.png
  AssetGenImage get smallStar =>
      const AssetGenImage('assets/images/small_star.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        ballDark,
        ballError,
        ballLight,
        ballLoadingDark,
        ballLoadingLight,
        bigStars,
        smallStar
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
