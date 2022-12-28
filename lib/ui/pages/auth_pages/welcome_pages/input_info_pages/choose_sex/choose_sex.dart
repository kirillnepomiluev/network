import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_level/choose_level.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/button_continue.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/general_widgets.dart';

enum _SexOptions {
  male,
  female,
  hidden,
  none,
}

class ChooseSexPage extends StatefulWidget {
  const ChooseSexPage({Key? key}) : super(key: key);

  @override
  State<ChooseSexPage> createState() => _ChooseSexPageState();
}

class _ChooseSexPageState extends State<ChooseSexPage> {
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
                const BackButtonCustom(),
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
                      activeColor: AppColors.salad100,
                      title: Transform.translate(
                        offset: const Offset(-10, 0),
                        child: Text(
                          AppString.of(context).hideSex,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 25,
                ),
                ButtonContinue(onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute<void>(
                      builder: (context) => const ChooseLevelPage()));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
