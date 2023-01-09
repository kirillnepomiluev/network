import 'package:flutter/material.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/screens/cupboard_screen.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/home_profile_vm.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/choose_interface.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/profile_avatar_row.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/profile_bottom_curve.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/screens/profile_screen.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeProfileView extends StatelessWidget {
  final bool isCupboardInit;
  const HomeProfileView({Key? key, this.isCupboardInit = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileMainViewModel>(
        createModelDataEx: () => ProfileMainViewModel(context, isCupboardInit),
        builder: (context, model) {
          final mediaTop = MediaQuery.of(context).viewPadding.top;
          final double padLeft = 17.5.sp; //16
          return Scaffold(
              extendBody: true,
              body: Stack(
                children: [
                  //Большой аватар
                  if (model.activeTab == ActiveProfileTabs.profile)
                    Positioned(
                      top: 55.sp,
                      right: 0,
                      child: Assets.images.avatars.avatar3D.image(),
                    ),

                  //Основное
                  Padding(
                    padding: EdgeInsets.only(top: mediaTop),
                    child: SizedBox(
                      height: double.infinity,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Верхняя часть профиля
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 10, left: padLeft),
                                child: ProfileAvatarRow(
                                    onNotificationIconTap:
                                        model.onNotificationIconTap),
                              ),

                              //Выбор интерфейса
                              ChooseProfileScreen(
                                activeProfileTab: model.activeTab,
                                changeTab: model.changeTab,
                              ),

                              //Нижняя часть профиля
                              model.activeTab == ActiveProfileTabs.profile
                                  ? const ProfileScreen()
                                  : model.activeTab ==
                                          ActiveProfileTabs.cupboard
                                      ? CupboardScreen(
                                          isCupboardInit: isCupboardInit,
                                activeTab: model.activeTab,
                                hatScrollContr: model.hatScrollContr,
                                avatarScrollContr: model.hatScrollContr,
                              )
                                      : Container(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: ProfileBottomCurve(
                openBottomSheetProfile: model.openBottomSheetProfile,
              ));
        });
  }
}
