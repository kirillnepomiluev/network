import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/services/auth_service.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:network_app/utils/main_pages/dialog_utls.dart';
import 'package:network_app/utils/utils.dart';

class LoginEmailViewModel extends ViewModel {
  LoginEmailViewModel(this.context);
  final BuildContext context;

  bool showLoading = false;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  final emailContr = TextEditingController(text: '');
  final passwordContr = TextEditingController(text: '');

  void goBack() {
    Utils.unFocus();
    SystemChannels.textInput.invokeMethod<void>('TextInput.hide');

    Future.delayed(const Duration(milliseconds: 100))
        .then((value) => context.router.pop());
  }

  Future<void> signInByEmail() async {
    var formdata = formstate.currentState;

    if (formdata!.validate()) {
      showLoading = true;
      notifyListeners();
      bool isSuccess = await AuthService().signInByEmail(
        email: emailContr.text,
        password: passwordContr.text,
      );
      showLoading = false;
      notifyListeners();

      print('isSuccess $isSuccess');
      if (isSuccess) {
        Utils.checkReg(context);
      }
      else{
        DialogUtils.showScaffoldMessage(context, 'Неверный логин или пароль');
      }
    }
  }

  Future<void> signUpByEmail() async {
    var formdata = formstate.currentState;

    if (formdata!.validate()) {
      showLoading = true;
      notifyListeners();
      bool isSuccess = await AuthService().signUpByEmail(
        email: emailContr.text,
        password: passwordContr.text,
      );
      showLoading = false;
      notifyListeners();
      print('isSuccess $isSuccess');
      if (isSuccess) {
        print('Переход');
        context.router.push(const RegSuccessViewRoute());
      }
      else{
        DialogUtils.showScaffoldMessage(context, 'Неверный логин или пароль');
      }
    }
  }

  Future<void> signOut() async {
    if(AppSupabase.client.auth.currentUser==null){
      print('не авторизован');
    }
    else{
      final id = AppSupabase.client.auth.currentUser!.id;
      print('авторизован id $id');
      await AppSupabase.client.auth.signOut();
    }
  }

}




