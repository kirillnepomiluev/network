import 'package:flutter/material.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NetworkRow extends StatelessWidget {
  final double opacity;
  final bool isRow;
  const NetworkRow({Key? key, required this.isRow, required this.opacity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isRow == false
        ? Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Assets.images.icons.handshake.image(
            width: 118,
            height: 118,
        ),
        // Image.asset('assets/icons/handshake.png',
        //   width: 118,
        //   height: 118,
        // ),
        _text(isColumn: true),
        // _social(opacity: opacity),
      ],
    )
        : Row(
      mainAxisAlignment:
      isRow ? MainAxisAlignment.start : MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Assets.images.icons.handshake.image(
            width: 46,
            height: 46,
        ),
        // Image.asset('assets/icons/handshake.png',
        //   width: 46,
        //   height: 46,
        // ),
        _text(),
      ],
    );
  }



  Widget _text({bool isColumn = false}) => Padding(
    padding:
    EdgeInsets.only(left: isColumn ? 0 : 15.0, top: isColumn ? 10 : 0),
    child: Text(
      'network',
      style: TextStyle(
          fontSize: 23.5.sp, //34
          color: Colors.white,
          fontWeight: FontWeight.w600),
    ),
  );

}