import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:network_app/app/app.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: AppSupabase.apiUrl,
    anonKey: AppSupabase.apiKey,
    debug: false,
  );

  await dotenv.load();

  runApp(const MyApp());
}