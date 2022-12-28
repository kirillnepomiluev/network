import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/network_icons.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/pages/meeting_pages/notifications/notifications_page.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:network_app/utils/responsive_utils.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:ui' as ui;


Widget profileAvatarRow({String title = 'Тимофей, 37', bool showNotifications = true}) => Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    //ава
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.only(right: 20),
            child: SizedBox(
              width: 60,
              height: 60,
              child: CircleAvatar(
                backgroundColor: AppColors.salad100,
                foregroundImage:
                AssetImage('assets/images/avatars/avatar_0.png'),
              ),
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp, //18
                  fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 6, horizontal: 9),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.white10),
                  child: Center(
                      child: Text(
                        'я люблю веселиться 😁',
                        style: TextStyle(
                            fontSize: 15.5.sp, //12
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ))),
            ),
          ],
        ),
      ],
    ),

    if(showNotifications)
    const Padding(
      padding: EdgeInsets.only(right: 16),
      child: NotificationIcon(),
    ),
  ],
);


class CustomCircleAvatar extends StatelessWidget {
  final String imageUrl;
  final double contSize;
  const CustomCircleAvatar({Key? key, required this.imageUrl, required this.contSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
              imageUrl
          ),
          fit: BoxFit.fitHeight,
          // alignment: Alignment.bottomCenter
        ),
      ),
      width: contSize, //120
      height: contSize,
    );
  }
}


Widget rhombusText(
        {String text = '+150',
        double iconSize = 15,
        double fontSize = 14,
        double padLeft = 5,
        FontWeight fontWeight = FontWeight.w400}) =>
    Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: fontSize, //14
              color: AppColors.salad100,
              fontWeight: fontWeight),
        ),
        Padding(
          padding: EdgeInsets.only(left: padLeft),
          child: Icon(
            NetworkIcons.rhombus,
            color: AppColors.salad100,
            size: iconSize,
          ),
        )
      ],
    );

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
              color: AppColors.white10,
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
              },
              icon: const Icon(
                NetworkIcons.notification,
                size: 15, //15
                color: Colors.white,
              ),
            ),
          ),
          const Positioned(
            right: 0,
            top: 0,
            child: Icon(
              Icons.circle,
              size: 12,
              color: AppColors.salad100,
            ),
          )
        ],
      ),
    );
  }
}

class HobbySelected extends StatefulWidget {
  final String title;
  final Function? func;
  const HobbySelected({Key? key, required this.title, this.func}) : super(key: key);

  @override
  State<HobbySelected> createState() => _HobbySelectedState();
}

class _HobbySelectedState extends State<HobbySelected> {

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {

    final mediaWitdh = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: (() {

        if(widget.func!=null){
          widget.func!();
        }

        setState(() {
          isSelected = !isSelected;
        });
      }),
      child: Container(
        padding: EdgeInsets.all(mediaWitdh*0.0373), //14
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.salad100
              : AppColors.white10,
          borderRadius: BorderRadius.circular(12),
        ),
        child:
        Text(
          widget.title,
          style: TextStyle(
              color:
              isSelected
                  ? Colors.black
                  : AppColors.textWhite,
              fontSize: 15.5.sp, //12
              fontWeight: FontWeight.w400
          ),
        ),
      ),
    );
  }
}




// class EnterRowContainer extends StatelessWidget {
//   final VoidCallback onTap;
//   final IconData? icon;
//   final String iconName;
//   final String title;
//   const EnterRowContainer({Key? key, this.icon, this.iconName='', required this.title, required this.onTap}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  InkWell(
//       onTap: onTap,
//       child: Container(
//           decoration: BoxDecoration(
//             color: ConstColor.white10,
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Row(
//             children: [
//               Padding(
//                   padding: const EdgeInsets.only(
//                     top: 4,
//                     bottom: 4,
//                     left: 4,
//                     right: 24, //24
//                   ),
//                   child: Container(
//                     width: 54,
//                     height: 54,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(13)),
//                     child: icon != null
//                         ? Icon(icon,
//                         color: Colors.black, size: 21)
//                         : Padding(
//                       padding: const EdgeInsets.all(17),
//                       child:
//                       Image.asset(
//                       iconName=='logo_facebook'? Assets.images.icons.logoFacebook.keyName :Assets.images.icons.logoGoogle.keyName,
//                         width: 21.sp, //24
//                         height: 21.sp,
//                       ),
//
//                     ),
//                   )),
//               Text(
//                 title,
//                 style: TextStyle(
//                     fontSize: ResponsiveUtils.getResSize(16), //16
//                     color: Colors.white,
//                     fontWeight: FontWeight.w400),
//               )
//             ],
//           )),
//     );
//   }
// }



class IconContainer extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color? contColor;
  final double? iconSize;
  final double? contSize;
  final Function? func;
  const IconContainer(
      {Key? key,
      required this.icon,
      this.func,
      this.iconColor = Colors.white,
      this.contColor,
      this.iconSize,
      this.contSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: contSize ?? 28.sp, //43
      height: contSize ?? 28.sp,
      decoration: BoxDecoration(
        color: contColor ?? AppColors.white10,
        borderRadius: BorderRadius.circular(15),
      ),
      child: IconButton(
          onPressed: () {
            if (func != null) {
              func!();
            }
          },
          icon:
              // icon
              Icon(icon, color: iconColor, size: iconSize ?? 20.sp //20
                  // size: 15.sp  //13
                  )),
    );
  }
}

class BackButtonCustom extends StatelessWidget {
  final VoidCallback? func;
  final Color? contColor;
  const BackButtonCustom({Key? key, this.func, this.contColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: IconContainer(
          func: func ?? Navigator.of(context).pop,
          icon: NetworkIcons.arrow_back,
          iconSize: 14.sp,
          contColor: contColor,
        ));
  }
}

Widget blurCircle({double sigma = 55, double radius = 271}) => SizedBox(
      width: radius,
      height: radius,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.salad100,
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
    color: AppColors.white10,
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


Widget titleStatText(String text) => Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
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
  const double fontSize = 16; //16

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
                          color: AppColors.textGray,
                          fontSize: ResponsiveUtils.getResSize(14),
                        ),
                      ),
                      Text(
                        text2,
                        style: TextStyle(
                          color: AppColors.textGray,
                          fontSize: ResponsiveUtils.getResSize(14),
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
                        fontSize: fontSize,
                        fontWeight1: FontWeight.w400,
                        fontWeight2: FontWeight.w700,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 13),
                        child: Icon(
                          NetworkIcons.info,
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
                    border: Border.all(width: 1, color: AppColors.salad100)),
                child: LinearPercentIndicator(
                  padding: EdgeInsets.zero,
                  barRadius: const Radius.circular(11),
                  lineHeight: 40, //40
                  percent: progress,
                  backgroundColor: Colors.transparent,
                  progressColor: AppColors.salad100.withOpacity(0.2),
                ),
              ),
              Positioned(
                right: 10,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.salad100,
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

Widget hobbitsContainer(String text, {bool hasEdit = true}) => Container(
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
                fontWeight: FontWeight.w400),
          ),
          hasEdit == false
              ? Container()
              : const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Icon(
                    Icons.close_rounded,
                    size: 22,
                    color: AppColors.salad100,
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
        style: const TextStyle(
            fontSize: 18, //18
            fontWeight: FontWeight.w400,
            color: Colors.white),
        initialValue: hintText,
        autofocus: false,
        decoration: InputDecoration(
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: AppColors.salad100),
              borderRadius: BorderRadius.circular(20)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: AppColors.salad100),
              borderRadius: BorderRadius.circular(20)),
          disabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: AppColors.salad100),
              borderRadius: BorderRadius.circular(20)),
          // filled: true,
          // fillColor: Colors.white,
        ),
      ),
    );

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
      builder: (BuildContext context) => Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                color: Colors.transparent,
                height: height,
                child: SingleChildScrollView(
                  child: Column(
                    // physics: NeverScrollableScrollPhysics(),
                    children: [
                      CustomPaint(
                        size: Size(
                            mediaWidth,
                            (mediaWidth * 0.07733333333333334)
                                .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                        painter: BottomSheetMinPaint(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      BlurryContainer(
                        borderRadius: BorderRadius.zero,
                        height: height - mediaWidth * 0.07733333333333334,
                        blur: 20,
                        color: Colors.transparent,
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 15, top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Text(
                              'Энергия',
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.salad100),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                Constants.strLongLoremIpsum
                                ,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
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
                size: Size(
                    mediaWidth,
                    (mediaWidth * 0.07733333333333334)
                        .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: BottomSheetMinPaint(color: Colors.transparent),
              ),
            ],
          ));
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


class StatColumn extends StatelessWidget {
  final bool ifProfileSheet;
  const StatColumn({Key? key, this.ifProfileSheet = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // titleStatText('Уровень Базовый'),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const RichTextTwo(
              text1: 'Уровень ',
              text2: 'Базовый',
            ),

            Container(
              decoration: BoxDecoration(
                  color: AppColors.salad100,
                  borderRadius: BorderRadius.circular(7)),
              width: 24,
              height: 22,
              child: const Icon(
                Icons.mode_edit_outline_outlined,
                size: 13,
              ),
            ),

          ],
        ),

        const SizedBox(height: 5,),

        progressParametr(
            progress: 0.3,
            context: context,
            text1: 'Токены за встречи  ',
            text2: '150',
            icon: NetworkIcons.rhombus
        ),

        const SizedBox(height: 15,),

        if(ifProfileSheet)
          const RichTextTwo(
            text1: 'До следущего уровня осталось\nнабрать ',
            text2: '1500 токенов',
            fontSize: 14,
            fontWeight1: FontWeight.w500,
            fontWeight2: FontWeight.w500,
          ),

        if(ifProfileSheet)
          Padding(
          padding: const EdgeInsets.only(top: 25, bottom: 7),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 20
              ),
              backgroundColor: AppColors.salad100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13)
              )
            ),
              onPressed: (){},
              child: const Text("Докупить токены",
              style: TextStyle(
                color: AppColors.textBlack
              ),
              )
          ),
        ),


        if(ifProfileSheet)
        progressParametr(
            context: context,
            text1: '5 встреч',
            text2: 'Еще 25 встреч',
            progress: 0.25,
            isMeetingRow: true,
            icon: NetworkIcons.people),

        titleStatText('Статистика'),
        progressParametr(
            context: context,
            text1: 'Энергии на встречи  ',
            text2: '3/5',
            icon: NetworkIcons.electric),

        progressParametr(
            context: context,
            text1: 'Скорость восстановления  ',
            text2: 'x1.5',
            icon: NetworkIcons.speedometer),
        progressParametr(
            context: context,
            text1: 'Баллы за встречи  ',
            text2: '150',
            icon: NetworkIcons.rhombus),
        progressParametr(
          context: context,
          text1: 'Количество сообщений в день  ',
          text2: '200',
          icon: NetworkIcons.email_outlined,
          // Icons.email_outlined
        ),
        progressParametr(
            context: context,
            text1: 'Количество лайков в день  ',
            text2: '50',
            icon: NetworkIcons.heart),
      ],
    );
  }
}

class CustomCheckListTile extends StatefulWidget {
  final Function? func;
  final String title;
  const CustomCheckListTile({Key? key, required this.title, this.func}) : super(key: key);

  @override
  State<CustomCheckListTile> createState() => _CustomCheckListTileState();
}

class _CustomCheckListTileState extends State<CustomCheckListTile> {
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
        onChanged: (newValue){

          if(widget.func!=null){
            widget.func!();
          }

          setState(() {
            value = newValue!;
          });
        },
        activeColor: AppColors.salad100,
        title: Transform.translate(
          offset: const Offset(-17, 0),
          child: Text(widget.title, style: const TextStyle(
            color: Colors.white
          ),),
        ),
      ),
    );
  }
}



class BottomSheetMinPaint extends CustomPainter {
  final Color? color;

  BottomSheetMinPaint({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3595147, size.height * 0.2597538);
    path_0.cubicTo(size.width * 0.3422027, size.height * 0.1122728,
        size.width * 0.3226800, 0, size.width * 0.3019493, 0);
    path_0.lineTo(size.width * 0.08000000, 0);
    path_0.cubicTo(size.width * 0.03581733, 0, 0, size.height * 0.4631552, 0,
        size.height * 1.034483);
    path_0.lineTo(0, size.height * 23.20690);
    path_0.cubicTo(
        0,
        size.height * 23.77824,
        size.width * 0.03581733,
        size.height * 24.24138,
        size.width * 0.08000000,
        size.height * 24.24138);
    path_0.lineTo(size.width * 0.9200000, size.height * 24.24138);
    path_0.cubicTo(size.width * 0.9641840, size.height * 24.24138, size.width,
        size.height * 23.77824, size.width, size.height * 23.20690);
    path_0.lineTo(size.width, size.height * 1.034483);
    path_0.cubicTo(size.width, size.height * 0.4631552, size.width * 0.9641840,
        0, size.width * 0.9200000, 0);
    path_0.lineTo(size.width * 0.6953840, 0);
    path_0.cubicTo(
        size.width * 0.6746533,
        0,
        size.width * 0.6551307,
        size.height * 0.1122728,
        size.width * 0.6378187,
        size.height * 0.2597534);
    path_0.cubicTo(
        size.width * 0.6015173,
        size.height * 0.5690138,
        size.width * 0.5525467,
        size.height * 0.7586207,
        size.width * 0.4986667,
        size.height * 0.7586207);
    path_0.cubicTo(
        size.width * 0.4447867,
        size.height * 0.7586207,
        size.width * 0.3958160,
        size.height * 0.5690138,
        size.width * 0.3595147,
        size.height * 0.2597538);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = color ?? AppColors.white10;
    canvas.drawPath(path_0, paint0Fill);

    Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01866667;
    paint1Stroke.color = const Color(0xffE2FF2D).withOpacity(1.0);
    paint1Stroke.strokeCap = StrokeCap.round;
    canvas.drawLine(
        Offset(size.width * 0.4560000, size.height * 0.1206897),
        Offset(size.width * 0.5440320, size.height * 0.1206897),
        paint1Stroke);
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

// class ChangeTabContainer extends StatelessWidget {
//   int activeTab = 1;
//   final int activeTabInit;
//   final int position;
//   final String text;
//   final Function func;
//
//   ChangeTabContainer({
//     Key? key,
//     required this.func,
//     required this.activeTabInit,
//     required this.position,
//     required this.text,
//   }) : super(key: key) {
//     activeTab = activeTabInit;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 10),
//       child: InkWell(
//         onTap: () {
//           func();
//         },
//         child: BlurryContainer(
//           blur: 20,
//           color: ConstColor.white10,
//           borderRadius: BorderRadius.circular(20),
//           padding: EdgeInsets.symmetric(
//             vertical: 18.5.sp, //19
//           ),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 20),
//                 child: Text(
//                   text,
//                   style: TextStyle(
//                       color: activeTab == position
//                           ? ConstColor.salad100
//                           : Colors.white,
//                       fontSize: 16.5.sp, //14
//                       fontWeight: FontWeight.w500),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 5, right: 16),
//                 child: activeTab == position
//                     ? Icon(
//                         Icons.keyboard_arrow_down,
//                         color: ConstColor.salad100,
//                         size: 19.sp, //20
//                       )
//                     : Icon(
//                         Icons.keyboard_arrow_right,
//                         color: Colors.white,
//                         size: 19.sp, //20
//                       ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class MeetRow extends StatelessWidget {
  final Function? func;
  final bool isExchange;
  const MeetRow({Key? key, this.func, this.isExchange = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaWitdh = MediaQuery.of(context).size.width;
    final double contSize = mediaWitdh * 0.128; //48
    final double iconSize = 19.sp; //25
//20

    return isExchange
        ? InkWell(
            onTap: () {
              if (func != null) {
                func!();
              }
            },
            child: Container(
              // height: 54,
              // width: 209,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconContainer(
                    icon: NetworkIcons.arrow_long_right,
                    iconSize: iconSize,
                    contSize: contSize,
                    contColor: AppColors.black1A,
                    func: () {
                      if (func != null) {
                        func!();
                      }
                    },
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                        left: mediaWitdh * 0.0453, //17
                        right: 8),
                    child: Text('Обменять',
                        style: TextStyle(
                            color: AppColors.textBlack,
                            fontSize: 15.sp, //12
                            fontWeight: FontWeight.w500)),
                  ),

                  //иконка >>
                  Padding(
                    padding: EdgeInsets.only(right: mediaWitdh * 0.056), //21
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: Stack(
                        children: const [
                          Positioned(
                              left: 0,
                              child: Icon(
                                Icons.keyboard_arrow_right,
                                size: 20,
                                color: AppColors.grey,
                              )),
                          Positioned(
                              left: 6,
                              child: Icon(
                                Icons.keyboard_arrow_right,
                                size: 20,
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // IconContainer(
              //   icon: Icons.close_rounded,
              //   iconSize: iconSize,
              //   contSize: contSize,
              // ),

              Expanded(
                child: InkWell(
                  onTap: () {
                    if (func != null) {
                      func!();
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconContainer(
                          icon: NetworkIcons.electric,
                          iconSize: iconSize,
                          contSize: contSize,
                          contColor: AppColors.black1A,
                          func: () {
                            if (func != null) {
                              func!();
                            }
                            // Navigator.of(context).push(
                            //     MaterialPageRoute<void>(
                            //         builder: (context) =>
                            //         const TimerPage()));
                          },
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                              left: mediaWitdh * 0.0453, //17
                              right: 8),
                          child: Text('Встретиться',
                              style: TextStyle(
                                  color: AppColors.textBlack,
                                  fontSize: ResponsiveUtils.getResSize(14),
                                  fontWeight: FontWeight.w500)),
                        ),

                        //иконка >>
                        Padding(
                          padding:
                              EdgeInsets.only(right: mediaWitdh * 0.056), //21
                          child: SizedBox(
                            width: 25,
                            height: 25,
                            child: Stack(
                              children: const [
                                Positioned(
                                    left: 0,
                                    child: Icon(
                                      Icons.keyboard_arrow_right,
                                      size: 25,
                                      color: AppColors.grey,
                                    )),
                                Positioned(
                                    left: 10,
                                    child: Icon(
                                      Icons.keyboard_arrow_right,
                                      size: 25,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: IconContainer(
                  icon: NetworkIcons.star,
                  iconSize: iconSize,
                  contSize: contSize,
                ),
              ),

            ],
          );
  }
}
