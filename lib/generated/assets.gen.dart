/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAbiGen {
  const $AssetsAbiGen();

  /// File path: assets/abi/abi.json
  String get abi => 'assets/abi/abi.json';

  /// File path: assets/abi/erc20.json
  String get erc20 => 'assets/abi/erc20.json';

  /// File path: assets/abi/erc721.json
  String get erc721 => 'assets/abi/erc721.json';

  /// List of all assets
  List<String> get values => [abi, erc20, erc721];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesAvatarsGen get avatars => const $AssetsImagesAvatarsGen();
  $AssetsImagesHatsGen get hats => const $AssetsImagesHatsGen();
  $AssetsImagesIconsGen get icons => const $AssetsImagesIconsGen();
}

class $AssetsImagesAvatarsGen {
  const $AssetsImagesAvatarsGen();

  /// File path: assets/images/avatars/avatar_0.png
  AssetGenImage get avatar0 =>
      const AssetGenImage('assets/images/avatars/avatar_0.png');

  /// File path: assets/images/avatars/avatar_1.png
  AssetGenImage get avatar1 =>
      const AssetGenImage('assets/images/avatars/avatar_1.png');

  /// File path: assets/images/avatars/avatar_2.png
  AssetGenImage get avatar2 =>
      const AssetGenImage('assets/images/avatars/avatar_2.png');

  /// File path: assets/images/avatars/avatar_3.png
  AssetGenImage get avatar3 =>
      const AssetGenImage('assets/images/avatars/avatar_3.png');

  /// File path: assets/images/avatars/avatar_3D.png
  AssetGenImage get avatar3D =>
      const AssetGenImage('assets/images/avatars/avatar_3D.png');

  /// File path: assets/images/avatars/avatar_4.png
  AssetGenImage get avatar4 =>
      const AssetGenImage('assets/images/avatars/avatar_4.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [avatar0, avatar1, avatar2, avatar3, avatar3D, avatar4];
}

class $AssetsImagesHatsGen {
  const $AssetsImagesHatsGen();

  /// File path: assets/images/hats/hat_1.png
  AssetGenImage get hat1 => const AssetGenImage('assets/images/hats/hat_1.png');

  /// File path: assets/images/hats/hat_2.png
  AssetGenImage get hat2 => const AssetGenImage('assets/images/hats/hat_2.png');

  /// List of all assets
  List<AssetGenImage> get values => [hat1, hat2];
}

class $AssetsImagesIconsGen {
  const $AssetsImagesIconsGen();

  /// File path: assets/images/icons/handshake.png
  AssetGenImage get handshake =>
      const AssetGenImage('assets/images/icons/handshake.png');

  /// File path: assets/images/icons/logo_facebook.png
  AssetGenImage get logoFacebook =>
      const AssetGenImage('assets/images/icons/logo_facebook.png');

  /// File path: assets/images/icons/logo_google.png
  AssetGenImage get logoGoogle =>
      const AssetGenImage('assets/images/icons/logo_google.png');

  /// List of all assets
  List<AssetGenImage> get values => [handshake, logoFacebook, logoGoogle];
}

class Assets {
  Assets._();

  static const $AssetsAbiGen abi = $AssetsAbiGen();
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

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
