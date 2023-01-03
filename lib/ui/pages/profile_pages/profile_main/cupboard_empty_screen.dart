import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/store_pages/store_main/store_main_page.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/general_widgets.dart';

class CupboardEmptyScreen extends StatelessWidget {
  const CupboardEmptyScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EnterInfoContainer(
            padTop: 42,
            text1: '${AppString.of(context).cupboard} ',
            text2: AppString.of(context).empty,
            description:
                AppString.of(context).visitStoreToBuyThingsForYourCharacter),

        const SizedBox(height: 59,),

        AppButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const StorePage()));
        }, text: AppString.of(context).visitStore),
      ],
    );
  }
}
