import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/pages/auth_pages/start/start_vm.dart';
import 'package:network_app/ui/pages/auth_pages/start/test.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/network_row.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/res.dart';
import 'package:network_app/utils/utils.dart';
import 'package:provider/provider.dart';

class StartView extends StatelessWidget {
  const StartView({Key? key}) : super(key: key);

  Future<void> onUserChoosed(String userID, BuildContext context) async {
    final userNotifier = Provider.of<UserNotifier>(context, listen: false);
    userNotifier.setCurrentID(userID);
    await userNotifier.setUserDataFunc();
    Utils.checkReg(context);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartViewModel>(
      createModelDataEx: () => StartViewModel(context),
      builder: (context, model) {
        return Scaffold(
            body:
                // BluePage()

                Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: model.onTap,
                  child: const NetworkRow(
                    isAppBar: false,
                  ),
                ),

                // const SizedBox(
                //   height: 30,
                // ),

                // AppButton(
                //   height: Res.s57,
                //   onPressed: () {
                //     onUserChoosed(Constants().userOne, context);
                //   },
                //   text: 'Первый',
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                //
                // AppButton(
                //   height: Res.s57,
                //   onPressed: () {
                //     onUserChoosed(Constants().userTwo, context);
                //   },
                //   text: 'Второй',
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                //
                // AppButton(
                //   height: Res.s57,
                //   onPressed: () {
                //     onUserChoosed(Constants().userThree, context);
                //   },
                //   text: 'Третий',
                // ),

                // SizedBox(height: 10,),
                //
                // Text('${model.lat}, ${model.long}'),
                //
                // SizedBox(height: 20,),
                //
                // Text('${model.strLocation}'),
                //
                // SizedBox(height: 20,),
                //
                // AppButton(onPressed: model.openMap, text: 'Открыть карту'),
              ],
            ),
          ),
        ));
      },
    );
  }
}
