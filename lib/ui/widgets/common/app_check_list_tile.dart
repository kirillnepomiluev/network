import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';


class AppCheckListTile extends StatefulWidget {
  final Function? func;
  final String title;
  const AppCheckListTile({Key? key, required this.title, this.func})
      : super(key: key);

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
            widget.func!();
          }

          setState(() {
            value = newValue!;
          });
        },
        activeColor: AppColors.salad100,
        title: Transform.translate(
          offset: const Offset(-17, 0),
          child: Text(
            widget.title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

