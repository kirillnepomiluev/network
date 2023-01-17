import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/home_pages/home_messages/widgets/message_container.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MessagesWrap extends StatelessWidget {
  final List<Map<String, dynamic>> photoList;
  const MessagesWrap({
    Key? key, required this.photoList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child:
      GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: UtilsResponsive.getResSize(12),
              mainAxisSpacing: UtilsResponsive.getResSize(12),
              mainAxisExtent: 68.sp   //300
          ),
          itemCount: photoList.length,
          itemBuilder: (_, index) {
            return MessageContainer(photoMap: photoList[index]);
          })
    );
  }
}
