import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/input_info_column.dart';
import 'package:network_app/utils/utils.dart';

class InputOccupationView extends StatefulWidget {
  const InputOccupationView({Key? key}) : super(key: key);

  @override
  State<InputOccupationView> createState() => _InputOccupationViewState();
}

class _InputOccupationViewState extends State<InputOccupationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: SingleChildScrollView(
            child: InputInfoColumn(
              text1: '${AppString.of(context).input} ',
              text2: AppString.of(context).ownOption,
              description: AppString.of(context).occupationsWillBeShowedInProfile,
              onContinue: (){
                Utils.unFocus();
                context.router.pop();
              },
            ),
          ),
        ),
      ),
    );
  }
}
