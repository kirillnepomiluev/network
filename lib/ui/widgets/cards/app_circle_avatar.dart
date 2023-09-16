import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/utils/utils.dart';

class AppCircleAvatar extends StatelessWidget {
  const AppCircleAvatar(
      {Key? key, this.avatarUrl='', required this.contSize, this.isAssetImage = true,})
      : super(key: key);
  final String avatarUrl;
  final double contSize;
  final bool isAssetImage;

  @override
  Widget build(BuildContext context) {
    // final url = imageUrl.isEmpty? Assets.images.avatars.avatar0.keyName : imageUrl;
    final url = avatarUrl.isEmpty? AppConstants.baseAvatarUrl : avatarUrl;
    return
      // CircleAvatar(
      //   backgroundImage:  CachedNetworkImageProvider(url),
      //   radius: 20,
      // );
      Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        image:
        isAssetImage?
        DecorationImage(
          image: AssetImage(avatarUrl),
          fit: BoxFit.cover,
          // alignment: Alignment.bottomCenter
        )
        :
        DecorationImage(
          image: CachedNetworkImageProvider(url, cacheManager: AppCacheManager.instance),
          // image: NetworkImage(url),
          fit: BoxFit.cover,
          // alignment: Alignment.bottomCenter
        ),
      ),
      width: contSize, //120
      height: contSize,
    );
  }
}
