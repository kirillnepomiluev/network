import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/search_text_field.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_status/choose_status.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/auth_bar_row.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/button_continue.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/wrap_select_containers.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChooseInterestsPage extends StatefulWidget {
  final bool isAuth;
  const ChooseInterestsPage({Key? key, this.isAuth = false}) : super(key: key);

  @override
  State<ChooseInterestsPage> createState() => _ChooseInterestsPageState();
}

class _ChooseInterestsPageState extends State<ChooseInterestsPage> {
  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      floatingActionButton: widget.isAuth
          ? null
          : AppButton(
              width: 58.sp, //10.472 * mediaWidth, //177
              height: 32.5.sp, //0.076 * mediaHeight, //55
              onPressed: () {},
              text: AppString.of(context).toAdd),
      bottomNavigationBar: widget.isAuth == false
          ? null
          : Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 23),
              child: ButtonContinue(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute<void>(
                      builder: (context) => const ChooseStatusPage()));
                },
              )),
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
                  AuthBarRow(
                      isAuth: widget.isAuth,
                      title: AppString.of(context).chooseInterests),

                  if (widget.isAuth)
                    EnterInfoContainer(
                      text1: '${AppString.of(context).choose} ',
                      text2: AppString.of(context).interests,
                      padTop: 40,
                      showDescription: false,
                      fontSize: 24,
                    ),

                  //Поиск
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20, top: 18),
                    child: SearchTextField(),
                  ),

                  const WrapSelectContainers(),

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
