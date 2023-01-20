import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';

class AppRadioList extends StatefulWidget {
  const AppRadioList({Key? key, required this.listOptions}) : super(key: key);
  final List<String> listOptions;

  @override
  State<AppRadioList> createState() => _AppRadioListState();
}

class _AppRadioListState extends State<AppRadioList> {
  dynamic groupValue;

  @override
  void initState() {
    groupValue = widget.listOptions.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(-10, 0),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(
            left: 5,
          ),
          shrinkWrap: true,
          itemCount: widget.listOptions.length,
          itemBuilder: (BuildContext context, int index) {
            return Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: AppColors.salad,
                disabledColor: AppColors.salad,
              ),
              child: RadioListTile(
                  visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity, vertical: -4,),
                  activeColor: AppColors.salad,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  // selectedTileColor: ConstColor.salad100,
                  title: Transform.translate(
                      offset: const Offset(-10, 0),
                      child: Text(
                        widget.listOptions[index],
                      ),),
                  value: widget.listOptions[index],
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value;
                    });
                  },),
            );
          },),
    );
  }
}

