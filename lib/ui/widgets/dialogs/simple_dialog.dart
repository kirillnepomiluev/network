import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/utils/res.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


void showSimpleDialog(
    {required String title,
      required String text,
      required BuildContext context,
      bool barrierDismissible = false,}) =>
    showDialog<void>(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (BuildContext context) => CustomSimpleDialog(
          text: text,
          title: title,
          context: context,
        ),);

class CustomSimpleDialog extends StatelessWidget {
  const CustomSimpleDialog({
    Key? key,
    required this.title,
    required this.text,
    required this.context,
  }) : super(key: key);
  //String title, String text, BuildContext context, bool barrier
  final String title;
  final String text;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // actionsPadding: const EdgeInsets.only(right: 20, bottom: 10),
      actionsPadding: const EdgeInsets.only(bottom: 15),
      title: Text(title,
          textAlign: TextAlign.center,
          style: AppTextStyles.black,
      ),
      content: Text(text,
          textAlign: TextAlign.center,
          maxLines: 10,
          style: AppTextStyles.black,
      ),
      actions: [
        Center(
          child: AppButton(
            width: 40.sp,
            height: Res.s40,
            borderColor: Colors.black,
              onPressed: () async {
                context.router.pop();

              },
            text: 'Ок',
              // child: const Text('Ок'),
          ),
        )
      ],
    );
  }
}