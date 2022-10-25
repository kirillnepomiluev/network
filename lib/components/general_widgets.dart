import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/auth/login_page.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/meetings/notifications_page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:ui' as ui;


class NotificationIcon extends StatelessWidget {
  const NotificationIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 43,
      height: 44,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 43,
            height: 43,
            decoration: BoxDecoration(
              color: ConstColor.white10,
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(
              onPressed: () {
                showDialog<void>(
                  context: context,
                  useSafeArea: false,
                  builder: (BuildContext context) {
                    return const NotificationsPage();
                  },
                );

                // Navigator.of(context).push(new MaterialPageRoute<Null>(
                //     builder: (BuildContext context) {
                //       return new NotificationsPage();
                //     },
                //     fullscreenDialog: true));

                // Navigator.of(context).push(
                //     MaterialPageRoute<void>(
                //         builder: (context) =>
                //         const NotificationsPage()));
              },
              icon: const Icon(
                Network.notification,
                size: 15, //15
                color: Colors.white,
              ),
            ),
          ),
          const Positioned(
            right: 0,
            top: 0,
            child:
                // Container(
                //   width: 11,
                //   height: 11,
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     color: ConstColor.salad100
                //   ),
                // )
                Icon(
              Icons.circle,
              size: 12,
              color: ConstColor.salad100,
            ),
          )
        ],
      ),
    );
  }
}

class NetworkRow extends StatelessWidget {
  final double opacity;
  final bool isRow;
  const NetworkRow({Key? key, required this.isRow, required this.opacity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isRow == false
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _circle(),
              _text(isColumn: true),
              _social(opacity: opacity),
            ],
          )
        : Row(
            mainAxisAlignment:
                isRow ? MainAxisAlignment.start : MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _circle(),
              _text(),
            ],
          );
  }

  Widget _circle() => Container(
        width: 31.sp, //57
        height: 31.sp,
        decoration: const BoxDecoration(
            color: ConstColor.salad100, shape: BoxShape.circle),
      );

  Widget _text({bool isColumn = false}) => Padding(
        padding:
            EdgeInsets.only(left: isColumn ? 0 : 15.0, top: isColumn ? 10 : 0),
        child: Text(
          'network',
          style: TextStyle(
              fontSize: 23.5.sp, //34
              color: Colors.white,
              fontWeight: FontWeight.w500),
        ),
      );

  Widget _social({double opacity = 0.05}) => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          width: 105,
          height: 37,
          // blur: 10,
          decoration: BoxDecoration(
            // color: ConstColor.halfWhite,
            color: Colors.white.withOpacity(opacity),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Text(
              'social',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      );
}

class AuthBackScaffold extends StatelessWidget {
  bool hasTroubleEnter = false;
  final bool centerYellow;
  final Widget childColumn;
  AuthBackScaffold(
      {Key? key,
      required this.childColumn,
      this.hasTroubleEnter = false,
      required this.centerYellow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;

    // top: mediaHeight*0.15,
    return Scaffold(
      backgroundColor: ConstColor.blackBack,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                right: 0,
                child: Image.asset('assets/images/circles/ellipse_3.png')),
            Positioned(
                top: centerYellow ? mediaHeight * 0.15 : 0,
                left: 0,
                child: Image.asset('assets/images/circles/ellipse_2.png')),
            hasTroubleEnter == false
                ? Container()
                : Positioned(
                    bottom: 17.sp, //5
                    right: 17.sp, //10
                    child: troubleEnter(context)),
            childColumn
          ],
        ),
      ),
    );
  }
}

// Widget BackButtonCustom(BuildContext context, {Function? func}) {
//   final mediaWidth = MediaQuery.of(context).size.width;
//   final double contSize = 0.11466*mediaWidth; //43
//   // final double iconSize = 17.sp;   //25
//
//   return Align(
//     alignment: Alignment.topLeft,
//     child: Container(
//       // padding: EdgeInsets.all(6),
//       width: contSize,
//       height: contSize,
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.05),
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: IconButton(
//           onPressed: () {
//             if (func == null) {
//               Navigator.of(context).pop();
//             } else {
//               func();
//             }
//           },
//           icon: Icon(
//               Network.arrow_back,
//               color: Colors.white,
//               size: 15.sp  //13
//           )),
//     ),
//   );
// }

class IconContainer extends StatelessWidget {
  IconData icon;
  Color iconColor;
  double iconSize;
  Function? func;
  IconContainer(
      {Key? key,
      required this.icon,
      required this.func,
      this.iconColor = Colors.white,
      this.iconSize = 43})
      : super(key: key);

  final double contSize = 43;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: contSize,
      height: contSize,
      decoration: BoxDecoration(
        color: ConstColor.white10,
        borderRadius: BorderRadius.circular(15),
      ),
      child: IconButton(
          onPressed: () {
            if (func == null) {
              Navigator.of(context).pop();
            } else {
              func!();
            }
          },
          icon:
              // icon
              Icon(icon, color: iconColor, size: iconSize
                  // size: 15.sp  //13
                  )),
    );
  }
}

class BackButtonCustom extends StatelessWidget {
  Function? func;
  BackButtonCustom({Key? key, this.func}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: IconContainer(
          func: func,
          icon: Network.arrow_back,
          iconSize: 14.sp,
        )
        );
  }
}









Widget blurCircle({double sigma = 55, double radius = 271}) => SizedBox(
  width: radius,
  height: radius,
  child: Stack(
    children: [
      Container(
        decoration: const BoxDecoration(
          color: ConstColor.salad100,
          shape: BoxShape.circle,
        ),
        child: const Center(
            child: Text(
              'фывфывф',
              style: TextStyle(color: Colors.black),
            )),
      ),
      BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: sigma,
          sigmaY: sigma,
        ),
        child: Container(),
      ),
    ],
  ),
);

Widget statContainer({
  required BuildContext context,
  required String title,
  required String subtitle,
}) {
  final double contWidth = 45.sp; //107
  // final double contHeight =  mediaHeight*0.2853;

  return BlurryContainer(
    // padding: EdgeInsets.symmetric(vertical: 52, horizontal: 21),
    blur: 20,
    width: contWidth, //107
    // height: contWidth*1.514,  //162
    height: 55.sp, //162
    color: ConstColor.white10,
    borderRadius: BorderRadius.circular(30),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        title == ''
            ? Container()
            : Text(
          title,
          style: TextStyle(
              fontSize: 23.sp, //28
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            subtitle,
            style: TextStyle(
                fontSize: 17.5.sp, //16
                fontWeight: FontWeight.w500,
                color: Colors.white),
            textAlign: TextAlign.center,
          ),
        )
      ],
    ),
  );
}

// Widget statContainer(
//         {
//           required BuildContext context,
//           required String title,
//         required String subtitle,
//         }) {
//
//   // final mediaHeight = MediaQuery.of(context).size.height;
//   final mediaWidth = MediaQuery.of(context).size.width;
//
//   final double contWidth =  mediaWidth*0.2853;
//   // final double contHeight =  mediaHeight*0.2853;
//
//   return BlurryContainer(
//     // padding: EdgeInsets.symmetric(vertical: 52, horizontal: 21),
//     blur: 10,
//     width: contWidth,   //107
//     height: contWidth*1.514,  //162
//     color: ConstColor.halfWhite,
//     borderRadius: BorderRadius.circular(73),
//     child: Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         title == ''
//             ? Container()
//             : Text(
//                 title,
//                 style: TextStyle(
//                     fontSize: 23.sp,    //28
//                     fontWeight: FontWeight.w500,
//                     color: Colors.white),
//               ),
//         Padding(
//           padding: const EdgeInsets.only(top: 5),
//           child: Text(
//             subtitle,
//             style: TextStyle(
//                 fontSize: 17.5.sp, //16
//                 fontWeight: FontWeight.w500,
//                 color: Colors.white),
//             textAlign: TextAlign.center,
//           ),
//         )
//       ],
//     ),
//   );
// }

Widget titleStatText(String text) => Padding(
  padding: const EdgeInsets.only(
    top: 20,
  ),
  child: Text(
    text,
    style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 19.sp //20
    ),
  ),
);

Widget progressParametr(
    {required String text1,
      required IconData icon,
      required String text2,
      bool isMeetingRow = false,
      double progress = 0,
      required BuildContext context}) {
  final double fontSize = 16; //16

  return Padding(
    padding: const EdgeInsets.only(top: 22.5),
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
                    color: ConstColor.greyText,
                    fontSize: getResSize(14),
                  ),
                ),

                Text(
                  text2,
                  style: TextStyle(
                    color: ConstColor.greyText,
                    fontSize: getResSize(14),
                  ),
                ),
              ],
            )
                : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BuildRichTextTwo(
                  text1: text1,
                  text2: text2,
                  fontSize: fontSize,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 13),
                  child: Icon(
                    Network.info,
                    color: Colors.white,
                    size: 18,
                  ),
                )
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    border: Border.all(width: 1, color: ConstColor.salad100)),
                child: LinearPercentIndicator(
                  padding: EdgeInsets.zero,
                  barRadius: const Radius.circular(11),
                  lineHeight: 40, //40
                  percent: progress,
                  backgroundColor: Colors.transparent,
                  progressColor: ConstColor.salad100,
                ),
              ),
              Positioned(
                right: 10,
                child: Container(
                  decoration: BoxDecoration(
                      color: ConstColor.salad100,
                      borderRadius: BorderRadius.circular(7)),
                  width: 24,
                  height: 22,
                  child: Icon(
                    icon,
                    size: 13,
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

Widget hobbitsContainer(String text, {bool isDark = true}) => Container(
  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
  decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.1),
      // color: isDark ? Colors.grey.shade300 : Colors.grey.shade200,
      borderRadius: BorderRadius.circular(10)),
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16.5.sp, //14
            fontWeight: FontWeight.w400
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Icon(Icons.close_rounded,
          size: 22,
          color: ConstColor.salad100,
        ),
      )

    ],
  ),
);

Widget textField(String hintText, {bool isEnable = true}) => Padding(
  padding: const EdgeInsets.only(top: 10),
  child: TextFormField(
    enabled: isEnable,
    maxLines: null,
    style: TextStyle(
        fontSize: 18, //18
        fontWeight: FontWeight.w400,
        color: Colors.white
    ),
    initialValue: hintText,
    autofocus: false,
    decoration: InputDecoration(
      isDense: true,
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: ConstColor.salad100),
          borderRadius: BorderRadius.circular(20)),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: ConstColor.salad100),
          borderRadius: BorderRadius.circular(20)),
      disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: ConstColor.salad100),
          borderRadius: BorderRadius.circular(20)),
      // filled: true,
      // fillColor: Colors.white,
    ),
  ),
);




void opeinInfoSheet({required BuildContext context, required String title}) {

  final mediaTop = MediaQuery.of(context).viewPadding.top;
  final mediaHeight = MediaQuery.of(context).size.height;
  final mediaWidth = MediaQuery.of(context).size.width;
  final _height = mediaHeight*0.9;

  showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      context: context,
      builder: (BuildContext context) => Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            // blur: 30,
            color: Colors.transparent,
            // decoration: BoxDecoration(
            //     color: Colors.red,
            //     borderRadius:
            //         const BorderRadius.vertical(top: Radius.circular(30))),
            // padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
            height: _height,
            child: SingleChildScrollView(
              child: Column(
                // physics: NeverScrollableScrollPhysics(),
                children: [

                  CustomPaint(
                    size: Size(mediaWidth, (mediaWidth*0.07733333333333334).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: BottomSheetMinPaint(color: Colors.black.withOpacity(0.5),),
                  ),

                  BlurryContainer(
                    borderRadius: BorderRadius.zero,
                    height: _height-mediaWidth*0.07733333333333334,
                    blur: 20,
                    color: Colors.transparent,
                    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [

                        Text('Энергия',
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              color: ConstColor.salad100
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            Constants.strLoremIpsum+Constants.strLoremIpsum+Constants.strLoremIpsum
                            // + '\n' +
                            // Constants.strLoremIpsum+Constants.strLoremIpsum+Constants.strLoremIpsum
                            // + '\n' +
                            // Constants.strLoremIpsum+Constants.strLoremIpsum+Constants.strLoremIpsum
                            ,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        )

                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),

          CustomPaint(
            size: Size(mediaWidth, (mediaWidth*0.07733333333333334).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: BottomSheetMinPaint(color: Colors.transparent),
          ),

        ],
      )
  );
}








ButtonStyle buttonStyleCustom({
  double padH = 61,
  double padV = 17,
  double radius = 52,
  Color color = Colors.white,
}) =>
    ButtonStyle(
      padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: padV, horizontal: padH)),
      backgroundColor: MaterialStateProperty.all(color),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );

class BuildRichTextTwo extends StatelessWidget {
  final String text1;
  final String text2;
  final double fontSize;
  FontWeight fontWeight1;
  FontWeight fontWeight2;
  BuildRichTextTwo({
    Key? key,
    required this.text1,
    required this.text2,
    required this.fontSize,
    this.fontWeight1 = FontWeight.w400,
    this.fontWeight2 = FontWeight.w700,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize, // 20.sp, //24
          fontWeight: fontWeight1,
        ),
        children: <TextSpan>[
          TextSpan(
            text: text1,
          ),
          TextSpan(
              text: text2,
              style: TextStyle(
                fontWeight: fontWeight2,
                color: ConstColor.salad100,
              )),
        ],
      ),
      // minFontSize: 14,
    );
  }
}










class StatColumn extends StatelessWidget {
  const StatColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // titleStatText('Уровень Базовый'),

        BuildRichTextTwo(
          text1: 'Уровень ',
          text2: 'Базовый',
          fontSize: 19.sp,  //20
          fontWeight1: FontWeight.w600,
          fontWeight2: FontWeight.w600,
        ),

        progressParametr(
            context: context,
            text1: '5 встреч',
            text2: 'Еще 25 встреч',
            progress: 0.25,
            isMeetingRow: true,
            icon: Network.people
        ),

        titleStatText('Статистика'),
        progressParametr(
            context: context,
            text1: 'Энергии на встречи  ',
            text2: '3/5',
            icon: Network.electric
        ),

        progressParametr(
            context: context,
            text1: 'Скорость восстановления  ',
            text2: 'x1.5',
            icon: Network.speedometer
        ),
        progressParametr(
            context: context,
            text1: 'Баллы за встречи  ',
            text2: '150',
            icon: Network.rhombus
        ),
        progressParametr(
          context: context,
          text1: 'Количество сообщений в день  ',
          text2: '200',
          icon:
          Network.email_outlined,
          // Icons.email_outlined
        ),
        progressParametr(
            context: context,
            text1: 'Количество лайков в день  ',
            text2: '50',
            icon: Network.heart
        ),
      ],
    );
  }
}



class BottomSheetMinPaint extends CustomPainter {

  final Color? color;

  BottomSheetMinPaint({this.color});

  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.3595147,size.height*0.2597538);
    path_0.cubicTo(size.width*0.3422027,size.height*0.1122728,size.width*0.3226800,0,size.width*0.3019493,0);
    path_0.lineTo(size.width*0.08000000,0);
    path_0.cubicTo(size.width*0.03581733,0,0,size.height*0.4631552,0,size.height*1.034483);
    path_0.lineTo(0,size.height*23.20690);
    path_0.cubicTo(0,size.height*23.77824,size.width*0.03581733,size.height*24.24138,size.width*0.08000000,size.height*24.24138);
    path_0.lineTo(size.width*0.9200000,size.height*24.24138);
    path_0.cubicTo(size.width*0.9641840,size.height*24.24138,size.width,size.height*23.77824,size.width,size.height*23.20690);
    path_0.lineTo(size.width,size.height*1.034483);
    path_0.cubicTo(size.width,size.height*0.4631552,size.width*0.9641840,0,size.width*0.9200000,0);
    path_0.lineTo(size.width*0.6953840,0);
    path_0.cubicTo(size.width*0.6746533,0,size.width*0.6551307,size.height*0.1122728,size.width*0.6378187,size.height*0.2597534);
    path_0.cubicTo(size.width*0.6015173,size.height*0.5690138,size.width*0.5525467,size.height*0.7586207,size.width*0.4986667,size.height*0.7586207);
    path_0.cubicTo(size.width*0.4447867,size.height*0.7586207,size.width*0.3958160,size.height*0.5690138,size.width*0.3595147,size.height*0.2597538);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = color??ConstColor.white10;
    canvas.drawPath(path_0,paint_0_fill);

    Paint paint_1_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.01866667;
    paint_1_stroke.color=Color(0xffE2FF2D).withOpacity(1.0);
    paint_1_stroke.strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(size.width*0.4560000,size.height*0.1206897),Offset(size.width*0.5440320,size.height*0.1206897),paint_1_stroke);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}



class RadioList extends StatefulWidget {
  final List<String> listOptions;
  const RadioList({Key? key, required this.listOptions}) : super(key: key);

  @override
  State<RadioList> createState() => _RadioListState();
}

class _RadioListState extends State<RadioList> {
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
                  unselectedWidgetColor: ConstColor.salad100,
                  disabledColor: ConstColor.salad100,
                ),
                child: RadioListTile(
                    visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity, vertical: -4),
                    activeColor: ConstColor.salad100,
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
                              fontWeight: FontWeight.w400
                          ),
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