import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/ui/widgets/general_widgets.dart';
import 'package:network_app/ui/widgets/network_icons.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/widgets/choose_interests.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChooseLevelPage extends StatefulWidget {
  const ChooseLevelPage({Key? key}) : super(key: key);

  @override
  State<ChooseLevelPage> createState() => _ChooseLevelPageState();
}

class _ChooseLevelPageState extends State<ChooseLevelPage> {

  String groupValue = 'Премиум';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Column(
                children: [

                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: BackButtonCustom(),
                  ),

                  const EnterInfoContainer(
                    padTop: 32,
                    text1: 'Выберете ',
                    text2: 'уровень',
                    description: 'Здесь мы даем объяснение, что значит уровень',
                  ),

                  levelContainer('Базовый'),
                  levelContainer('Стандартный'),
                  levelContainer('Премиум'),

                ],
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: buttonStyleCustom(
                        color: Colors.white,
                        padH: 0, padV: 22, radius: 20),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (context) => const ChooseInterestsPage(isAuth: true,)));
                    },
                    child: Text(
                      'Продолжить',
                      style: TextStyle(
                          fontSize: 18.5.sp, //18
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                      ),
                    )),
              ),


            ],
          ),
        ),
      ),
    );
  }

  Widget levelContainer(String title) => Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ConstColor.white10
      ),
      child: Row(
        children: [
          Expanded(
            child: RadioListTile(
              activeColor: ConstColor.salad100,
                value: title,
                title: Text(title, style: const TextStyle(
                  color: ConstColor.salad100,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),),

                groupValue: groupValue,
                onChanged: (String? newValue){

                  setState(() {
                    groupValue = newValue!;
                  });

                }),
          ),

          IconButton(onPressed: (){
            openBottomSheetProfile();
          }, icon: const Icon(NetworkIcons.info, color: Colors.white,))

        ],
      ),),
  );



  void openBottomSheetProfile() {

    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    final height = mediaHeight*0.9;

    showModalBottomSheet<void>(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        context: context,
        builder: (BuildContext context) => GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child:

          Stack(
            alignment: Alignment.topCenter,
            children: [

              Container(
                color: Colors.transparent,
                height: height,
                child: SingleChildScrollView(
                  child: Column(
                    // physics: NeverScrollableScrollPhysics(),
                    children: [

                      CustomPaint(
                        size: Size(mediaWidth, (mediaWidth*0.07733333333333334).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                        painter: BottomSheetMinPaint(),
                      ),

                      BlurryContainer(
                        width: mediaWidth,
                        borderRadius: BorderRadius.zero,
                        blur: 30,
                        // color: ConstColor.white,
                        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [

                            Text('Базовый', style: TextStyle(
                              color: ConstColor.salad100,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),),

                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text('${Constants.strLongLoremIpsum}\n\n${Constants.strLongLoremIpsum}', style: TextStyle(
                                fontSize: 16,
                              ),),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              CustomPaint(
                size: Size(mediaWidth, (mediaWidth*0.07733333333333334).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: BottomSheetMinPaint(color: Colors.transparent),
              ),

            ],
          ),
        )
    );
  }


}
