import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';


class MeetingComplaintSheet extends StatelessWidget {
  final IconData icon;
  final String text1;
  final String text2;
  final String text3;
  final String textButton;
  final VoidCallback? func;
  const MeetingComplaintSheet({
    Key? key,
    required this.icon,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.textButton,
    this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      blur: 30,
      color: Colors.transparent,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 69,),

            Icon(
              icon,
              size: 100,
              color: AppColors.salad,
            ),
            const SizedBox(height: 69,),

            RichTextTwo(
              text1: text1,
              text2: text2,
            ),
            const SizedBox(height: 35,),

            Text(
              text3,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 150,),

            AppButton(
              onPressed: func,
              text: textButton,
            ),
            const SizedBox(height: 35,),
          ],
        ),
      ),
    );
  }
}
