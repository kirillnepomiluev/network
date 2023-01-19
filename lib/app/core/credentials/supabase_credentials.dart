import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseCredentials{
  static const String apiKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBraWFxcmdja214ZG5xbGVya21mIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjM5Mzc2NzAsImV4cCI6MTk3OTUxMzY3MH0.7cmkp5glMfwICqPBtxan8f8W02vdtjZb8zVVjgdEgvo';
  static const String apiUrl = 'https://pkiaqrgckmxdnqlerkmf.supabase.co';

  static SupabaseClient supabaseClient = SupabaseClient(apiUrl, apiKey);
}