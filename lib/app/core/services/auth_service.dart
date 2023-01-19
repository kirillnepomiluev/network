import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {

  Future<bool> signInService({
    required String email,
    required String password,
  }) async {
    try {
      final response = await Supabase.instance.client.auth
          .signInWithPassword(email: email, password: password);

      final userEmail = response.user!.email;
      print('signInService successfully - userEmail $userEmail');
      return true;
    } catch (error) {
      print('signInService error $error');
      return false;
    }
  }

  Future<bool> signUpService({
    required String email,
    required String password,
  }) async {
    try {
      final response = await Supabase.instance.client.auth
          .signUp(email: email, password: password);

      final userEmail = response.user!.email;
      print('signUpService successfully - userEmail $userEmail');
      return true;
    } catch (error) {
      print('signUpService error $error');
      return false;
    }
  }

  //////////////////////////////////

  Future<bool> getVerificationsCodeService({
    required String phoneNumber,
  }) async {

    try {
      await Supabase.instance.client.auth.signInWithOtp(
        phone: phoneNumber,
      );

      return true;
    } catch (error) {
      print('signInService error $error');
      return false;
    }
  }

  //////////////////////////////////////

  Future<bool> sendOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    try {
      final result = await Supabase.instance.client.auth.verifyOTP(
        phone: phoneNumber,
        token: otp,
        type: OtpType.sms,
      );

      print('sendOtp success - ${result.user!.phone}');

      return true;
    } catch (error) {
      print('sendOtp error $error');
      return false;
    }
  }
}

//// After receiving a SMS with a OTP.
// const { data, error } = await supabase
// .auth
// .verifyOtp({ phone, token })
