import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/generated/assets.gen.dart';

class AppCircleAvatar extends StatelessWidget {
  const AppCircleAvatar(
      {Key? key, required this.imageUrl, required this.contSize, this.isAssetImage = true,})
      : super(key: key);
  final String imageUrl;
  final double contSize;
  final bool isAssetImage;

  @override
  Widget build(BuildContext context) {

    // final url = imageUrl.isEmpty? Assets.images.avatars.avatar0.keyName : imageUrl;
    final url = imageUrl.isEmpty? AppConstants.baseAvatarUrl : imageUrl;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        image:
        isAssetImage?
        DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.fitHeight,
          // alignment: Alignment.bottomCenter
        )
        :
        DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.fitHeight,
          // alignment: Alignment.bottomCenter
        ),
      ),
      width: contSize, //120
      height: contSize,
    );
  }
}
