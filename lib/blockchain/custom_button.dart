import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.title, required this.color, this.value = 0, required this.onTapped});

  final String title;
  final Color color;
  final VoidCallback onTapped;
  final int value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(
              Radius.circular(25.0),
            ),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 10,
                offset: Offset(0, 5),
              )
            ]
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(
              // fontFamily: 'vtks_distress',
              fontSize: 25.0,
              letterSpacing: 0.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
