import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/auth_bar_row.dart';
import 'package:network_app/ui/pages/profile_pages/edit_field/edit_field_vm.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/fields/app_text_field.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';


class EditFieldView extends StatelessWidget {
  const EditFieldView(
      {Key? key,
      required this.text1,
      required this.text2,
      required this.description, required this.keyName,})
      : super(key: key);
  final String text1;
  final String text2;
  final String description;
  final String keyName;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditFieldViewModel>(
        createModelDataEx: () => EditFieldViewModel(context, keyName),
        builder: (context, model) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child:
                model.showLoading? const Center(child: CircularProgressIndicator(),):
                SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AuthBarRow(
                      isAuth: false,
                      // onSkip: onNextPage,
                    ),
                    EnterInfoContainer(
                      text1: text1,
                      text2: text2,
                      description: description,
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    AppTextField(
                      controller: model.textController,
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    AppButton(text: 'Записать', onPressed: model.onTap),
                  ],
                ),
                    // InputInfoColumn(
                    //   text1: '${AppString.of(context).inputOwn} ',
                    //   text2: AppString.of(context).status,
                    //   description: AppString.of(context).statusWillShowenInYourProfile,
                    //   onContinue: (){
                    //     Utils.unFocus();
                    //     context.router.pop();
                    //   },
                    // ),
                    ),
              ),
            ),
          );
        },);
  }
}
