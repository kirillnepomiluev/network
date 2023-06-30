import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/settings_pages/settings_main/settings_main_vm.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/res.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingsMainView extends StatelessWidget {
  const SettingsMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsMainViewModel>(
      createModelDataEx: () => SettingsMainViewModel(context),
      builder: (context, model) {

        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Res.s16,
                  vertical: Res.s10,
                ),
                child: Column(
                  children: [
                    const AppBarRow(),
                    SizedBox(
                      height: 23.sp, //30
                    ),

                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
