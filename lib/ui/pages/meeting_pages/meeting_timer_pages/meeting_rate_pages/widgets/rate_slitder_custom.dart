import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SliderCustom extends StatefulWidget {
  final double sLiderValue;
  final double min;
  final double max;
  final int? stepSize;
  final bool showLabelsRow;
  const SliderCustom({
    Key? key,
    required this.sLiderValue,
    required this.min,
    required this.max,
    this.stepSize,
    required this.showLabelsRow,
  }) : super(key: key);

  @override
  State<SliderCustom> createState() => _SliderCustomState();
}

class _SliderCustomState extends State<SliderCustom> {
  double sliderValue = 0;

  bool showLabel = false;

  @override
  void initState() {
    sliderValue = widget.sLiderValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.showLabelsRow) {
      showLabel =
      sliderValue == widget.min || sliderValue == widget.max ? false : true;
    }
    return Column(
      children: [
        if (widget.showLabelsRow)
          Padding(
            padding: EdgeInsets.only(
                left: sliderValue == 0 ? 8.sp : UtilsResponsive.getResSize(16),
                right: sliderValue == widget.max ? 8.sp : UtilsResponsive.getResSize(16),
                bottom: UtilsResponsive.getResSize(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '0',
                  style: TextStyle(
                      fontSize: sliderValue == 0 ? UtilsResponsive.getResSize(16) : UtilsResponsive.getResSize(15),
                      fontWeight:
                      sliderValue == 0 ? FontWeight.w700 : FontWeight.w400,
                      color: sliderValue == 0
                          ? AppColors.salad
                          : AppColors.textGray),
                ),
                Text(
                  '5',
                  style: TextStyle(
                      fontSize: sliderValue == 0 ? UtilsResponsive.getResSize(16) : UtilsResponsive.getResSize(15),
                      fontWeight: sliderValue == widget.max
                          ? FontWeight.w700
                          : FontWeight.w400,
                      color: sliderValue == widget.max
                          ? AppColors.salad
                          : AppColors.textGray),
                ),
              ],
            ),
          ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
              valueIndicatorTextStyle:
              AppTextStyles.salad16.copyWith(fontWeight: FontWeight.w700),
              trackHeight: UtilsResponsive.getResSize(10),
              valueIndicatorColor:
              Colors.transparent,
              inactiveTrackColor: AppColors.white10,
              activeTrackColor: AppColors.salad,
              thumbColor: AppColors.salad,
              overlayColor: Colors.black.withOpacity(0.1),
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: UtilsResponsive.getResSize(14)),
              overlayShape: SliderComponentShape.noThumb),
          child: Slider(
            label: sliderValue.toStringAsFixed(1),
            min: widget.min,
            max: widget.max,
            value: sliderValue,
            divisions: widget.stepSize,
            // stepSize: widget.stepSize,
            onChanged: (dynamic value) =>
                setState(() => sliderValue = value as double),
          ),
        )
      ],
    );

  }
}