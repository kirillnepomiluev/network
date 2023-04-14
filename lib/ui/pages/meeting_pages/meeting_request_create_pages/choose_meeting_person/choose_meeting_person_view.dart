import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/choose_meeting_person/choose_meeting_person_vm.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/button_continue.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/utils.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:provider/provider.dart';


class ChooseMeetingPersonView extends StatelessWidget {
  const ChooseMeetingPersonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserNotifier>(context,).userData;
    final currentID = userData.userID;
    print('userData ${userData.userID}');

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
                            final list = snapshot.data as List<Map<String, dynamic>>;
                            // var list = currentList
                            //     .where(
                            //       (x) => userData.clothesIdList.contains(x['id']) == isCupboard,)
                            //     .toList();
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: list.length,
                              itemBuilder: (BuildContext context, int index) {
                                final currentMap = list[index] as Map<String, dynamic>;
                                final partnerID = currentMap['id'];
                                final name = currentMap['name'];
                                return Padding(
                                  padding: EdgeInsets.only(bottom: Res.s10),
                                  child: InkWell(
                                    onTap: (){
                                      model.onPartnerChoosed(partnerID);
                                    },
                                    child: Text(name, style: AppTextStyles.primary.copyWith(
                                      color: model.choosedPartnerID==partnerID? AppColors.salad : AppColors.textWhite
                                    ),),
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
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
              left: Res.s16,
              right: Res.s16,
              bottom: Res.s23,
            ),
            child: AppButtonContinue(onPressed: model.onTap,),
          ),
        );
      },);
  }

}
