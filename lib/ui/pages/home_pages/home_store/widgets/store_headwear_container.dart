import 'package:flutter/material.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/utils/res.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StoreHeadwearContainer extends StatelessWidget {
  const StoreHeadwearContainer(
      {Key? key, required this.type, this.isView = false,})
      : super(key: key);
  final bool isView;
  final String type;

  @override
  Widget build(BuildContext context) {
    final double contWidth = 52.sp;
    final double contHeight = isView ? 74.sp : 68.sp;
    return AppContainer(
      padH: Res.s15,
      padV: Res.s15,
      radius: AppBorderRadius.r15,
      width: contWidth,
      height: contHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            type,
            style: AppTextStyles.primary.copyWith(fontWeight: FontWeight.w600),
          ),
          // SizedBox(height: 24.sp,), //27
          Center(
            child: AppContainer(
              height: contWidth,
              radius: AppBorderRadius.r10,
              color: Colors.transparent,
              child: Image.asset(
                type == 'Обычный'
                    ? Assets.images.hats.hat2.keyName
                    : Assets.images.hats.hat1.keyName,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // const SizedBox(height: 27,),
          Column(
            children: [
              Text('1.6 SOL',
                  style: AppTextStyles.salad16
                      .copyWith(fontWeight: FontWeight.w600),),
              const SizedBox(
                height: 5,
              ),
              Text('#0863246', style: AppTextStyles.primary12),
            ],
          ),
        ],
      ),
    );
  }
}
