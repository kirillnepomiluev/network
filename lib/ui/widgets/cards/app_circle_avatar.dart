import 'package:flutter/material.dart';

class AppCircleAvatar extends StatelessWidget {
  final String imageUrl;
  final double contSize;
  const AppCircleAvatar(
      {Key? key, required this.imageUrl, required this.contSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.fitHeight,
          // alignment: Alignment.bottomCenter
        ),
      ),
      width: contSize, //120
      height: contSize,
    );
  }
}
