import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';

class ChooseDateRichText extends StatelessWidget {
  const ChooseDateRichText({
    Key? key, required this.year, required this.month, required this.day, required this.onTap,
  }) : super(key: key);
  final String year;
  final String month;
  final String day;
  final Function(BuildContext) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap(context);
      },
      child: RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20, //20
            fontWeight: FontWeight.w500,
          ),
          children: <TextSpan>[
            TextSpan(
              text: year,
            ),
            const TextSpan(
                text: '  /  ',
                style: TextStyle(
                  color: AppColors.salad,
                ),),
            TextSpan(
              text: month,
            ),
            const TextSpan(
                text: '  /  ',
                style: TextStyle(
                  color: AppColors.salad,
                ),),
            TextSpan(
              text: day,
            ),
          ],
        ),
        // minFontSize: 14,
      ),
    );
  }
}
