import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/providers/notifiers/settings_notifier.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/ui/pages/settings_pages/settings_main/settings_main_vm.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/res.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingsMainView extends StatelessWidget {
  const SettingsMainView({Key? key}) : super(key: key);

  static Future<void> updateLoc(
      {required String id, required double km}) async {
    // const longKm = 0.0150000;
    const latKm = 0.0090000;

    double lat = 61.2591628 + km * latKm;
    double long = 73.4187705;

    Map<String, dynamic> newData = {
      'lat': lat,
      'long': long,
      'location': 'POINT($long $lat)'
    };

    await AppSupabase.client.from(AppSupabase.strUsers).update(newData).eq('id', id);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsMainViewModel>(
      createModelDataEx: () => SettingsMainViewModel(context),
      builder: (context, model) {
        final userNotifier = Provider.of<UserNotifier>(context);
        final settingsNotifier = Provider.of<SettingsNotifier>(context);
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
                    const AppBarRow(title: 'Settings'),
                    SizedBox(
                      height: 23.sp, //30
                    ),
                    TextButton(
                        onPressed: () async {
                          const id1 = '6c4ba474-d378-4b64-84de-729873895b11';
                          const id2 = '8a3c903d-5be8-4551-98bb-5cef4f9ab142';
                          const id3 = 'b5fc9702-3b39-48aa-ab77-3e33b4420bf9';
                          const id4 = 'd54726fd-a7d5-447b-b43b-dcac85097776';
                          const id5 = 'c9e44e05-7ed0-4c95-8f81-d023ab2ca443';

                          print('Ok');

                          await updateLoc(id: id1, km: 0);
                          await updateLoc(id: id2, km: 0.5); //1
                          await updateLoc(id: id3, km: 1.5); //2
                          await updateLoc(id: id4, km: 2.5); //3
                          await updateLoc(id: id5, km: 3.5); //4
                        },
                        child: Text(
                          'Test button',
                          style: AppTextStyles.primary16,
                        )),
                    SizedBox(
                      height: 10.sp, //30
                    ),
                    TextButton(
                        onPressed: () {
                          userNotifier.signOut(context, settingsNotifier);
                        },
                        child: Text(
                          'Log out',
                          style: AppTextStyles.primary16,
                        ))
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
