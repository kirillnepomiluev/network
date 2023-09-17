import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:network_app/utils/utils.dart';

class AppCachedImage extends StatelessWidget {
  const AppCachedImage(this.url, {
    super.key,
    this.height, this.width, this.fit = BoxFit.cover,
  });
  final String url;
  final double? height;
  final double? width;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      cacheManager: AppCacheManager.instance,
      imageUrl: url,
      fit: fit,
      width: width,
      height: height,
    );
  }
}
