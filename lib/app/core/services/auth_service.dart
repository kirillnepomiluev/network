import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {

  Future<bool> signInByEmail({
    required String email,
    required String password,
  }) async {
    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(email: email, password: password);

      final userEmail = response.user!.email;
      print('signInByEmail successfully - userEmail $userEmail');
      return true;
    } catch (error) {
      print('signInByEmail error $error');
      return false;
    }
  }

  Future<bool> signUpByEmail({
    required String email,
    required String password,
  }) async {
    try {
      final response = await Supabase.instance.client.auth
          .signUp(email: email, password: password);

      final userEmail = response.user!.email;
      print('signUpByEmail successfully - userEmail $userEmail');
      return true;
    } catch (error) {
      print('signUpByEmail error $error');
      return false;
    }
  }

  ///////////////////////////////////////////

  Future<bool> signInByPhoneGetOTP({
    required String phoneNumber,
  }) async {

    try {
      await AppSupabase.client.auth.signInWithOtp(
        phone: phoneNumber,
      );
      print('GetOTP successfully');

      return true;
    } catch (error) {
      print('GetOTP error $error');
      return false;
    }
  }

  Future<bool> signInByPhoneSendOTP({
    required String phoneNumber,
    required String otp,
  }) async {
    try {
      final result = await Supabase.instance.client.auth.verifyOTP(
        phone: phoneNumber,
        token: otp,
        type: OtpType.sms,
      );
      print('signInByPhoneSendOTP success - ${result.user!.phone}');
      return true;
    } catch (error) {
      print('signInByPhoneSendOTP error $error');
      return false;
    }
  }

  ///////////////////////////////////////////

  Future<bool> signInByFacebook() async {
    try {
      final result = await Supabase.instance.client.auth.signInWithOAuth(Provider.facebook);
      print('signInByFacebook success - $result');
      return true;
    } catch (error) {
      print('signInByFacebook error $error');
      return false;
    }
  }

  ///////////////////////////////////////////

  Future<bool> signInByGoogle() async {
    try {
      final result = await Supabase.instance.client.auth.signInWithOAuth(Provider.google);
      print('signInByGoogle success - $result');
      return true;
    } catch (error) {
      print('signInByGoogle error $error');
      return false;
    }
  }
}
