import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/home_pages/home_messages/widgets/message_container.dart';

class MessagesWrap extends StatelessWidget {
  final List<Map<String, dynamic>> photoList;
  const MessagesWrap({
    Key? key, required this.photoList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: Wrap(
        spacing: 0.04 * mediaWidth, //15
        runSpacing: 20,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        direction: Axis.horizontal,
        children: [
          for (final photoMap in photoList)
            MessageContainer(photoMap: photoMap),
        ],
      ),
    );
  }
}
