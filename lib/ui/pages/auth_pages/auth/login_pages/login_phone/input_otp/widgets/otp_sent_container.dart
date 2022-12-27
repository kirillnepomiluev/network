import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login_phone/input_otp/widgets/input_pass_fields.dart';
import 'package:network_app/constants.dart';
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
      // decoration: BoxDecoration(
      //   color: ConstColor.white10,
      //   borderRadius: BorderRadius.circular(20),
      // ),
      // padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RichTextTwo(
            text1: 'Введите ',
            text2: 'код',
            fontSize: 24,
          ),
          const SizedBox(height: 30,),
          const Text(
            'Отправленный на номер',
            // style: TextStyle(
            //     fontSize: getResSize(14), fontWeight: FontWeight.w400
            // ),
          ),
          const SizedBox(height: 15,),
          Text(
            strPhone,
            // style: TextStyle(
            //     fontSize: getResSize(14),
            //     color: Colors.white,
            //     fontWeight: FontWeight.w400
            // ),
          ),
          const SizedBox(height: 40,),
          InputPassFields(
            onValdation: onValdation,
            onComplete: onComplete,
          ),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}
