import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';

class MeetingRateFirstViewModel extends ViewModel {
  MeetingRateFirstViewModel(this.context, this.meetingModel);
  final BuildContext context;
  double sliderValue = 1.0;
  final MeetingModel meetingModel;

  void onSliderChange(double value) {
    sliderValue = value;
    notifyListeners();
  }

  Future<void> onRateTap() async {

    final int rate = sliderValue.toInt();
    print('rate $rate');
    final starKey = UserModel.getStarsKey(rate);

    try {
      final List partnerList = await AppSupabase.client
          .from(AppSupabase.strUsers)
          .select()
          .eq('id', meetingModel.partnerID);

      final partnerData = partnerList.first;
      final UserModel partnerModel = UserModel.fromJson(partnerData);

      final oldValue = partnerModel.dataMap[starKey];
      final newValue = oldValue + 1;

      print('starKey $starKey oldValue $oldValue newValue $newValue');

      await AppSupabase.client
          .from(AppSupabase.strUsers)
          .update({starKey: newValue})
          .eq('id', meetingModel.partnerID);

      ///////////////////////////////////////////////

      await AppSupabase.client
          .from(AppSupabase.strMeetings)
          .update({'partner_rating': rate}).eq('id', meetingModel.id);

      context.router.pushAndPopUntil(HomeViewRoute(), predicate: (route) => false,);
    } catch (error) {
      print('updateData error - $error');
    }

  }
}
