import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/models/meeting_model.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/utils/utils.dart';
import 'package:network_app/utils/res.dart';

class MeetingRequestInfoContainer extends StatefulWidget {
  const MeetingRequestInfoContainer({
    Key? key,
    required this.currentNote,
  }) : super(key: key);
  final Map<String, dynamic> currentNote;

  @override
  State<MeetingRequestInfoContainer> createState() => _MeetingRequestInfoContainerState();
}

class _MeetingRequestInfoContainerState extends State<MeetingRequestInfoContainer> {

  String partnerName = '';

 Future<void> getInit() async {
   final partnerData = await AppSupabase.client
       .from(AppSupabase.strUsers)
       .select()
       .eq('id', AppSupabase.client.auth.currentUser!.id);

   partnerName = partnerData.first['name']??'';
   setState(() {

   });

   // level = data[0]['level']??'';
}

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
    MeetingModel meetingModel = MeetingModel.fromMap(widget.currentNote);
    // DateFormat.yMMMMd('ru').format(newDate)
    final localizations = MaterialLocalizations.of(context);
    final strCreatedDate = localizations.formatShortDate(meetingModel.createdDate);
    final strSceduledDate = localizations.formatShortDate(meetingModel.scheduledDate);

    return partnerName.isEmpty? Container() : Padding(
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
                  meetingModel.type
                  // AppString.of(context).businessMeeting
                  ,
                  style: AppTextStyles.primary16
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                Text(
                  '#${meetingModel.id}',
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

            Text(partnerName),
            SizedBox(
              height: Res.s20,
            ),
            Text(
              meetingModel.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              // 'Здесь будет небольшое описание встречи, которое будет видно на 2 строчки...',
            ),
            SizedBox(
              height: Res.s20,
            ),
            Text('Встреча ${meetingModel.statusText}'),

            if(meetingModel.rateFromPartner != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Divider(color: Colors.white,),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Text('${meetingModel.rateFromPartner}'),
                    SizedBox(width: 5,),
                    Icon(Icons.star, color: AppColors.salad, size: Res.s16,)
                  ],
                ),
                SizedBox(height: 10,),
                Text('${meetingModel.fbFromPartner}'),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
