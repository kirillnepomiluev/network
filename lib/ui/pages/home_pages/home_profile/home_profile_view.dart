import 'package:flutter/material.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/screens/cupboard_screen.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/home_profile_vm.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/choose_interface.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/profile_avatar_row.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/screens/profile_screen.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';
import 'package:network_app/utils/utils_responsive.dart';
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
          return Scaffold(
            extendBody: true,
            body: Column(
              children: [
                //Верхняя часть профиля
                SizedBox(
                  height: mediaTop,
                ),
                ProfileAvatarRow(
                    onNotificationIconTap: model.onNotificationIconTap),
                //Выбор интерфейса
                ChooseProfileScreen(
                  activeProfileTab: model.activeTab,
                  changeTab: model.changeTab,
                ),

                Expanded(
                  child: Stack(
                    children: [
                      //Большой аватар
                      if (model.activeTab == ActiveProfileTabs.profile)
                        Positioned(
                          top: UtilsResponsive.getResSize(15),
                          right: UtilsResponsive.getResSize(15),
                          child: Assets.images.avatars.avatar3D.image(
                            height: 110.sp, //681
                          ),
                        ),

                      model.activeTab == ActiveProfileTabs.profile
                          ? ProfileScreen(
                              openBottomSheetProfile:
                                  model.openBottomSheetProfile,
                            )
                          : model.activeTab == ActiveProfileTabs.cupboard
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
              ],
            ),
          );
        });
  }
}
