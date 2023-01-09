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

  // bool value = false;
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
                  padTop: 32,
                  text1: '${AppString.of(context).choose} ',
                  text2: AppString.of(context).sex,
                  description: AppString.of(context).youCanHideYourSex,
                ),
                const SizedBox(
                  height: 40,
                ),
                AppButton(
                    onPressed: () {
                      setState(() {
                        // strSex = 'female';
                        choosedSex = _SexOptions.female;
                        // value = false;
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
                const SizedBox(
                  height: 50,
                ),
                AppButton(
                    onPressed: () {
                      setState(() {
                        choosedSex = _SexOptions.male;
                        // strSex = 'male';
                        // value = false;
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
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                    width: 185,
                    child: CheckboxListTile(
                      checkColor: Colors.black,
                      controlAffinity: ListTileControlAffinity.leading,
                      value: choosedSex == _SexOptions.hidden,
                      onChanged: (newValue) {
                        setState(() {
                          // value = newValue!;

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
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 25,
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
