import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_sex/choose_sex_vm.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/buttons/button_continue.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/common/app_check_list_tile.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/res.dart';



class ChooseSexView extends StatefulWidget {
  const ChooseSexView({Key? key}) : super(key: key);

  @override
  State<ChooseSexView> createState() => _ChooseSexViewState();
}

class _ChooseSexViewState extends State<ChooseSexView> {

  @override
  Widget build(BuildContext context) {
  return ViewModelBuilder<ChooseSexViewModel>(
      createModelDataEx: () => ChooseSexViewModel(context),
      builder: (context, model) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
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
                      height: Res.s40, //40
                    ),

                    AppButton(
                      textStyle: AppTextStyles.primary18.copyWith(
                        color: model.maleChoosed
                            ? Colors.black
                            : Colors.white,
                      ),
                      onPressed: model.onMaleChoosed,
                      buttonColor: model.maleChoosed
                          ? Colors.white
                          : Colors.transparent,
                      textColor: model.maleChoosed
                          ? Colors.black
                          : Colors.white,
                      borderRadius: AppBorderRadius.r15,
                      text: AppString.of(context).male,
                    ),
                    SizedBox(
                      height: Res.s25, //25
                    ),


                    AppButton(
                      textStyle: AppTextStyles.primary18.copyWith(
                        color: model.femaleChoosed
                            ? Colors.black
                            : Colors.white,
                      ),
                      onPressed: model.onFemaleChoosed,
                      buttonColor: model.femaleChoosed
                          ? Colors.white
                          : Colors.transparent,
                      textColor: model.femaleChoosed
                          ? Colors.black
                          : Colors.white,
                      borderRadius: AppBorderRadius.r15,
                      text: AppString.of(context).female,
                    ),

                    SizedBox(
                      height: Res.s40, //40
                    ),



                    AppCheckListTile(
                      width: Res.s165,
                      onChanged: model.onHideSexCheckBox,
                      value: model.hideSex,
                      title: AppString.of(context).hideSex,
                    ),

                    // SizedBox(
                    //   width: 165,
                    //   child: CheckboxListTile(
                    //     checkColor: Colors.black,
                    //     controlAffinity: ListTileControlAffinity.leading,
                    //     value: choosedSex == SexOptions.hidden,
                    //     onChanged: (newValue) {
                    //       setState(() {
                    //         if (choosedSex == SexOptions.hidden) {
                    //           choosedSex = SexOptions.none;
                    //         } else {
                    //           choosedSex = SexOptions.hidden;
                    //         }
                    //       });
                    //     },
                    //     activeColor: AppColors.salad,
                    //     title: Transform.translate(
                    //       offset: const Offset(-10, 0),
                    //       child: Text(
                    //         AppString.of(context).hideSex,
                    //         style:
                    //         const TextStyle(color: Colors.white, fontSize: 14),
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    SizedBox(
                      height: Res.s25, //25
                    ),
                    AppButtonContinue(
                      onPressed: model.sexChoosed? model.onTap : null,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },);
}

}
