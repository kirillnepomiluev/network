import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/home_profile_vm.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/choose_interface.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/screens/cupboard_screen.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/screens/profile_screen.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_invitations/widgets/view_invite_container_bottom.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';
import 'package:network_app/utils/res.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class HomeProfileView extends StatelessWidget {
  const HomeProfileView({Key? key, this.isCupboardInit = false})
      : super(key: key);
  final bool isCupboardInit;

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserNotifier>(context).userData;
    return ViewModelBuilder<ProfileMainViewModel>(
      createModelDataEx: () => ProfileMainViewModel(context, isCupboardInit),
      builder: (context, model) {
        final mediaTop = MediaQuery.of(context).viewPadding.top + 10;
        return Scaffold(
          extendBody: true,
          body:
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Верхняя часть профиля
                SizedBox(
                  height: mediaTop,
                ),

                // ProfileAvatarRow(
                //   title: '${userData.name}, ${userData.age}',
                //   status: userData.status,
                //   onNotificationIconTap: model.onNotificationIconTap,
                // ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Res.s15,),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            context.router.push(const AvatarEditViewRoute());
                          },
                          child: PartnerAvatarRow(
                            userModel: userData,
                            partnerLevel: userData.level,
                            yourLevel: userData.level,
                            showYourLevel: false,
                            contSize: Res.s60,
                          ),
                        ),
                      ),

                      IconButton(onPressed: (){
                        context.router.push(const SettingsMainViewRoute());
                      }, icon: const Icon(Icons.menu, color: Colors.white,), iconSize: Res.s26,),

                    ],
                  ),
                ),

                //Выбор интерфейса
                ChooseProfileScreen(
                  activeProfileTab: model.activeTab,
                  changeTab: model.changeTab,
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      //Большой аватар
                      if (model.activeTab == ActiveProfileTabs.profile)
                        Positioned(
                          // top: Res.s15,
                          // right: 0,
                          child:
                          Image.network(
                            userData.bodyURL,
                            // 'https://pkiaqrgckmxdnqlerkmf.supabase.co/storage/v1/object/public/clothes/body/rare/avatar_3.png',
                            // 'https://pkiaqrgckmxdnqlerkmf.supabase.co/storage/v1/object/public/clothes/body/usual/avatar_3D.png',
                            height: 110.sp,
                            // width: mediaWidth,
                            fit: BoxFit.cover
                          )
                        ),

                      if (model.activeTab == ActiveProfileTabs.profile)
                        ProfileScreen(
                          openBottomSheetProfile: model.openBottomSheetProfile,
                        )
                      else
                        model.activeTab == ActiveProfileTabs.cupboard
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
          ),
        );
      },
    );
  }
}
