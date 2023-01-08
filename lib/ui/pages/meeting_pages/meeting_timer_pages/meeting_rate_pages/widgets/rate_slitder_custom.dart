import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
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
                left: sliderValue == 0 ? 8 : 16,
                right: sliderValue == widget.max ? 8 : 16,
                bottom: 9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '0',
                  style: TextStyle(
                      fontSize: sliderValue == 0 ? 17.5.sp : 16.5.sp,
                      fontWeight:
                      sliderValue == 0 ? FontWeight.w700 : FontWeight.w400,
                      color: sliderValue == 0
                          ? AppColors.salad
                          : AppColors.textGray),
                ),
                Text(
                  '5',
                  style: TextStyle(
                      fontSize: sliderValue == 0 ? 17.5.sp : 16.5.sp,
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
              valueIndicatorTextStyle: const TextStyle(
                  color: AppColors.salad,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
              trackHeight: 10,
              valueIndicatorColor:
              Colors.transparent, // This is what you are asking for
              inactiveTrackColor: AppColors.white10, // Custom Gray Color
              activeTrackColor: AppColors.salad,
              thumbColor: AppColors.salad,
              overlayColor: Colors.black.withOpacity(0.1),
              // overlayColor: Color(0x29EB1555),  // Custom Thumb overlay Color
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 14.0),
              // overlayShape: RoundSliderOverlayShape(overlayRadius: 22.0),
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