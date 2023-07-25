import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/models/user_model.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_invitations/widgets/view_invite_container_bottom.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_create_pages/choose_meeting_person/choose_meeting_person_vm.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/utils.dart';
import 'package:network_app/utils/res.dart';
import 'package:provider/provider.dart';


class ChooseMeetingPersonView extends StatelessWidget {
  const ChooseMeetingPersonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserNotifier>(context,).userData;
    final currentID = userData.id;

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
                        text2: AppString.of(context).ofPartner,
                        showDescription: false,
                        fontSize: Res.s24,
                      ),

                      SizedBox(height: Res.s20,),

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
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: list.length,
                              itemBuilder: (BuildContext context, int index) {
                                final currentMap = list[index];
                                return ChoosePersonContainer(dataMap: currentMap, onPartnerChoosed: model.onPartnerChoosed);
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


class ChoosePersonContainer extends StatefulWidget {
  const ChoosePersonContainer({Key? key, required this.onPartnerChoosed, required this.dataMap}) : super(key: key);

  final Function(UserModel) onPartnerChoosed;
  final Map<String, dynamic> dataMap;

  @override
  State<ChoosePersonContainer> createState() => _ChoosePersonContainerState();
}

class _ChoosePersonContainerState extends State<ChoosePersonContainer> {

  UserModel partnerModel = UserModel.emptyModel();

  Future<void> getInit() async {
    partnerModel = await UserModel.create(widget.dataMap);
    setState(() {});
  }

  @override
  void initState() {
    getInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserNotifier>(context,).userData;
    return
      partnerModel.id == null? Container() :
      Padding(
      padding: EdgeInsets.only(bottom: Res.s10),
      child: InkWell(
          onTap: (){
            widget.onPartnerChoosed(partnerModel);
          },
          child:
          AppContainer(
            padH: Res.s21,
            padV: Res.s26,
            radius: AppBorderRadius.r30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                PartnerAvatarRow(
                  userModel: partnerModel,
                  partnerLevel: partnerModel.level,
                  yourLevel: userData.level,
                  showYourLevel: false,
                ),

                // NameWithVerification(
                //     strName: partnerModel.name, showVerified: true),
                //
                // SizedBox(
                //   height: Res.s15,
                // ),
                //
                //     Text(
                //       '${AppString.of(context).level} "${partnerModel.rankText}"',
                //     ),
                //
                // SizedBox(height: Res.s20),
                //
                // Row(
                //   children: [
                //     AppCircleAvatar(
                //       imageUrl: '',
                //       contSize: 40.sp, //83
                //       isAssetImage: false,
                //     ),
                //     Padding(
                //       padding: EdgeInsets.only(left: Res.s21),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           AppIconContainer(
                //             icon: Icons.call_made,
                //             contColor: AppColors.salad,
                //             iconColor: Colors.black,
                //             boxShape: BoxShape.circle,
                //             iconSize: 15.sp,
                //             contSize: Res.s18,
                //           ),
                //           SizedBox(
                //             height: Res.s10,
                //           ),
                //           Text('250 м',
                //             style: AppTextStyles.salad20
                //                 .copyWith(fontWeight: FontWeight.w600),)
                //         ],
                //       ),
                //     ),
                //
                //   ],
                // ),

              ],
            ),
          )
        // Text(name, style: AppTextStyles.primary.copyWith(
        //   color: model.choosedPartnerID==partnerID? AppColors.salad : AppColors.textWhite
        // ),
        // ),
      ),
    );
  }
}