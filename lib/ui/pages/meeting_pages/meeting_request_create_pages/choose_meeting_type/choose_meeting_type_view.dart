import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/choose_meeting_type/choose_meeting_type_vm.dart';
import 'package:network_app/ui/widgets/buttons/button_continue.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/common/app_radio_list.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/utils.dart';
import 'package:network_app/utils/utils_responsive.dart';




class ChooseMeetingTypeView extends StatelessWidget {
  const ChooseMeetingTypeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return ViewModelBuilder<ChooseMeetingTypeViewModel>(
      createModelDataEx: () => ChooseMeetingTypeViewModel(context),
      builder: (context, model) {
        final mediaTop = MediaQuery.of(context).viewPadding.top;
        return Scaffold(
          extendBody: true,
          body: Padding(
            padding: EdgeInsets.only(top: mediaTop),
            child: GestureDetector(
              onTap: Utils.unFocus,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Res.s16, vertical: Res.s10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBarRow(
                        title: AppString.of(context).creatingOfPersonalRequest,
                      ),
                      EnterInfoContainer(
                        text1: '${AppString.of(context).choose} ',
                        text2: AppString.of(context).ofCategoryOfMeeting,
                        showDescription: false,
                        fontSize: Res.s24,
                      ),

                      SizedBox(
                        height: Res.s20,
                      ),

                      AppRadioList(
                        groupValue: model.goalsGroupValue,
                        onRadioChoose: model.onGoalsRadioChoose,
                        listOptions: model.goalsListOptions,
                      ),

                      // const SearchTextField(),
                      // SizedBox(
                      //   height: Res.s18,
                      // ),
                      // const WrapSelectContainers(),
                      // SizedBox(
                      //   height: 45.sp, //100
                      // )

                    ],
                  ),
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
