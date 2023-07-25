import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/home_profile_vm.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/screens/cupboard_screen.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/screens/profile_screen.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';

class HomeProfileView extends StatelessWidget {
  const HomeProfileView({Key? key, this.isCupboardInit = false})
      : super(key: key);
  final bool isCupboardInit;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileMainViewModel>(
      createModelDataEx: () => ProfileMainViewModel(context, isCupboardInit),
      builder: (context, model) {
        return Scaffold(
            extendBody: true,
            body: Container(
              child: model.activeTab == ActiveProfileTabs.profile
                  ? ProfileScreen(
                      openBottomSheetProfile: model.openBottomSheetProfile,
                      activeTab: model.activeTab,
                      changeTab: model.changeTab,
                    )
                  : model.activeTab == ActiveProfileTabs.cupboard
                      ? CupboardScreen(
                          isCupboardInit: isCupboardInit,
                          activeTab: model.activeTab,
                          hatScrollContr: model.hatScrollContr,
                          avatarScrollContr: model.hatScrollContr,
                          changeTab: model.changeTab,
                        )
                      : Container(),
            ));
      },
    );
  }
}

// class HomeProfileView extends StatelessWidget {
//   const HomeProfileView({Key? key, this.isCupboardInit = false})
//       : super(key: key);
//   final bool isCupboardInit;
//
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<ProfileMainViewModel>(
//       createModelDataEx: () => ProfileMainViewModel(context, isCupboardInit),
//       builder: (context, model) {
//         final userData = Provider.of<UserNotifier>(context).userData;
//         final mediaTop = MediaQuery.of(context).viewPadding.top + 10;
//         return Scaffold(
//           extendBody: true,
//           body: SizedBox(
//             // height: MediaQuery.of(context).size.height,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 //Верхняя часть профиля
//                 SizedBox(
//                   height: mediaTop,
//                 ),
//                 HomeProfileTop(),
//
//                 //Выбор интерфейса
//                 ChooseProfileScreen(
//                   activeProfileTab: model.activeTab,
//                   changeTab: model.changeTab,
//                 ),
//
//                 Expanded(
//                   child: Stack(
//                     alignment: model.activeTab == ActiveProfileTabs.cupboard
//                         ? Alignment.topCenter
//                         : Alignment.centerRight,
//                     children: [
//                       //Большой аватар
//                       if (model.activeTab == ActiveProfileTabs.profile)
//                         Positioned(
//                             // top: Res.s15,
//                             // right: 0,
//                             child: Image.network(userData.bodyURL,
//                                 // 'https://pkiaqrgckmxdnqlerkmf.supabase.co/storage/v1/object/public/clothes/body/rare/avatar_3.png',
//                                 // 'https://pkiaqrgckmxdnqlerkmf.supabase.co/storage/v1/object/public/clothes/body/usual/avatar_3D.png',
//                                 height: 110.sp,
//                                 // width: mediaWidth,
//                                 fit: BoxFit.cover)),
//
//                       if (model.activeTab == ActiveProfileTabs.profile)
//                         ProfileScreen(
//                           openBottomSheetProfile: model.openBottomSheetProfile,
//                         )
//                       else
//                         model.activeTab == ActiveProfileTabs.cupboard
//                             ? CupboardScreen(
//                                 isCupboardInit: isCupboardInit,
//                                 activeTab: model.activeTab,
//                                 hatScrollContr: model.hatScrollContr,
//                                 avatarScrollContr: model.hatScrollContr,
//                               )
//                             : Container(),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
