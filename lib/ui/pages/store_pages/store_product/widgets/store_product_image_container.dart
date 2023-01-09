import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StoreProductImageContainer extends StatelessWidget {
  final String title;
  final String imageURL;
  const StoreProductImageContainer({
    Key? key, required this.title, required this.imageURL,
  }) : super(key: key);

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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AppBackButton(),
          SizedBox(
            height: 270,
            child: Image.asset(
              imageURL,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: AppColors.salad,
                      fontSize: 26, //14
                      fontWeight: FontWeight.w600),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 7),
                  child: Text(
                    '#0863246',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 24, //12
                      // color: ConstColor.textWhite,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 20),
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: AppColors.white10,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'Редкий',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp, //14
                      fontWeight: FontWeight.w400),
                )),
          ),
        ],
      ),
    );
  }
}
