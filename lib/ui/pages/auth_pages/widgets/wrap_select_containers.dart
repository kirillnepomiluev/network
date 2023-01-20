import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/widgets/common/option_container.dart';
import 'package:network_app/utils/utils_responsive.dart';

class WrapSelectContainers extends StatelessWidget {
  const WrapSelectContainers({
    Key? key, this.list = Constants.hobbiesList, this.onTap,
  }) : super(key: key);
  final List<String> list;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: UtilsResponsive.getResSize(14),
      runSpacing: UtilsResponsive.getResSize(14),
      children: [
        for (final item in list)
          OptionsContainer(
            title: item,
            onTap: onTap,
          ),
      ],
    );
  }
}
