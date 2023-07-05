import 'package:supabase_flutter/supabase_flutter.dart';

class AppSupabase{
  static const String apiKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBraWFxcmdja214ZG5xbGVya21mIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjM5Mzc2NzAsImV4cCI6MTk3OTUxMzY3MH0.7cmkp5glMfwICqPBtxan8f8W02vdtjZb8zVVjgdEgvo';
  static const String apiUrl = 'https://pkiaqrgckmxdnqlerkmf.supabase.co';

  // static SupabaseClient clientAnon = SupabaseClient(apiUrl, apiKey);
  static SupabaseClient client = Supabase.instance.client;

  //  _supabaseAuthenticated = supabase.createClient(SUPABASE_URL, SUPABASE_PUBLIC_ANON_KEY, {
  //   global: {
  //     headers: {
  //       Authorization: `Bearer ${user.token}`,
  //     },
  //   },
  // });

  static const String strUsers = 'users';
  static const String strClothes = 'clothes';
  static const String strMeetings = 'meetings';
  static const String strOrders = 'orders';
  static const String strNotifications = 'notifications';


  static Future<void> updateData({required Map<String, dynamic> newData, required String collRef, required int id}) async {

    if(id==0){
      return;
    }

    try {
      await AppSupabase.client
          .from(collRef)
          .update(newData)
          .eq('id', id);
    } catch (error) {
      print('updateData collRef $collRef id $id error - $error');
    }
  }


  static Future<List?> getData({required String collRef, required dynamic id}) async {

    try {
      final List list = await AppSupabase.client
          .from(collRef)
          .select()
          .eq('id', id);

      return list;

    } catch (error) {
      print('getData collRef $collRef id $id error - $error');
    }
    return null;
  }
}