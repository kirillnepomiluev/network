import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_occupation/choose_occupation_vm.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/auth_bar_row.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/search_text_field.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/wrap_select_containers.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/buttons/button_continue.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/common/option_container.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChooseOccupationView extends StatelessWidget {
  final bool isAuth;
  const ChooseOccupationView({
    Key? key,
    required this.isAuth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).viewPadding.top;
    return ViewModelBuilder<ChooseOccupationViewModel>(
      createModelDataEx: () => ChooseOccupationViewModel(context),
      builder: (context, model) {
        return Scaffold(
          extendBody: true,
          body: Padding(
            padding: EdgeInsets.only(top: mediaTop),
            child: GestureDetector(
              onTap: model.unFocus,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AuthBarRow(
                        onSkip: model.onNextPage,
                        isAuth: isAuth,
                        title: AppString.of(context).chooseInterests,
                      ),

                      if (isAuth)
                        EnterInfoContainer(
                          text1: '${AppString.of(context).choose} ',
                          text2: AppString.of(context).ofOccupation,
                          description: AppString.of(context)
                              .occupationsWillBeShowedInProfile,
                          // padTop: 40,
                        ),

                      //Поиск
                      Padding(
                        padding: EdgeInsets.only(bottom: 20, top: 18),
                        child: SearchTextField(
                          controller: model.textController,
                          onChange: model.onSearchChanged,
                        ),
                      ),

                      WrapSelectContainersTest(
                        onTap: model.onSelectContainer,
                        list: model.displayedList,
                      ),

                      const SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          floatingActionButton: isAuth
              ? null
              : AppButton(
                  width: 58.sp,
                  height: 32.5.sp,
                  onPressed: model.onAddInterests,
                  text: AppString.of(context).toAdd,
                ),
          bottomNavigationBar: isAuth == false
              ? null
              : Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 23),
                  child: AppButtonContinue(
                    onPressed: model.onContinue,
                  ),
                ),
        );

        // return Scaffold(
        //   extendBody: true,
        //   body: Padding(
        //     padding: EdgeInsets.only(top: mediaTop),
        //     child: GestureDetector(
        //       onTap: () {
        //         Utils.unFocus();
        //       },
        //       child: SingleChildScrollView(
        //         child: Padding(
        //           padding: const EdgeInsets.symmetric(
        //               horizontal: 16, vertical: 10,),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               const AuthBarRow(),
        //
        //               EnterInfoContainer(
        //                 text1: '${AppString.of(context).choose} ',
        //                 text2: AppString.of(context).ofOccupation,
        //                 description: AppString.of(context)
        //                     .occupationsWillBeShowedInProfile,
        //                 // padTop: 40,
        //               ),
        //
        //               Padding(
        //                 padding: const EdgeInsets.only(top: 20, left: 8),
        //                 child: Row(
        //                   mainAxisSize: MainAxisSize.min,
        //                   children: [
        //                     Text(
        //                       AppString.of(context).youCanChoose,
        //                       style: AppTextStyles.primary10,
        //                     ),
        //                     Text(' ${model.missedCount} ',
        //                         style: AppTextStyles.salad10,),
        //                     Text(
        //                       AppString.of(context).ofOptions,
        //                       style: AppTextStyles.primary10,
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //
        //               if (model.choosedOptions.isNotEmpty)
        //                 Padding(
        //                   padding: const EdgeInsets.only(top: 20),
        //                   child: Wrap(
        //                     spacing: 14,
        //                     runSpacing: 14,
        //                     children: [
        //                       for (final item in model.choosedOptions)
        //                         Container(
        //                             padding: EdgeInsets.all(Res.s14), //14
        //                             decoration: BoxDecoration(
        //                               color: AppColors.white10,
        //                               borderRadius: BorderRadius.circular(12),
        //                             ),
        //                             child: Row(
        //                               mainAxisSize: MainAxisSize.min,
        //                               children: [
        //                                 Text(
        //                                   item,
        //                                 ),
        //                                 Padding(
        //                                   padding:
        //                                   const EdgeInsets.only(left: 5),
        //                                   child: IconButton(
        //                                       onPressed: () {
        //                                         model.onRemove(item);
        //                                       },
        //                                       padding: EdgeInsets.zero,
        //                                       constraints:
        //                                       const BoxConstraints(),
        //                                       iconSize:
        //                                       Res.s20,
        //                                       icon: Icon(
        //                                         Icons.close_rounded,
        //                                         color: AppColors.salad,
        //                                         size: Res.s16,
        //                                       ),),
        //                                 )
        //                               ],
        //                             ),)
        //                     ],
        //                   ),
        //                 ),
        //
        //               const SizedBox(
        //                 height: 20,
        //               ),
        //
        //
        //               AppButton(
        //                   width: 60.sp,   //180
        //                   height: 30.sp,   //50
        //                   // width: 185,
        //                   // height: 50,
        //                   borderRadius: AppBorderRadius.r15,
        //                   textStyle: AppTextStyles.black12
        //                       .copyWith(fontWeight: FontWeight.w500),
        //                   onPressed: () {
        //                     context.router
        //                         .push(const InputOccupationViewRoute());
        //                   },
        //                   text: AppString.of(context).inputOwnOption,),
        //
        //               //Поиск
        //               const Padding(
        //                   padding: EdgeInsets.only(bottom: 20, top: 18),
        //                   child: SearchTextField(),),
        //
        //               Wrap(
        //                 spacing: 14,
        //                 runSpacing: 14,
        //                 children: [
        //                   for (final item in Constants.hobbiesList)
        //                     OptionsContainer(
        //                       title: item,
        //                       onTap: () {
        //                         model.onSelect(item);
        //                       },
        //                     ),
        //                 ],
        //               ),
        //
        //               const SizedBox(
        //                 height: 100,
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        //   bottomNavigationBar: Padding(
        //     padding: const EdgeInsets.only(left: 16, right: 16, bottom: 23),
        //     child: AppButtonContinue(
        //       onPressed: () {
        //         context.router.push(const InputAboutYouViewRoute());
        //       },
        //     ),
        //   ),
        // );
      },
    );
  }
}
