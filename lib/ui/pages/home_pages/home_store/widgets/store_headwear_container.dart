import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';

class StoreHeadwearContainer extends StatelessWidget {
  final bool isView;
  final String type;
  const StoreHeadwearContainer({Key? key, required this.type, this.isView = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final double contWidth = isView
        ? 0.445*mediaWidth          //167
        : 0.37*mediaWidth;   //138.82
    final double imageHeight = isView? contWidth*0.65 : contWidth;

    return Padding(
      padding: EdgeInsets.only(right:  isView? 0 : 15),
      child: InkWell(
        onTap: (() {
          context.router.push(StoreProductViewRoute(
              title: 'Шляпа ведьмы',
              imageURL: Assets.images.hats.hat1.keyName
          ));

        }),
        child: AppContainer(
          padH: 15,
          padV: 15,
          radius: AppBorderRadius.r15,
          width: contWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                type,
                style: AppTextStyles.primary.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 27,),
              Container(
                height: imageHeight,  // contHeight- 120.1,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          type == 'Обычный'
                              ? Assets.images.hats.hat2.keyName
                              : Assets.images.hats.hat1.keyName,
                        )
                    ),
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(10)),
              ),
              const SizedBox(height: 27,),
              Text(
                  '1.6 SOL',
                  style: AppTextStyles.salad16.copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(height: 5,),
              Text(
                  '#0863246',
                  style: AppTextStyles.primary12
              ),
            ],
          ),
        ),
      ),
    );
  }
}
