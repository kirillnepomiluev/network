import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_status/choose_status_vm.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/auth_bar_row.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/search_text_field.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/wrap_select_containers.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/buttons/button_continue.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class ChooseStatusView extends StatelessWidget {
  const ChooseStatusView({Key? key, this.isAuth = false}) : super(key: key);
  final bool isAuth;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChooseStatusViewModel>(
      createModelDataEx: () => ChooseStatusViewModel(context),
      builder: (context, model) {
        final mediaTop = MediaQuery.of(context).viewPadding.top;
        return Scaffold(
          extendBody: true,
          body: Padding(
            padding: EdgeInsets.only(top: mediaTop),
            child: GestureDetector(
              onTap: model.unFocus,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 10,),
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
                          text2: AppString.of(context).status,
                          description: AppString.of(context).statusWillShowenInYourProfile,
                        ),
                      //Поиск
                      Padding(
                        padding: EdgeInsets.only(bottom: 20, top: 18),
                        child: SearchTextField(
                          controller: model.textController,
                          onChange: model.onSearchChanged,
                        ),
                      ),

                      // AppButton(
                      //   width: 60.sp,   //180
                      //   height: 30.sp,   //50
                      //   borderRadius: AppBorderRadius.r15,
                      //   textStyle: AppTextStyles.black12.copyWith(fontWeight: FontWeight.w500),
                      //   onPressed: (){
                      //     context.router.push(const InputStatusViewRoute());
                      //   }, text: AppString.of(context).inputOwnStatus,),

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
      },);
  }

}
