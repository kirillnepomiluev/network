import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/button_continue.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/general_widgets.dart';
import 'package:network_app/ui/widgets/network_icons.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/widgets/choose_interests.dart';

enum LevelOptions{
  base,
  standart,
  premium
}


class ChooseLevelPage extends StatefulWidget {
  const ChooseLevelPage({Key? key}) : super(key: key);

  @override
  State<ChooseLevelPage> createState() => _ChooseLevelPageState();
}

class _ChooseLevelPageState extends State<ChooseLevelPage> {
  // String groupValue = 'Премиум';

  LevelOptions groupValue = LevelOptions.premium;

  onPressed(LevelOptions? newValue) {
    setState(() {
      groupValue = newValue!;
    });
  }
  
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
                  const SizedBox(
                    height: 10,
                  ),
                  const BackButtonCustom(),

                  EnterInfoContainer(
                    padTop: 32,
                    text1: '${AppString.of(context).choose} ',
                    text2: AppString.of(context).level.toLowerCase(),
                    description: 'Здесь мы даем объяснение, что значит уровень',
                  ),

                  LevelContainer(
                      title: AppString.of(context).baseLevel,
                      value: LevelOptions.base,
                      groupValue: groupValue,
                      onPressed: onPressed),
                  LevelContainer(
                      title: AppString.of(context).standartLevel,
                      value: LevelOptions.standart,
                      groupValue: groupValue,
                      onPressed: onPressed),
                  LevelContainer(
                      title: AppString.of(context).premiumLevel,
                      value: LevelOptions.premium,
                      groupValue: groupValue,
                      onPressed: onPressed),
                ],
              ),
              Column(
                children: [
                  ButtonContinue(onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute<void>(
                        builder: (context) => const ChooseInterestsPage(
                          isAuth: true,
                        )));
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class LevelContainer extends StatefulWidget {
  final String title;
  final LevelOptions value;
  final LevelOptions groupValue;
  final Function(LevelOptions?) onPressed;
  const LevelContainer({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.groupValue, required this.value,
  }) : super(key: key);

  @override
  State<LevelContainer> createState() => _LevelContainerState();
}

class _LevelContainerState extends State<LevelContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: AppColors.white10),
        child: Row(
          children: [
            Expanded(
              child: RadioListTile<LevelOptions>(
                activeColor: AppColors.salad100,
                title: Text(
                  widget.title,
                  style: const TextStyle(
                      color: AppColors.salad100,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                value: widget.value,
                groupValue: widget.groupValue,
                onChanged: widget.onPressed,
              ),
            ),
            IconButton(
                onPressed: () {
                  openBottomSheetProfile();
                },
                icon: const Icon(
                  NetworkIcons.info,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }

  void openBottomSheetProfile() {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    final height = mediaHeight * 0.9;

    showModalBottomSheet<void>(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        context: context,
        builder: (BuildContext context) => GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Stack(
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
                        size: Size(
                            mediaWidth,
                            (mediaWidth * 0.07733333333333334)
                                .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                        painter: BottomSheetMinPaint(),
                      ),
                      BlurryContainer(
                        width: mediaWidth,
                        borderRadius: BorderRadius.zero,
                        blur: 30,
                        // color: ConstColor.white,
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 15, top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Базовый',
                              style: TextStyle(
                                color: AppColors.salad100,
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                '${Constants.strLongLoremIpsum}\n\n${Constants.strLongLoremIpsum}',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomPaint(
                size: Size(
                    mediaWidth,
                    (mediaWidth * 0.07733333333333334)
                        .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: BottomSheetMinPaint(color: Colors.transparent),
              ),
            ],
          ),
        ));
  }
}
