import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/widgets/common/option_container.dart';

class WrapSelectContainers extends StatelessWidget {
  const WrapSelectContainers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 14,
      runSpacing: 14,
      direction: Axis.horizontal,
      children: [
        for (final item in Constants.hobbiesList)
          OptionsContainer(
            title: item,
          ),
      ],
    );
  }
}
