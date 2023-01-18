import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/bottom_sheet_min_patinr.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:network_app/constants.dart';

void opeinInfoSheet({required BuildContext context, required String title}) {
  final mediaHeight = MediaQuery.of(context).size.height;
  final mediaWidth = MediaQuery.of(context).size.width;
  final height = mediaHeight * 0.9;
  showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      context: context,
      builder: (BuildContext context) => SizedBox(
        height: height,
        child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SingleChildScrollView(
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        _CustomPaint(
                          color: Colors.black.withOpacity(0.5),
                        ),
                        BlurryContainer(
                          borderRadius: BorderRadius.zero,
                          // height: height - mediaWidth * 0.07733333333333334,
                          blur: 20,
                          color: Colors.transparent,
                          padding: EdgeInsets.all(UtilsResponsive.getResSize(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text('Энергия',
                                  style: AppTextStyles.salad32
                                      .copyWith(fontWeight: FontWeight.w600)),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: UtilsResponsive.getResSize(20)),
                                child: Text(Constants.strLongLoremIpsum,
                                    style: AppTextStyles.primary16),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  top: 0,
                  child: _CustomPaint(
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
      ));
}

class _CustomPaint extends StatelessWidget {
  final Color color;
  const _CustomPaint({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    return CustomPaint(
      size: Size(
          mediaWidth,
          (mediaWidth * 0.07733333333333334)
              .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
      painter: BottomSheetMinPaint(
        color: color,
      ),
    );
  }
}

class ProgressParametr extends StatelessWidget {
  final String text1;
  final String text2;
  final IconData icon;
  final double progress;
  final bool isMeetingRow;
  const ProgressParametr({
    Key? key,
    required this.text1,
    required this.text2,
    required this.icon,
    this.isMeetingRow = false,
    this.progress = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: UtilsResponsive.getResSize(22)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
              onTap: (() {
                opeinInfoSheet(title: text1, context: context);
              }),
              child: isMeetingRow
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          text1,
                          style: TextStyle(
                            color: AppColors.textGray,
                            fontSize: UtilsResponsive.getResSize(14),
                          ),
                        ),
                        Text(
                          text2,
                          style: TextStyle(
                            color: AppColors.textGray,
                            fontSize: UtilsResponsive.getResSize(14),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichTextTwo(
                          text1: text1,
                          text2: text2,
                          fontSize: UtilsResponsive.getResSize(16),
                          fontWeight1: FontWeight.w400,
                          fontWeight2: FontWeight.w700,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: UtilsResponsive.getResSize(13)),
                          child: Icon(
                            NetworkIcons.info,
                            color: Colors.white,
                            size: UtilsResponsive.getResSize(18),
                          ),
                        )
                      ],
                    )),
          Padding(
            padding: EdgeInsets.only(top: UtilsResponsive.getResSize(12)),
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(width: 1, color: AppColors.salad)),
                  child: LinearPercentIndicator(
                    padding: EdgeInsets.zero,
                    barRadius: const Radius.circular(11),
                    lineHeight: UtilsResponsive.getResSize(40), //40
                    percent: progress,
                    backgroundColor: Colors.transparent,
                    progressColor: AppColors.salad.withOpacity(0.2),
                  ),
                ),
                Positioned(
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.salad,
                        borderRadius: BorderRadius.circular(7)),
                    width: UtilsResponsive.getResSize(24),
                    height: UtilsResponsive.getResSize(22),
                    child: Icon(
                      icon,
                      size: UtilsResponsive.getResSize(13),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
