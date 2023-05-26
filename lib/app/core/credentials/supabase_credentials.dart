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


  // static Future<List> selectData() async {
  //
  //   final stream = client.from(strUsers).select().eq('id', 'value');
  //
  //   return [];
  // }

}