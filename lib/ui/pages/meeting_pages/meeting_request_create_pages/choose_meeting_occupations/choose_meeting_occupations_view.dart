import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/search_text_field.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/choose_meeting_occupations/choose_meeting_occupations_vm.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/buttons/button_continue.dart';
import 'package:network_app/ui/widgets/cards/app_container_with_remove.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/common/option_container.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChooseMeetingOccupationsView extends StatelessWidget {
  const ChooseMeetingOccupationsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).viewPadding.top;
    return ViewModelBuilder<ChooseMeetingOccupationViewModel>(
        createModelDataEx: () => ChooseMeetingOccupationViewModel(context),
        builder: (context, model) {
          return Scaffold(
            bottomNavigationBar: Padding(
              padding: EdgeInsets.only(
                  left: UtilsResponsive.getResSize(16),
                  right: UtilsResponsive.getResSize(16),
                  bottom: UtilsResponsive.getResSize(23)),
              child: AppButtonContinue(
                onPressed: () {
                  context.router.push(const ChooseMeetingInterestsViewRoute());
                },
              ),
            ),
            extendBody: true,
            body: Padding(
              padding: EdgeInsets.only(top: mediaTop),
              child: GestureDetector(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: UtilsResponsive.getResSize(16),
                        vertical: UtilsResponsive.getResSize(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppBarRow(
                          title:
                              AppString.of(context).creatingOfPersonalRequest,
                        ),

                        EnterInfoContainer(
                          text1: '${AppString.of(context).choose} ',
                          text2: AppString.of(context).ofOccupation,
                          description: AppString.of(context)
                              .occupationsWillBeShowedInProfile,
                          // padTop: 40,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: UtilsResponsive.getResSize(20), left: 8.sp),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                AppString.of(context).youCanChoose,
                                style: AppTextStyles.primary10,
                              ),
                              Text(' ${model.missedCount} ',
                                  style: AppTextStyles.salad10),
                              Text(
                                AppString.of(context).ofOptions,
                                style: AppTextStyles.primary10,
                              ),
                            ],
                          ),
                        ),

                        if (model.choosedOptions.isNotEmpty)
                          Padding(
                            padding: EdgeInsets.only(
                                top: UtilsResponsive.getResSize(20)),
                            child: Wrap(
                              spacing: UtilsResponsive.getResSize(14),
                              runSpacing: UtilsResponsive.getResSize(14),
                              direction: Axis.horizontal,
                              children: [
                                for (final item in model.choosedOptions)
                                  AppContainerWithRemove(
                                    title: item,
                                    onRemove: (){
                                      model.onRemove(item);
                                    },
                                  )
                              ],
                            ),
                          ),
                        SizedBox(
                          height: UtilsResponsive.getResSize(20),
                        ),
                        AppButton(
                            width: 60.sp, //180
                            height: 30.sp, //50
                            borderRadius: AppBorderRadius.r15,
                            textStyle: AppTextStyles.black12
                                .copyWith(fontWeight: FontWeight.w500),
                            onPressed: () {
                              context.router.push(
                                  const InputMeetingOccupationViewRoute());
                            },
                            text: AppString.of(context).inputOwnOption),

                        //Поиск
                        Padding(
                            padding: EdgeInsets.only(
                                bottom: UtilsResponsive.getResSize(20),
                                top: UtilsResponsive.getResSize(18)),
                            child: const SearchTextField()),

                        Wrap(
                          spacing: UtilsResponsive.getResSize(14),
                          runSpacing: UtilsResponsive.getResSize(14),
                          direction: Axis.horizontal,
                          children: [
                            for (final item in Constants.hobbiesList)
                              OptionsContainer(
                                title: item,
                                onTap: () {
                                  model.onSelect(item);
                                },
                              ),
                          ],
                        ),

                        SizedBox(
                          height: 45.sp, //100
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
