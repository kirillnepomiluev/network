import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/input_info_column.dart';


class InputStatusView extends StatelessWidget {
  const InputStatusView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: SingleChildScrollView(
            child:
            InputInfoColumn(
              text1: '${AppString.of(context).inputOwn} ',
              text2: AppString.of(context).status,
              description: AppString.of(context).statusWillShowenInYourProfile,
              onContinue: (){
                FocusManager.instance.primaryFocus?.unfocus();
                context.router.pop();
              },
            ),
          ),
        ),
      ),
    );
  }
}
