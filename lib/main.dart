import 'package:flutter/material.dart';
import 'package:network_app/app/app.dart';
import 'package:network_app/app/credentials/supabase_credentials.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: SupabaseCredentials.apiUrl,
    anonKey: SupabaseCredentials.apiKey,
  );

  runApp(const App());

}