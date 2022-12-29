import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/geolocation/geolocation.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/input_info_column.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/general_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InputAboutYouPage extends StatelessWidget {
  const InputAboutYouPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: SingleChildScrollView(
            child:

            InputInfoColumn(
              text1: '${AppString.of(context).tell} ',
              text2: AppString.of(context).aboutYou,
              description: AppString.of(context).thisInfoWillBeShowedInProfile,
              onContinue: (){
                FocusManager.instance.primaryFocus?.unfocus();
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (context) => const TurnOnLocationPage()));
              },
            ),
          ),
        ),
      ),
    );
  }
}
