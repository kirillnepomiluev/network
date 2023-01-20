import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';


class AppCheckListTile extends StatefulWidget {
  const AppCheckListTile({Key? key, required this.title, this.func})
      : super(key: key);
  final Function? func;
  final String title;

  @override
  State<AppCheckListTile> createState() => _AppCheckListTileState();
}

class _AppCheckListTileState extends State<AppCheckListTile> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(-4, 0),
      child: CheckboxListTile(
        contentPadding: EdgeInsets.zero,
        checkColor: Colors.black,
        controlAffinity: ListTileControlAffinity.leading,
        value: value,
        onChanged: (newValue) {

          if (widget.func != null) {
            widget.func?.call();
          }

          setState(() {
            value = newValue!;
          });
        },
        activeColor: AppColors.salad,
        title: Transform.translate(
          offset: const Offset(-17, 0),
          child: Text(
            widget.title,
          ),
        ),
      ),
    );
  }
}

