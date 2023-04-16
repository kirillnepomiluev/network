import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/utils/res.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StoreProductImageContainer extends StatelessWidget {
  const StoreProductImageContainer({
    Key? key,
    required this.title,
    required this.imageURL,
  }) : super(key: key);
  final String title;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    return Container(
      width: mediaWidth,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white10,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(50)),
      ),
      child: Column(
        children: [
          const AppBackButton(),

          SizedBox(
            height: 72.sp, //270
            child:
            imageURL.isEmpty
            ? Container()
            : Image.network(
              imageURL,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: Res.s26,
          ),
          Column(
            children: [
              Text(title,
                  style: AppTextStyles.salad26
                      .copyWith(fontWeight: FontWeight.w600),),
              Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Text('#0863246', style: AppTextStyles.primary24),
              ),
            ],
          ),
          SizedBox(
            height: Res.s25,
          ),
          Container(
              padding: EdgeInsets.symmetric(
                  vertical: Res.s10,
                  horizontal: Res.s20,),
              decoration: BoxDecoration(
                  color: AppColors.white10,
                  borderRadius: BorderRadius.circular(10),),
              child: const Text(
                'Редкий',
              ),),
          SizedBox(
            height: Res.s20,
          ),
        ],
      ),
    );
  }
}