import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_phone/input_otp/input_otp_vm.dart';
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_phone/input_otp/widgets/otp_sent_container.dart';
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_phone/input_otp/widgets/retry_login_text_link.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/general_widgets.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/widgets/view_model_data/view_model_builder.dart';

class InputOtpView extends StatelessWidget {
  final String strPhone;

  const InputOtpView({Key? key, required this.strPhone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InputOtpViewModel>(
        createModelDataEx: () => InputOtpViewModel(context, strPhone),
        builder: (context, model) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: getResSize(10),
                      ),
                      const BackButtonCustom(),
                      const SizedBox(
                        height: 31,
                      ),
                      OtpSentContainer(
                          strPhone: model.strPhone,
                          onComplete: model.onComplete,
                          onValdation: model.onValdation
                      ),
                      const SizedBox(height: 40),
                      AppButton(
                          textColor: model.enterButtonValid
                              ? ConstColor.black1A
                              : ConstColor.textGray,
                          buttonColor: model.enterButtonValid
                              ? Colors.white
                              : ConstColor.white15,
                          onPressed: model.onLoginTap,
                          text: 'Войти'),
                      const SizedBox(
                        height: 20,
                      ),
                      RetryLoginTextLink(onRetryTap: model.onRetryTap),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}




