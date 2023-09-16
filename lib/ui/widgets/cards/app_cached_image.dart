import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:network_app/utils/utils.dart';

class AppCachedImage extends StatelessWidget {
  const AppCachedImage({
    super.key,
    required this.url, this.height, this.width,
  });
  final String url;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      cacheManager: AppCacheManager.instance,
      imageUrl: url,
      fit: BoxFit.cover,
      width: width,
      height: height,
    );
  }
}
