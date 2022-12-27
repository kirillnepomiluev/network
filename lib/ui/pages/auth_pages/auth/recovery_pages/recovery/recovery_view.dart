import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/pages/auth_pages/auth/recovery_pages/recovery/recovery_vm.dart';
import 'package:network_app/ui/pages/auth_pages/auth/widgets/enter_row_container.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/general_widgets.dart';
import 'package:network_app/ui/widgets/view_model_data/view_model_builder.dart';


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

                      SizedBox(height: getResSize(10),),
                      const BackButtonCustom(),

                      const EnterInfoContainer(
                        padTop: 32,
                        text1: 'Восстановление ',
                        text2: 'аккаунта',
                      ),

                      SizedBox(height: getResSize(57),),

                      EnterRowContainer(
                        onTap: model.onLoginEmailTap,
                        icon: Icons.email,
                        title: 'Войти с помошью почты',
                      ),

                    ],
                  )),
            ),
          );
        });
  }
}
