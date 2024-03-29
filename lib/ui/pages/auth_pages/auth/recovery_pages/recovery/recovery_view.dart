import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/auth/recovery_pages/recovery/recovery_vm.dart';
import 'package:network_app/ui/pages/auth_pages/auth/widgets/enter_row_container.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/res.dart';



class RecoveryView extends StatelessWidget {
  const RecoveryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RecoveryViewModel>(
        createModelDataEx: () => RecoveryViewModel(context),
        builder: (context, model) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [

                      const SizedBox(height: 10,),
                      const AppBackButton(),

                      EnterInfoContainer(
                        text1: '${AppString.of(context).recovery} ',
                        text2: AppString.of(context).ofAccount,
                      ),

                      SizedBox(height: Res.s57,),

                      EnterRowContainer(
                        onTap: model.onLoginEmailTap,
                        icon: Icons.email,
                        title: AppString.of(context).signInByEmail,
                      ),

                    ],
                  ),),
            ),
          );
        },);
  }
}
