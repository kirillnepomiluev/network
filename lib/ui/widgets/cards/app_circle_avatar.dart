import 'package:flutter/material.dart';
import 'package:network_app/generated/assets.gen.dart';

class AppCircleAvatar extends StatelessWidget {
  const AppCircleAvatar(
      {Key? key, required this.imageUrl, required this.contSize,})
      : super(key: key);
  final String imageUrl;
  final double contSize;

  @override
  Widget build(BuildContext context) {

    final url = imageUrl.isEmpty? Assets.images.avatars.avatar0.keyName : imageUrl;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(url),
          fit: BoxFit.fitHeight,
          // alignment: Alignment.bottomCenter
        ),
      ),
      width: contSize, //120
      height: contSize,
    );
  }
}
