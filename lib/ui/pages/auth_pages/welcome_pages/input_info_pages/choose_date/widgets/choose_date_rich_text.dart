import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';

class ChooseDateRichText extends StatelessWidget {
  const ChooseDateRichText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      text: const TextSpan(
        style: TextStyle(
          color: Colors.white,
          fontSize: 20, //20
          fontWeight: FontWeight.w500,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'ММ',
          ),
          TextSpan(
              text: '  /  ',
              style: TextStyle(
                color: AppColors.salad,
              )),
          TextSpan(
            text: 'DD',
          ),
          TextSpan(
              text: '  /  ',
              style: TextStyle(
                color: AppColors.salad,
              )),
          TextSpan(
            text: 'YYYY',
          ),
        ],
      ),
      // minFontSize: 14,
    );
  }
}
