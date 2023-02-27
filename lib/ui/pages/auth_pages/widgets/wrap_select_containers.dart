import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/widgets/common/option_container.dart';
import 'package:network_app/utils/utils.dart';
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
      spacing: Res.s14,
      runSpacing: Res.s14,
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


class WrapSelectContainersTest extends StatelessWidget {
  const WrapSelectContainersTest({
    Key? key, required this.list, required this.onTap,
  }) : super(key: key);
  final List<HobbyModel> list;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Res.s14,
      runSpacing: Res.s14,
      children: [
        for (int i=0; i<list.length; i++)
          OptionsContainerTest(
            index: i,
            hobbyModel: list[i],
            onTap: onTap,
          ),
      ],
    );
  }
}
