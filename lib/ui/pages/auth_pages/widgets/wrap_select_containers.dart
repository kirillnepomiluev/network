import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/widgets/common/option_container.dart';

class WrapSelectContainers extends StatelessWidget {
  final List<String> list;
  final VoidCallback? onTap;
  const WrapSelectContainers({
    Key? key, this.list = Constants.hobbiesList, this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 14,
      runSpacing: 14,
      direction: Axis.horizontal,
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
