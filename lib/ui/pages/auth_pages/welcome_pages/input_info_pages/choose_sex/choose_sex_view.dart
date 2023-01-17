import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/buttons/button_continue.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/utils/utils_responsive.dart';

enum _SexOptions {
  male,
  female,
  hidden,
  none,
}

class ChooseSexView extends StatefulWidget {
  const ChooseSexView({Key? key}) : super(key: key);

  @override
  State<ChooseSexView> createState() => _ChooseSexViewState();
}

class _ChooseSexViewState extends State<ChooseSexView> {
  _SexOptions choosedSex = _SexOptions.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const AppBackButton(),
                EnterInfoContainer(
                  text1: '${AppString.of(context).choose} ',
                  text2: AppString.of(context).sex,
                  description: AppString.of(context).youCanHideYourSex,
                ),
                SizedBox(
                  height: UtilsResponsive.getResSize(40),  //40
                ),
                AppButton(
                    onPressed: () {
                      setState(() {
                        choosedSex = _SexOptions.female;
                      });
                    },
                    buttonColor: choosedSex == _SexOptions.female
                        ? Colors.white
                        : Colors.transparent,
                    textColor: choosedSex == _SexOptions.female
                        ? Colors.black
                        : Colors.white,
                    borderRadius: AppBorderRadius.r15,
                    text: AppString.of(context).female),
                SizedBox(
                  height: UtilsResponsive.getResSize(40),  //40
                ),
                AppButton(
                    onPressed: () {
                      setState(() {
                        choosedSex = _SexOptions.male;
                      });
                    },
                    buttonColor: choosedSex == _SexOptions.male
                        ? Colors.white
                        : Colors.transparent,
                    textColor: choosedSex == _SexOptions.male
                        ? Colors.black
                        : Colors.white,
                    borderRadius: AppBorderRadius.r15,
                    text: AppString.of(context).male),
                SizedBox(
                  height: UtilsResponsive.getResSize(25), //25
                ),
                SizedBox(
                    width: 165,
                    child: CheckboxListTile(
                      checkColor: Colors.black,
                      controlAffinity: ListTileControlAffinity.leading,
                      value: choosedSex == _SexOptions.hidden,
                      onChanged: (newValue) {
                        setState(() {
                          if (choosedSex == _SexOptions.hidden) {
                            choosedSex = _SexOptions.none;
                          } else {
                            choosedSex = _SexOptions.hidden;
                          }
                        });
                      },
                      activeColor: AppColors.salad,
                      title: Transform.translate(
                        offset: const Offset(-10, 0),
                        child: Text(
                          AppString.of(context).hideSex,
                          style: const TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    )),
                SizedBox(
                  height: UtilsResponsive.getResSize(25), //25
                ),
                AppButtonContinue(onPressed: () {
                  context.router.push(const ChooseLevelViewRoute());
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
