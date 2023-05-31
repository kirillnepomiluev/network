import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/models/meeting_model.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:provider/provider.dart';

class MeetingRateFirstViewModel extends ViewModel {
  MeetingRateFirstViewModel(this.context, this.meetingModel);
  final BuildContext context;
  double sliderValue = 1.0;
  final MeetingModel meetingModel;

  void onSliderChange(double value) {
    sliderValue = value;
    notifyListeners();
  }

  final controller = TextEditingController();

  Future<void> onRateTap() async {

    final int rate = sliderValue.toInt();
    print('rate $rate meetingID - ${meetingModel.id}');
    final starKey = UserModel.getStarsKey(rate);

    final userData = Provider.of<UserNotifier>(context, listen: false).userData;

    final isCreator = meetingModel.creatorID == userData.id;
    final keyRating = isCreator? 'rate_from_creator' : 'rate_from_partner';
    final keyFeedback = isCreator? 'fb_from_creator' : 'fb_from_partner';
    final searchID = isCreator? meetingModel.partnerID : meetingModel.creatorID;

    try {
      final List searchList = await AppSupabase.client
          .from(AppSupabase.strUsers)
          .select()
          .eq('id', searchID);

      final searchData = searchList.first;
      final UserModel searchModel = UserModel.fromMap(searchData);

      final oldValue = searchModel.dataMap[starKey];
      final newValue = oldValue + 1;

      // print('starKey $starKey oldValue $oldValue newValue $newValue');

      final userMap = {starKey: newValue};
      print('searchID $searchID userMap $userMap');


      final newMeetingData = {
        keyRating: rate,
        keyFeedback: controller.text,
        'status' : 'done'
      };

      print('meeting ID ${meetingModel.id} newMeetingData $newMeetingData');

      await AppSupabase.client
          .from(AppSupabase.strUsers)
          .update(userMap)
          .eq('id', searchID);

      await AppSupabase.client
          .from(AppSupabase.strMeetings)
          .update(newMeetingData).eq('id', meetingModel.id);

      context.router.pushAndPopUntil(HomeViewRoute(), predicate: (route) => false,);

    } catch (error) {
      print('updateData error - $error');
    }

  }
}
