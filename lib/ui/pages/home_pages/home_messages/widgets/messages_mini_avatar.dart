import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/models/meeting_model.dart';
import 'package:network_app/app/core/models/user_model.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_circle_avatar.dart';
import 'package:network_app/utils/res.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MessagesMiniAvatar extends StatefulWidget {
  const MessagesMiniAvatar({
    Key? key, required this.meetingMap,
  }) : super(key: key);
  final Map<String, dynamic> meetingMap;

  @override
  State<MessagesMiniAvatar> createState() => _MessagesMiniAvatarState();
}

class _MessagesMiniAvatarState extends State<MessagesMiniAvatar> {

  UserModel partnerModel = UserModel.emptyModel();
  MeetingModel meetingModel = MeetingModel.emptyModel();
  Future<void> getInit() async {
    meetingModel = await MeetingModel.create(widget.meetingMap, context);
    partnerModel = meetingModel.creatorModel;
    setState(() {});
  }

  @override
  void initState() {
    getInit();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final contWidth = 29.sp; //45
    return
      meetingModel.isEmpty
          ? Container()
          :
      InkWell(
        onTap: () {
          // context.router.push(MeetingInviteDetailsViewRoute(meetingModel: meetingModel, isInvitation: true));
          context.router.push(MeetingMatchingViewRoute(creatorModel: meetingModel.creatorModel, meetingModel: meetingModel, partnerModel: meetingModel.partnerModel));
        },
        child: Padding(
          padding: EdgeInsets.only(right: Res.s26),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: contWidth,
                height: contWidth,
                child: Stack(
                  children: [
                    AppCircleAvatar(
                      avatarUrl: partnerModel.avatarURL,
                      contSize: contWidth,
                      isAssetImage: false,
                    ),
                    if (partnerModel.online)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Icon(
                          Icons.circle,
                          size: Res.s12,
                          color: AppColors.salad,
                        ),
                      )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  partnerModel.name,
                  style: AppTextStyles.primary12,
                ),
              )
            ],
          ),
        ),
      );
  }
}
