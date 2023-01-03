import 'package:flutter/material.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/ui/pages/profile_pages/profile_main/choose_interface.dart';
import 'package:network_app/ui/pages/profile_pages/profile_main/cupboard_empty_screen.dart';
import 'package:network_app/ui/pages/profile_pages/profile_main/cupboard_init_screen.dart';
import 'package:network_app/ui/pages/profile_pages/profile_main/profile_bottom_curve.dart';
import 'package:network_app/ui/pages/profile_pages/profile_main/profile_main_vm.dart';
import 'package:network_app/ui/pages/profile_pages/profile_main/profile_screen.dart';
import 'package:network_app/ui/pages/profile_pages/profile_main/widgets/profile_avatar_row.dart';
import 'package:network_app/ui/widgets/view_model_data/view_model_builder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileMainPage extends StatelessWidget {
  final bool isCupboardInit;
  const ProfileMainPage({Key? key, this.isCupboardInit = false})
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
                  if (model.activeTab == ActiveTab.profile)
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
                                child: ProfileAvatarRow(onNotificationIconTap: model.onNotificationIconTap),
                              ),

                              //Выбор интерфейса
                              Padding(
                                padding: EdgeInsets.only(
                                  left: padLeft,
                                  top: 19.sp, //20
                                ),
                                child: ChooseInterface(
                                  activeTab: model.activeTab,
                                  changeTab: model.changeTab,
                                ),
                              ),

                              //Нижняя часть профиля
                              if (model.activeTab == ActiveTab.profile)
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 22.sp, //31
                                      left: padLeft),
                                  child: const ProfileScreen(),
                                ),

                              /////////////////////////////////////

                              if (model.activeTab == ActiveTab.cupboard)
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 16, right: 16
                                    ),
                                    child: isCupboardInit
                                        ? CupboardInitScreen(
                                            activeTab: model.activeTab,
                                            avatarScrollContr:
                                                model.avatarScrollContr,
                                            hatScrollContr:
                                                model.hatScrollContr,
                                          )
                                        : const CupboardEmptyScreen(),
                                  ),
                                ),
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
