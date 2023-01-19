import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_phone/input_otp/widgets/input_pass_fields.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';


class OtpSentContainer extends StatelessWidget {
  final String strPhone;
  final String? Function(String?) onValdation;
  final void Function(String) onComplete;
  const OtpSentContainer({
    Key? key,
    required this.strPhone,
    required this.onValdation,
    required this.onComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      width: double.infinity,
      padH: 18,
      padV: 23,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichTextTwo(
            text1: '${AppString.of(context).input} ',
            text2: AppString.of(context).code,
            fontSize: 24,
          ),
          const SizedBox(height: 30,),
          Text(
            AppString.of(context).sentToPhoneNumber,
          ),
          const SizedBox(height: 15,),
          Text(strPhone,),
          const SizedBox(height: 40,),
          InputPassFields(
            onValidation: onValdation,
            onComplete: onComplete,
          ),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}
