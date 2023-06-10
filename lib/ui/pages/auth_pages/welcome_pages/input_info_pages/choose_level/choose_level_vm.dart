import 'package:auto_route/auto_route.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/cards/bottom_sheet_min_patinr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:network_app/utils/utils.dart';


enum LevelOptions { base, standart, premium }

class ChooseLevelViewModel extends ViewModel {
  ChooseLevelViewModel(this.context);
  final BuildContext context;

  void onContinue() {
    String level = '';

    if (groupValue == LevelOptions.base) {
      level = 'base';
    } else if (groupValue == LevelOptions.standart) {
      level = 'standart';
    } else {
      level = 'premium';
    }

    UserNotifier().updateData(
      newData: {'level': level},
    );

    // context.router.push(ChooseInterestsViewRoute(isAuth: true));
    context.router.push(ChooseCategoriesViewRoute(keyName: 'interests',isAuth: true));
  }

  LevelOptions groupValue = LevelOptions.premium;

  void onPressed(LevelOptions? newValue) {
    groupValue = newValue!;
    notifyListeners();
  }

  void openBottomSheetProfile() {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    final height = mediaHeight * 0.9;

    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      context: context,
      builder: (BuildContext context) => GestureDetector(
        onTap: Utils.unFocus,
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
                        (mediaWidth * 0.07733333333333334).toDouble(),
                      ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                      painter: BottomSheetMinPaint(),
                    ),
                    BlurryContainer(
                      width: mediaWidth,
                      borderRadius: BorderRadius.zero,
                      blur: 30,
                      // color: ConstColor.white,
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                        bottom: 15,
                        top: 15,
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Базовый',
                            style: TextStyle(
                              color: AppColors.salad,
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
                (mediaWidth * 0.07733333333333334).toDouble(),
              ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: BottomSheetMinPaint(color: Colors.transparent),
            ),
          ],
        ),
      ),
    );
  }
}
