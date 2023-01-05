import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/widgets/common/stat_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StoreProductHeadwearView extends StatefulWidget {
  const StoreProductHeadwearView({Key? key}) : super(key: key);

  @override
  State<StoreProductHeadwearView> createState() => _StoreProductHeadwearViewState();
}

class _StoreProductHeadwearViewState extends State<StoreProductHeadwearView> {
  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: ConstColor.blackBack,
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          // borderRadius: BorderRadius.vertical(top: Radius.circular(35))
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.04266 * mediaWidth), //16
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 0.08 * mediaWidth), //30
                child: Text(
                  '1.6 SOL',
                  style: TextStyle(
                      fontSize: 18.sp, //16
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                width: 0.6533 * mediaWidth, //245
                height: 0.6533 * mediaWidth * 0.2245, //55
                child: ElevatedButton(
                    style: ButtonStyle(
                      // padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 22)),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Купить сейчас',
                      style: TextStyle(
                          fontSize: 18.sp, //16
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    )),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // viewAvatarContainer(),

              // viewProdImage(context, isHat: true),

              const Padding(
                padding: EdgeInsets.only(left: 20, top: 30),
                child: Text(
                  'Преимущества',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    StatMiniContainer(title: '', subtitle: AppString.of(context).baseLevel),
                    StatMiniContainer(title: '+10', subtitle: AppString.of(context).ofPoints),
                    StatMiniContainer(title: '+0.2', subtitle: AppString.of(context).rating),
                  ],
                ),
              ),

              // _statColumn()
            ],
          ),
        ),
      ),
    );
  }
}
