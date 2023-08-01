import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/models/user_model.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_circle_avatar.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/utils/res.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({
    Key? key,
    required this.partnerModel,
  }) : super(key: key);
  final UserModel partnerModel;

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserNotifier>(context).userData;

    final double contSize = 35.sp; //63
    return InkWell(
      onTap: () async {
        ///     .contains('age_range', '[1,2)');
        final List dataList = await AppSupabase.client.from(AppSupabase.strChats).select().contains('users', [userData.id, partnerModel.id]);
        print('dataList $dataList');

        int id = 0;

        if(dataList.isEmpty){
          print('Нет');
          id = await AppSupabase.client.from(AppSupabase.strChats).insert({
            'creator_id' : userData.id,
            'partner_id' : partnerModel.id,
            'users' : [userData.id, partnerModel.id],
          }).select('id');

          print('insertId $id');
        }
        else {
          id = dataList.first['id'];
          print('Есть - $id');
        }

        if(id>0){
          context.router.push(ChatPersonalViewRoute(
            chatID: id,
            partnerModel: partnerModel,
          ));
        }

      },
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 27.sp), //35 - на сколько аватарка выше
            child: AppContainer(
              padH: Res.s10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 29.sp, //45
                  ),
                  Text(partnerModel.name,
                      style: AppTextStyles.primary16
                          .copyWith(fontWeight: FontWeight.bold),),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(partnerModel.status,
                      style: AppTextStyles.grey10,),
                  SizedBox(
                    height: Res.s16,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Text('12:48',
                            style: AppTextStyles.grey10
                                .copyWith(fontWeight: FontWeight.w500),),
                      ),
                      Icon(
                        NetworkIcons.check_double,
                        size: Res.s12,
                        color: AppColors.textGray,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text('Я предлагаю встретиться в каком-нибудь красивом...',
                      style: AppTextStyles.primary12,),
                  SizedBox(
                    height: Res.s26, //26
                  ),
                ],
              ),
            ),
          ),

          //аватарка
          SizedBox(
            height: contSize,
            width: contSize,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                    top: 0,
                    child: AppCircleAvatar(
                      avatarUrl: partnerModel.avatarURL,
                      contSize: contSize,
                      isAssetImage: false,
                    ),),
                if (partnerModel.online)
                  Positioned(
                      right: 7,
                      bottom: 0,
                      child: Icon(
                        Icons.circle,
                        size: Res.s14, //14
                        color: AppColors.salad,
                      ),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
