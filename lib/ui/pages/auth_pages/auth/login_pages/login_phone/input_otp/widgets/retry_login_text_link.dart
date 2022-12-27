import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';

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
          children: const [
            Positioned(
              bottom: 10,
              child: Text(
                'Повторить попытку',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ConstColor.textGray),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Text(
                '_____________________________',
                style: TextStyle(
                    fontSize: 10,
                    color: ConstColor.textGray,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
