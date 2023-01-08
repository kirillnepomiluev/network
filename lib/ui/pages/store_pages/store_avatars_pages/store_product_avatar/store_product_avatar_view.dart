import 'package:auto_route/auto_route.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/navigation/app_router.gr.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/common/stat_column.dart';
import 'package:network_app/ui/widgets/common/general_widgets.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StoreProductAvatarView extends StatefulWidget {
  final String title;
  final String imageURL;
  const StoreProductAvatarView({Key? key, required this.title, required this.imageURL}) : super(key: key);

  @override
  State<StoreProductAvatarView> createState() => _StoreProductAvatarViewState();
}

class _StoreProductAvatarViewState extends State<StoreProductAvatarView> {


  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final mediaTop = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      extendBodyBehindAppBar: false,
      extendBody: false,
      // backgroundColor: ConstColor.blackBack,
      bottomNavigationBar: BlurryContainer(
        blur: 50,
        width: MediaQuery.of(context).size.width,
        height: 105,
        color: AppColors.black1A.withOpacity(0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Padding(
              padding: EdgeInsets.only(
                left: 37,
                  right: 0.08 * mediaWidth)
              , //30
              child: Text(
                '1.6 SOL',
                style: TextStyle(
                    color: AppColors.salad,
                    fontSize: 18.sp, //16
                    fontWeight: FontWeight.w600),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                  ),
                  onPressed: () {
                    openSuccessSheet(context: context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 15
                    ),
                    child: Text(
                      'Купить сейчас',
                      style: TextStyle(
                          fontSize: 18.sp, //16
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  )),
            )

          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: mediaTop),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              viewProdImage(),

              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 16, vertical: 31),
                child: StatColumn(ifProfileSheet: false),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget viewProdImage() {
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
        widget.imageURL,
              fit: BoxFit.contain,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Text(
            widget.title,
            style: const TextStyle(
                      color: AppColors.salad,
                      fontSize: 26, //14
                      fontWeight: FontWeight.w600
                  ),
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
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: AppColors.white10,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'Редкий',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp, //14
                      fontWeight: FontWeight.w400
                  ),
                )),
          ),

        ],
      ),
    );
  }

}

void openSuccessSheet({required BuildContext context,}) {

  showModalBottomSheet<void>(
    barrierColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      context: context,
      builder: (BuildContext context) => BlurryContainer(
        blur: 60,
        color: Colors.black.withOpacity(0.5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 70),
                child: Icon(
                  NetworkIcons.check_circle_outlined,
                  size: 100,
                  color: AppColors.salad,
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 60),
                child: RichTextTwo(
                    text1: 'Оплата прошла ',
                    text2: 'успешно',
                    // fontSize: 20,
                  fontWeight1: FontWeight.w400,
                  fontWeight2: FontWeight.w700,
                ),
              ),


              const Padding(
                padding: EdgeInsets.only(top: 60),
                child: Text('Новый головной убор вы можете\nнайти в своем шкафу',
                textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 150, bottom: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: buttonStyleCustom(
                          color: Colors.white,
                          padH: 0, padV: 22, radius: 20),
                      onPressed: () {
                        context.router.push(HomeViewRoute(initIndex: 1, isCupboard: true));
                      },
                      child: Text(
                        'Перейти в шкаф',
                        style: TextStyle(
                            fontSize: 18.5.sp, //18
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        ),
                      )),
                ),
              ),


            ],
          ),
        ),
      )
  );
}