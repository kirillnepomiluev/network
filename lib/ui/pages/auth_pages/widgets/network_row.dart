import 'package:flutter/material.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class NetworkRow extends StatelessWidget {
  const NetworkRow({
    Key? key,
    required this.isAppBar,
  }) : super(key: key);
  final bool isAppBar;

  @override
  Widget build(BuildContext context) {
    return isAppBar == false
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.images.icons.handshake.image(
                width: 48.sp,   //118
                height: 48.sp,  //118
              ),
              const _Text(isColumn: true),
            ],
          )
        : Row(
            mainAxisAlignment: isAppBar ? MainAxisAlignment.start : MainAxisAlignment.center,
            children: [
              Assets.images.icons.handshake.image(
                width: 30.sp, //46
                height: 30.sp, //46
              ),
              const _Text(),
            ],
          );
  }
}

class _Text extends StatelessWidget {
  const _Text({
    Key? key, this.isColumn = false,
  }) : super(key: key);
  final bool isColumn;

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.only(left: isColumn ? 0 : 15.0, top: isColumn ? 10 : 0),
          child: Text(
            'network',
            style: AppTextStyles.primary32.copyWith(fontWeight: FontWeight.w600),
          ),
        );
  }
}
