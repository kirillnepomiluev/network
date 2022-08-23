

import 'package:flutter/material.dart';

class Constants{

  static const String strLoremIpsum = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Orci pharetra nibh integer id adipiscing odio. Enim faucibus ut vel sit sed. Sit sit neque mi id ornare malesuada sed purus. Amet dolor sed et ornare mauris amet.';

}


showSimpleDialog({required title,required text, required BuildContext context, barrier=false}){
  showDialog(
      barrierDismissible: !barrier,
      context: context,
      builder: (BuildContext context) => simpleDialog(title, text, context, barrier));
}

Widget simpleDialog(title, text, BuildContext context, barrier) {
  return AlertDialog(
    // shape: RoundedRectangleBorder(
    //   borderRadius: BorderRadius.circular(5),
    //   side: const BorderSide(color: locusYellow, width: 3),
    // ),
    actionsPadding: const EdgeInsets.only(right: 20, bottom: 10),
    title: Text( title,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontWeight: FontWeight.w400, fontSize: 16, fontFamily: 'Roboto')),

    content: barrier? null : Padding(padding: const EdgeInsets.all(1.0),
        child: Text( text,
            textAlign: TextAlign.center,
            maxLines: 10,
            style: const TextStyle(fontWeight: FontWeight.w400,
                fontSize: 14,
                fontFamily: 'Roboto',
                color: Colors.black))),

    actions: [
      Center(
        child:
        barrier? const CircularProgressIndicator():
        ElevatedButton(
            onPressed: () async {
              Navigator.of(context).pop();
            },
            child: const Text("Ок")),
      )
    ],
  );
}