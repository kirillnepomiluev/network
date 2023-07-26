import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:network_app/app/app.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:io';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: AppSupabase.apiUrl,
    anonKey: AppSupabase.apiKey,
    debug: false,
  );

  // WalletProvider walletProvider = WalletProvider();
  // await walletProvider.loadPrivateKey();

  await dotenv.load();

  // HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}