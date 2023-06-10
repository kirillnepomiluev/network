import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/choose_meeting_person/choose_meeting_person_vm.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_circle_avatar.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/icons/app_icon_container.dart';
import 'package:network_app/ui/widgets/texts/name_with_verification.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/utils.dart';
import 'package:network_app/utils/res.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class ChooseMeetingPersonView extends StatelessWidget {
  const ChooseMeetingPersonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserNotifier>(context,).userData;
    final currentID = userData.id;
    print('userData ${userData.id}');

    return ViewModelBuilder<ChooseMeetingPersonViewModel>(
      createModelDataEx: () => ChooseMeetingPersonViewModel(context),
      builder: (context, model) {
        final mediaTop = MediaQuery.of(context).viewPadding.top;
        return Scaffold(
          extendBody: true,
          body: Padding(
            padding: EdgeInsets.only(top: mediaTop),
            child: GestureDetector(
              onTap: Utils.unFocus,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Res.s16, vertical: Res.s10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBarRow(
                        title: AppString.of(context).creatingOfPersonalRequest,
                      ),
                      EnterInfoContainer(
                        text1: '${AppString.of(context).choose} ',
                        text2: 'партнера',
                        showDescription: false,
                        fontSize: Res.s24,
                      ),

                      SizedBox(
                        height: Res.s20,
                      ),

                      StreamBuilder(
                        stream: AppSupabase.client
                            .from(AppSupabase.strUsers)
                            .stream(primaryKey: ['id'])
                            .neq('id', currentID),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final list = snapshot.data! as List<Map<String, dynamic>>;
                            // var list = currentList
                            //     .where(
                            //       (x) => userData.clothesIdList.contains(x['id']) == isCupboard,)
                            //     .toList();
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: list.length,
                              itemBuilder: (BuildContext context, int index) {
                                final currentMap = list[index];
                                final partnerModel = UserModel.fromMap(currentMap);
                                return Padding(
                                  padding: EdgeInsets.only(bottom: Res.s10),
                                  child: InkWell(
                                    onTap: (){
                                      model..onPartnerChoosed(partnerModel)
                                      ..onTap();
                                    },
                                    child:
                                    AppContainer(
                                      padH: Res.s21,
                                      padV: Res.s26,
                                      radius: AppBorderRadius.r30,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          NameWithVerification(
                                              strName: partnerModel.name, showVerified: true),

                                          SizedBox(
                                            height: Res.s15,
                                          ),

                                              Text(
                                                '${AppString.of(context).level} "${partnerModel.rankText}"',
                                              ),

                                          SizedBox(height: Res.s20),

                                          Row(
                                            children: [
                                              AppCircleAvatar(
                                                imageUrl: '',
                                                contSize: 40.sp, //83
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(left: Res.s21),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    AppIconContainer(
                                                      icon: Icons.call_made,
                                                      contColor: AppColors.salad,
                                                      iconColor: Colors.black,
                                                      boxShape: BoxShape.circle,
                                                      iconSize: 15.sp,
                                                      contSize: Res.s18,
                                                    ),
                                                    SizedBox(
                                                      height: Res.s10,
                                                    ),
                                                    Text('250 м',
                                                      style: AppTextStyles.salad20
                                                          .copyWith(fontWeight: FontWeight.w600),)
                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),

                                        ],
                                      ),
                                    )
                                    // Text(name, style: AppTextStyles.primary.copyWith(
                                    //   color: model.choosedPartnerID==partnerID? AppColors.salad : AppColors.textWhite
                                    // ),
                                    // ),
                                  ),
                                );
                              },
                            );
                          }
                          return const Center(child: CircularProgressIndicator());
                        },
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
          // bottomNavigationBar: Padding(
          //   padding: EdgeInsets.only(
          //     left: Res.s16,
          //     right: Res.s16,
          //     bottom: Res.s23,
          //   ),
          //   child: AppButtonContinue(onPressed: model.onTap,),
          // ),
        );
      },);
  }

}
