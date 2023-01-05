import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/icons/app_icon_container.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MessagesBarRow extends StatelessWidget {
  const MessagesBarRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppBackButton(func: () {}),
          Text(
            AppString.of(context).messages,
            style: TextStyle(
                // color: Colors.black,
                fontSize: 19.5.sp, //20
                fontWeight: FontWeight.w600),
          ),
          AppIconContainer(
            icon: NetworkIcons.search,
            iconSize: 16.sp, //17
          )
        ],
      ),
    );
  }
}
