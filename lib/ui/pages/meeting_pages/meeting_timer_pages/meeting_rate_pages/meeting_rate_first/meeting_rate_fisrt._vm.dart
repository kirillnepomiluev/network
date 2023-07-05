import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/models/meeting_model.dart';
import 'package:network_app/app/core/models/user_model.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/dialogs/simple_dialog.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:provider/provider.dart';

class MeetingRateFirstViewModel extends ViewModel {
  MeetingRateFirstViewModel(this.context, this.meetingModel);
  final BuildContext context;
  double sliderValue = 0.0;
  final MeetingModel meetingModel;

  void onSliderChange(double value) {
    sliderValue = value;
    notifyListeners();
  }

  final controller = TextEditingController(text: '');

  bool showLoading = false;

  Future<void> onRateTap() async {

    showLoading = true;
    notifyListeners();

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
      final UserModel searchModel = await UserModel.create(searchData);

      final oldValue = searchModel.dataMap[starKey];
      final newValue = oldValue + 1;

      // print('starKey $starKey oldValue $oldValue newValue $newValue');

      final userMap = {
        starKey: newValue,
        'tokens' : searchModel.tokens+meetingModel.tokens,
        'meetings_count' : searchModel.meetingsCount+1,
      };
      print('searchID $searchID userMap $userMap');

      final Map<String, dynamic> newMeetingData = {
        'status' : 'done',
      };

      final text = controller.text;

      if(rate>0){
        newMeetingData.addAll({
          keyRating: rate,
        });
        if(text.isNotEmpty){
          newMeetingData.addAll({
            keyFeedback: text,
          });
        }
      }

      print('meeting ID ${meetingModel.id} newMeetingData $newMeetingData');



      //Создателю
      await AppSupabase.client
          .from(AppSupabase.strUsers)
          .update({
        'tokens' : userData.tokens+meetingModel.tokens,
        'meetings_count' : userData.meetingsCount+1,
      })
          .eq('id', userData.id);

      //Партнеру
      await AppSupabase.client
          .from(AppSupabase.strUsers)
          .update(userMap)
          .eq('id', searchID);

      await AppSupabase.client
          .from(AppSupabase.strMeetings)
          .update(newMeetingData).eq('id', meetingModel.id);

      context.router.pushAndPopUntil(HomeViewRoute(), predicate: (route) => false,);

    } catch (error) {

      showLoading = false;
      notifyListeners();
      showSimpleDialog(title: 'Error', text: error.toString(), context: context);

      print('updateData error - $error');
    }

  }
}
