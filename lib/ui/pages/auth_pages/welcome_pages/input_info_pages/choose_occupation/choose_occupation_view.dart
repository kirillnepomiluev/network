import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/navigation/app_router.gr.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/auth_bar_row.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/button_continue.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/search_text_field.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/common/option_container.dart';
import 'package:network_app/constants.dart';

class ChooseOccupationView extends StatefulWidget {
  const ChooseOccupationView({
    Key? key,
  }) : super(key: key);

  @override
  State<ChooseOccupationView> createState() => _ChooseOccupationViewState();
}

class _ChooseOccupationViewState extends State<ChooseOccupationView> {
  final int _missedCount = 3;
  List<String> choosedOptions = [];

  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 23),
        child: ButtonContinue(
          onPressed: () {
            context.router.push(const InputOccupationViewRoute());
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuthBarRow(),

                  EnterInfoContainer(
                    text1: '${AppString.of(context).choose} ',
                    text2: AppString.of(context).ofOccupation,
                    description:
                        AppString.of(context).occupationsWillBeShowedInProfile,
                    padTop: 40,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppString.of(context).youCanChoose,
                          style: AppTextStyles.primary10,
                        ),
                        Text(' $_missedCount ',
                            style: AppTextStyles.saladPrimary10),
                        Text(
                          AppString.of(context).ofOptions,
                          style: AppTextStyles.primary10,
                        ),
                      ],
                    ),
                  ),

                  if (choosedOptions.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child:
                          // WrapSelectContainers(),
                          Wrap(
                        spacing: 14,
                        runSpacing: 14,
                        direction: Axis.horizontal,
                        children: [
                          for (final item in choosedOptions)
                            Container(
                                padding: const EdgeInsets.all(14), //14
                                decoration: BoxDecoration(
                                  color: AppColors.white10,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      item,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              choosedOptions.remove(item);
                                            });
                                          },
                                          padding: EdgeInsets.zero,
                                          constraints: const BoxConstraints(),
                                          iconSize: 20,
                                          icon: const Icon(
                                            Icons.close_rounded,
                                            color: AppColors.salad100,
                                          )),
                                    )
                                  ],
                                )),
                        ],
                      ),
                    ),

                  const SizedBox(
                    height: 20,
                  ),

                  AppButton(
                      width: 185,
                      height: 50,
                      borderRadius: AppBorderRadius.r15,
                      textStyle: AppTextStyles.black12w5,
                      onPressed: () {
                        context.router.push(const InputOccupationViewRoute());
                      },
                      text: AppString.of(context).inputOwnOption),

                  //Поиск
                  const Padding(
                      padding: EdgeInsets.only(bottom: 20, top: 18),
                      child: SearchTextField()),

                  Wrap(
                    spacing: 14,
                    runSpacing: 14,
                    direction: Axis.horizontal,
                    children: [
                      for (final item in Constants.hobbiesList)
                        OptionsContainer(
                          title: item,
                          func: () {
                            if (choosedOptions.length < 3) {
                              setState(() {
                                choosedOptions.add(item);
                              });
                            }
                          },
                        ),
                    ],
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
    );
  }
}
