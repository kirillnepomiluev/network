import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/auth/recovery_pages/recovery_email/recovery_email_vm.dart';
import 'package:network_app/ui/pages/auth_pages/auth/recovery_pages/recovery_email/widgets/email_field.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';

class RecoveryEmailView extends StatelessWidget {
  const RecoveryEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return ViewModelBuilder<RecoveryEmailViewModel>(
      createModelDataEx: () => RecoveryEmailViewModel(context),
      builder: (context, model) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),
                    const AppBackButton(),

                    EnterInfoContainer(
                      padTop: 32,
                      text1: '${AppString.of(context).inputAddress} ',
                      text2: AppString.of(context).ofEmail,
                      description: AppString.of(context).toRecoveryAccess,
                    ),

                    const SizedBox(height: 36,),
                    const EmailField(),
                    const SizedBox(height: 62,),

                    AppButton(
                        onPressed: model.onSendTap,
                        text: AppString.of(context).recoveryAccess
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