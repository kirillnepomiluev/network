import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/ui/widgets/cards/bottom_sheet_min_patinr.dart';


class ProfileBottomCurve extends StatelessWidget {
  final VoidCallback openBottomSheetProfile;
  const ProfileBottomCurve({
    Key? key, required this.openBottomSheetProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final double contWidth = mediaWidth; //375
    final double contHeight = contWidth * 0.392;
    return Container(
      height: contHeight,
      alignment: Alignment.bottomCenter,
      color: Colors.transparent,
      child: GestureDetector(
          onTap: openBottomSheetProfile,
          onVerticalDragUpdate: (details) {
            int sensitivity = 8;
            if (details.delta.dy < -sensitivity) {
              openBottomSheetProfile();
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomPaint(
                size: Size(
                    mediaWidth,
                    (mediaWidth * 0.07733333333333334)
                        .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: BottomSheetMinPaint(),
              ),
              BlurryContainer(
                blur: 20,
                width: mediaWidth,
                height: 75,
                child: Container(),
              )
            ],
          )),
    );
  }
}
