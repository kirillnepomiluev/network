import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';

class AppBarRow extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const AppBarRow({Key? key, this.title = '', this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AppBackButton(func: onPressed),
          Center(
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.primary18.copyWith(fontWeight: FontWeight.w500)))
        ],
      ),
    );
  }
}
