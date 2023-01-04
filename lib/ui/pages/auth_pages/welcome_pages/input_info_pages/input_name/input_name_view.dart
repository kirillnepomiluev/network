import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/input_name/input_name_vm.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/button_continue.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/fields/app_text_field.dart';
import 'package:network_app/ui/widgets/view_model_data/view_model_builder.dart';

class InputNamePage extends StatefulWidget {
  const InputNamePage({Key? key}) : super(key: key);

  @override
  State<InputNamePage> createState() => _InputNamePageState();
}

class _InputNamePageState extends State<InputNamePage> {
  @override
  Widget build(BuildContext context) {
  return ViewModelBuilder<InputNameViewModel>(
      createModelDataEx: () => InputNameViewModel(context),
      builder: (context, model) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),
                    const AppBackButton(),
                    EnterInfoContainer(
                      padTop: 32,
                      text1: '${AppString.of(context).input} ',
                      text2: AppString.of(context).yourName,
                      description: AppString.of(context).soWillDisplayInNetwork,
                    ),

                    const SizedBox(height: 36,),

                    const AppTextField(),

                    const SizedBox(height: 62,),

                    ButtonContinue(onPressed: model.onTap),

                    // AppButton(onPressed: model.onTap, text: AppString.of(context).toContinue),

                    // SizedBox(
                    //   width: double.infinity,
                    //   child: ElevatedButton(
                    //       style: buttonStyleCustom(
                    //           color: Colors.white, padH: 0, padV: 22, radius: 20),
                    //       onPressed: () {
                    //         FocusManager.instance.primaryFocus?.unfocus();
                    //
                    //         Navigator.of(context).push(MaterialPageRoute<void>(
                    //             builder: (context) => const ChooseDatePage()));
                    //       },
                    //       child: Text(
                    //         'Продолжить',
                    //         style: TextStyle(
                    //             fontSize: 18.5.sp, //18
                    //             fontWeight: FontWeight.w500,
                    //             color: Colors.black),
                    //       )),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SafeArea(
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 16),
  //         child: SingleChildScrollView(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               const SizedBox(height: 10,),
  //               const BackButtonCustom(),
  //               EnterInfoContainer(
  //                 padTop: 32,
  //                 text1: '${AppString.of(context).input} ',
  //                 text2: AppString.of(context).yourName,
  //                 description: AppString.of(context).soWillDisplayInNetwork,
  //               ),
  //
  //               const SizedBox(height: 36,),
  //
  //               const AppTextField(),
  //
  //               const SizedBox(height: 62,),
  //
  //               AppButton(onPressed: model.onTap, text: AppString.of(context).toContinue),
  //
  //               // SizedBox(
  //               //   width: double.infinity,
  //               //   child: ElevatedButton(
  //               //       style: buttonStyleCustom(
  //               //           color: Colors.white, padH: 0, padV: 22, radius: 20),
  //               //       onPressed: () {
  //               //         FocusManager.instance.primaryFocus?.unfocus();
  //               //
  //               //         Navigator.of(context).push(MaterialPageRoute<void>(
  //               //             builder: (context) => const ChooseDatePage()));
  //               //       },
  //               //       child: Text(
  //               //         'Продолжить',
  //               //         style: TextStyle(
  //               //             fontSize: 18.5.sp, //18
  //               //             fontWeight: FontWeight.w500,
  //               //             color: Colors.black),
  //               //       )),
  //               // ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
