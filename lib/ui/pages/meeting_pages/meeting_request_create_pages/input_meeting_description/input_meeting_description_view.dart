import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/input_meeting_description/input_meeting_description_vm.dart';
import 'package:network_app/ui/widgets/buttons/button_continue.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/fields/app_text_field.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/res.dart';


class InputDescriptionMeetingView extends StatelessWidget {
  const InputDescriptionMeetingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return ViewModelBuilder<InputDescriptionMeetingViewModel>(
      createModelDataEx: () => InputDescriptionMeetingViewModel(context),
      builder: (context, model) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding:
                EdgeInsets.symmetric(horizontal: Res.s16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBarRow(
                      title: AppString.of(context).creatingOfPersonalRequest,
                    ),
                    EnterInfoContainer(
                      text1: '${AppString.of(context).shortlyDescribe} ',
                      text2: AppString.of(context).whatMeetingAreYouPlaning,
                      description:
                      'Здесь будет небольшое описание, что именно здесь нужно указать',
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: Res.s35,
                        // bottom: Res.s35, //62
                      ),
                      child: AppTextField(
                        controller: model.textController,
                      ),
                    ),
                    // AppButtonContinue(onPressed: model.onTap,),
                  ],
                ),
              ),
            ),
          ),

          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
              left: Res.s16,
              right: Res.s16,
              bottom: Res.s23,
            ),
            child: AppButtonContinue(onPressed: model.onTap,),
          ),

        );
      },);
}


}
