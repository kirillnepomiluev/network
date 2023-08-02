import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:provider/provider.dart';

class HomeMessagesViewModel extends ViewModel {
  HomeMessagesViewModel(this.context){
    loadChats();
  }
  final BuildContext context;

  List chatsList = [];
  Future<void> loadChats() async {
    // print('loadChats');
    final userData = Provider.of<UserNotifier>(context, listen: false).userData;
    chatsList = await AppSupabase.client.from(AppSupabase.strChats).select().contains('users', [userData.id]).order('update_date')
        // .eq('started', true)
    ;
    // print('chatsList $chatsList');
    notifyListeners();
  }

}