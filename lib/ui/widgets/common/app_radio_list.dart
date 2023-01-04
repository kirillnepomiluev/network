import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppRadioList extends StatefulWidget {
  final List<String> listOptions;
  const AppRadioList({Key? key, required this.listOptions}) : super(key: key);

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
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Transform.translate(
        offset: const Offset(-10, 0),
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(
              left: 5,
            ),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: widget.listOptions.length,
            itemBuilder: (BuildContext context, int index) {
              return Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: AppColors.salad100,
                  disabledColor: AppColors.salad100,
                ),
                child: RadioListTile(
                    visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity, vertical: -4),
                    activeColor: AppColors.salad100,
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    // selectedTileColor: ConstColor.salad100,
                    title: Transform.translate(
                        offset: const Offset(-10, 0),
                        child: Text(
                          widget.listOptions[index],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.8.sp, //14
                              fontWeight: FontWeight.w400),
                        )),
                    value: widget.listOptions[index],
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value;
                      });
                    }),
              );
            }),
      ),
    );
  }
}

