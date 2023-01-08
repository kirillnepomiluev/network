import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';


void showSimpleDialog(
    {required String title,
      required String text,
      required BuildContext context,
      bool barrierDismissible = false}) =>
    showDialog<void>(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (BuildContext context) => CustomSimpleDialog(
          text: text,
          title: title,
          context: context,
        ));

class CustomSimpleDialog extends StatelessWidget {
  //String title, String text, BuildContext context, bool barrier
  final String title;
  final String text;
  final BuildContext context;
  const CustomSimpleDialog({
    Key? key,
    required this.title,
    required this.text,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.only(right: 20, bottom: 10),
      title: Text(title,
          textAlign: TextAlign.center,
          style: AppTextStyles.primary16
      ),
      content: Text(text,
          textAlign: TextAlign.center,
          maxLines: 10,
          style: AppTextStyles.black
      ),
      actions: [
        Center(
          child: ElevatedButton(
              onPressed: () async {
                context.router.pop();

              },
              child: const Text("Ок")
          ),
        )
      ],
    );
  }
}