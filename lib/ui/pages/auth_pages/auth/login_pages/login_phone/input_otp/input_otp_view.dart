import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_phone/input_otp/input_otp_vm.dart';
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_phone/input_otp/widgets/otp_sent_container.dart';
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_phone/input_otp/widgets/retry_login_text_link.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';

class InputOtpView extends StatelessWidget {
  const InputOtpView({Key? key, required this.strPhone}) : super(key: key);
  final String strPhone;

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
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const AppBackButton(),
                      const SizedBox(
                        height: 31,
                      ),
                      OtpSentContainer(
                          strPhone: model.strPhone,
                          onComplete: model.onCompletePassword,
                          onValdation: model.onValdation,
                      ),
                      const SizedBox(height: 40),
                      AppButton(
                          textColor: model.enterButtonValid
                              ? AppColors.black1A
                              : AppColors.textGray,
                          buttonColor: model.enterButtonValid
                              ? Colors.white
                              : AppColors.white15,
                          // onPressed: model.onLoginTap,
                          onPressed: model.onOtpSent,
                          text: AppString.of(context).signIn,
                      ),
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
        },);
  }
}




