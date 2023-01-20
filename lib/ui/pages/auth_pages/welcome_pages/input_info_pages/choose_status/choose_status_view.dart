import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/auth_bar_row.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/search_text_field.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/wrap_select_containers.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/buttons/button_continue.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class ChooseStatusView extends StatelessWidget {
  const ChooseStatusView({Key? key, this.isAuth = false}) : super(key: key);
  final bool isAuth;

  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      floatingActionButton:
      isAuth? null :
      AppButton(
          width: 58.sp,
          height: 32.5.sp,
          onPressed: () {},
          text: AppString.of(context).toAdd,
      ),
      bottomNavigationBar: isAuth==false? null:
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 23),
        child:
        AppButtonContinue(
          onPressed: () {
            context.router.push(const ChooseOccupationViewRoute());
          },
        ),
      ),
      extendBody: true,
      body: Padding(
        padding: EdgeInsets.only(top: mediaTop),
        child: GestureDetector(
          onTap: (){
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: SingleChildScrollView(
            child:
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  AuthBarRow(
                      isAuth: isAuth,
                      title: AppString.of(context).chooseStatus,
                  ),

                  if(isAuth)
                  EnterInfoContainer(
                    text1: '${AppString.of(context).choose} ',
                    text2: AppString.of(context).status,
                    description: AppString.of(context).statusWillShowenInYourProfile,
                  ),

                  const SizedBox(height: 20,),

                  AppButton(
                      width: 60.sp,   //180
                      height: 30.sp,   //50
                      borderRadius: AppBorderRadius.r15,
                      textStyle: AppTextStyles.black12.copyWith(fontWeight: FontWeight.w500),
                      onPressed: (){
                        context.router.push(const InputStatusViewRoute());
                  }, text: AppString.of(context).inputOwnStatus,),

                  //Поиск
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20, top: 18),
                     child: SearchTextField(),
                  ),

                  const WrapSelectContainers(),

                  const SizedBox(height: 100,)

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
