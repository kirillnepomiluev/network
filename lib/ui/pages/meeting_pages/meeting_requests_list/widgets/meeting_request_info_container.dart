import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/models/meeting_model.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_invitations/widgets/meeting_go_icon.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/utils/res.dart';
import 'package:provider/provider.dart';

class MeetingRequestInfoContainer extends StatefulWidget {
  const MeetingRequestInfoContainer({
    Key? key,
    required this.meetingModel,
  }) : super(key: key);
  final MeetingModel meetingModel;

  @override
  State<MeetingRequestInfoContainer> createState() =>
      _MeetingRequestInfoContainerState();
}

class _MeetingRequestInfoContainerState
    extends State<MeetingRequestInfoContainer> {
  bool isLoading = true;

  Future<void> getInit() async {
    final partnerData = await AppSupabase.client
        .from(AppSupabase.strUsers)
        .select()
        .eq('id', widget.meetingModel.partnerID)
        .single();

    widget.meetingModel.partnerModel = UserModel.fromMap(partnerData);

    // partnerName = partnerData.first['name']??'';
    setState(() {
      isLoading = false;
    });

    // level = data[0]['level']??'';
  }

  // MeetingModel meetingModel = MeetingModel.fromMap(list[index]);

  @override
  void initState() {
    getInit();
    // StreamBuilder(
    //   stream: AppSupabase.client
    //       .from(AppSupabase.strUsers)
    //       .stream(primaryKey: ['id'])
    //       .eq('id', meetingDraft.partnerID),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       final list = snapshot.data as List<Map<String, dynamic>>;
    //       final currentMap = list.first as Map<String, dynamic>;
    //       final name = currentMap['name'];
    //       return Text(name, style: AppTextStyles.primary,);
    //     }
    //     return const Center(child: CircularProgressIndicator());
    //   },
    // )

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // MeetingModel meetingModel = MeetingModel.fromMap(widget.currentNote);
    // DateFormat.yMMMMd('ru').format(newDate)
    final localizations = MaterialLocalizations.of(context);
    final strCreatedDate =
        localizations.formatShortDate(widget.meetingModel.createdDate);
    final strSceduledDate =
        localizations.formatShortDate(widget.meetingModel.scheduledDate);

    final userData = Provider.of<UserNotifier>(context).userData;

    return isLoading
        ? Container()
        : Padding(
            padding: EdgeInsets.only(top: Res.s20),
            child: AppContainer(
              width: double.infinity,
              padV: Res.s26,
              padH: Res.s18,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.meetingModel.type
                        // AppString.of(context).businessMeeting
                        ,
                        style: AppTextStyles.primary16
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '#${widget.meetingModel.id}',
                        style: AppTextStyles.salad16
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'на $strSceduledDate',
                        style: AppTextStyles.grey,
                      ),
                      Text(
                        'от $strCreatedDate',
                        style: AppTextStyles.grey,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Res.s20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.meetingModel.partnerModel.name),
                          // Text('${widget.meetingModel.partnerModel.name}, уровень ${widget.meetingModel.partnerModel.level}'),
                          SizedBox(
                            height: Res.s20,
                          ),
                          Text(
                            widget.meetingModel.description,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            // 'Здесь будет небольшое описание встречи, которое будет видно на 2 строчки...',
                          ),
                          SizedBox(
                            height: Res.s20,
                          ),
                          Text('Встреча ${widget.meetingModel.statusText}'),
                        ],
                      ),


                      MeetingGoIcon(
                          creatorModel: userData,
                          partnerModel: widget.meetingModel.partnerModel,
                          meetingModel: widget.meetingModel),

                      // Container(
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(37),
                      //     color: Colors.transparent,
                      //     border: Border.all(color: AppColors.salad),),
                      //   width: 35.sp, //66
                      //   height: 35.sp * 1.394, //92
                      //   child: Icon(
                      //     NetworkIcons.arrow_long_right,
                      //     color: AppColors.salad,
                      //     size: 16.sp,
                      //   ),
                      // )
                    ],
                  ),
                  if (widget.meetingModel.rateFromPartner != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text('${widget.meetingModel.rateFromPartner}'),
                            const SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.star,
                              color: AppColors.salad,
                              size: Res.s16,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('${widget.meetingModel.fbFromPartner}'),
                      ],
                    ),
                ],
              ),
            ),
          );
  }
}
