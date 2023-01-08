import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';

class RetryLoginTextLink extends StatelessWidget {
  final VoidCallback onRetryTap;

  const RetryLoginTextLink({
    Key? key,
    required this.onRetryTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onRetryTap,
      child: SizedBox(
        height: 30,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 10,
              child: Text(
                AppString.of(context).retry,
                style: AppTextStyles.grey.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Text(
                '_____________________________',
                style: AppTextStyles.grey10.copyWith(fontWeight: FontWeight.bold)
              ),
            )
          ],
        ),
      ),
    );
  }
}
