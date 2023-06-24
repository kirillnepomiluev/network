import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/models/meeting_model.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_invitations/widgets/view_invite_container.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_requests_list/widgets/meeting_request_info_container.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';
import 'package:network_app/utils/res.dart';
import 'package:provider/provider.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_invitations/widgets/meeting_go_icon.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_invitations/widgets/view_invite_container_bar_row.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_invitations/widgets/view_invite_container_bottom.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/ui/widgets/texts/name_with_verification.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingInviteDetailsView extends StatelessWidget {
  const MeetingInviteDetailsView({Key? key, required this.meetingModel, required this.isInvitation}) : super(key: key);
  final MeetingModel meetingModel;
  final bool isInvitation;
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserNotifier>(context).userData;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBarRow(
                  // title: AppString.of(context).listOfPersonalRequests,
                ),
                SizedBox(
                  height: Res.s10,
                ),

                InviteContainerInfo(meetingModel: meetingModel, isInvitation: isInvitation, showDetails: true),

                const SizedBox(height: 30,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InviteContainerInfo extends StatelessWidget {
  const InviteContainerInfo({Key? key, required this.meetingModel, required this.isInvitation, this.showDetails = false}) : super(key: key);

  final MeetingModel meetingModel;
  final bool isInvitation;
  final bool showDetails;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padH: Res.s21,
      padV: Res.s26,
      radius: AppBorderRadius.r30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Тип
              AppContainer(
                height: 28.sp, //38,
                padH: Res.s17,
                radius: AppBorderRadius.r15,
                child: Center(
                  child:
                  Text(
                    meetingModel.type,
                    style: AppTextStyles.primary12,),
                ),
              ),
              Text(meetingModel.scheduledDateText,
                style: AppTextStyles.salad,
                // style: AppTextStyles.primary.copyWith(color: AppColors.grey3),
              )
            ],
          ),

          SizedBox(height: Res.s20),

          InviteContainerAvatarRow(
            meetingModel: meetingModel,
            isInvitation: isInvitation,
          ),
          SizedBox(height: meetingModel.status !='created' ? Res.s15 : Res.s10),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: Res.s20),
                  child: Text(
                    meetingModel.description,
                    // 'aaaaaa bbbbbbb',
                    // 'фыовдлфыовдлфыдвофдылвфывдлфыовлофыдлвфдылводфлыв фывфыв фыв фыв фыв фыв фыв ф в',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

              MeetingGoIcon(meetingModel: meetingModel),
            ],
          ),

          SizedBox(height: Res.s10),
          Divider(color: Colors.grey,),
          SizedBox(height: Res.s10),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Встреча ${meetingModel.statusText}'),

              Text('${meetingModel.reward} ${AppString.of(context).ofTokens}', style: AppTextStyles.salad,),
            ],
          ),
          SizedBox(height: Res.s10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '#${meetingModel.id}',
                style: AppTextStyles.grey,
                // style: AppTextStyles.salad16.copyWith(fontWeight: FontWeight.w500),
              ),

              Text(
                'от ${meetingModel.createdDateText}',
                style: AppTextStyles.grey,
              ),
            ],),

            if(showDetails)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                if(meetingModel.rateFromCreator != null)
                  _RateInfo(
                    fromCreator: true,
                    meetingModel: meetingModel,
                  ),

                if (meetingModel.rateFromPartner != null)
                  _RateInfo(
                    fromCreator: false,
                    meetingModel: meetingModel,
                  ),


                  SizedBox(height: Res.s10),
                  Divider(color: Colors.white,),
                  SizedBox(height: Res.s10),
                  Text('Уровень создателя ${meetingModel.creatorLevel}'),
                  SizedBox(height: 5),
                  Text('Уровень партнера ${meetingModel.partnerLevel}'),
                  SizedBox(height: 5),
                  Text('Вопросы и ответы тут'),
                  SizedBox(height: 5),
                  Text('Инфо о проведенном времени'),
                  SizedBox(height: 5),
                  Text('Инфо о жалобе может быть'),

              ],),



        ],
      ),
    );
  }
}

class _RateInfo extends StatelessWidget {
  const _RateInfo({Key? key, required this.fromCreator, required this.meetingModel}) : super(key: key);
  final bool fromCreator;
  final MeetingModel meetingModel;

  @override
  Widget build(BuildContext context) {

    final title = 'Отзыв ${fromCreator? 'создателя' : 'партнера'}';
    final rate = fromCreator? meetingModel.rateFromCreator : meetingModel.rateFromPartner;
    final fb = fromCreator? meetingModel.fbFromCreator : meetingModel.fbFromPartner;

    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10,),
        const Divider(color: Colors.white,),
        const SizedBox(height: 5,),

        Row(
          children: [
            Text(title),
            const SizedBox(width: 15,),
            Text(rate.toString()),
            const SizedBox(width: 5,),
            Icon(Icons.star, color: AppColors.salad, size: Res.s16,)
          ],
        ),
        const SizedBox(height: 10,),
        Text(fb.toString()),
      ],
    );
  }
}
