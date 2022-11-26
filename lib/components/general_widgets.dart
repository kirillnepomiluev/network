import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/auth/login_page.dart';
import 'package:network_app/auth/phone_auth_page.dart';
import 'package:network_app/auth/recovery_page.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/meetings/notifications_page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:ui' as ui;

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
              color: ConstColor.salad100,
              fontWeight: fontWeight),
        ),
        Padding(
          padding: EdgeInsets.only(left: padLeft),
          child: Icon(
            Network.rhombus,
            color: ConstColor.salad100,
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
            child: Icon(
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
              ? ConstColor.salad100
              : ConstColor.white10,
          borderRadius: BorderRadius.circular(12),
        ),
        child:
        Text(
          widget.title,
          style: TextStyle(
              color:
              isSelected
                  ? Colors.black
                  : ConstColor.textWhite,
              fontSize: 15.5.sp, //12
              fontWeight: FontWeight.w400
          ),
        ),
      ),
    );
  }
}


class EnterInfoContainer extends StatelessWidget {
  final double padTop;
  final String text1;
  final String text2;
  final String? description;
  final int? maxLines;
  const EnterInfoContainer(
      {Key? key,
        required this.text1,
        required this.text2,
        this.maxLines,
        this.description,
        required this.padTop
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: padTop),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ConstColor.white10,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildRichTextTwo(text1: text1, text2: text2, fontSize: 20.sp, fontWeight1: FontWeight.w500, fontWeight2: FontWeight.w500,),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                description ?? Constants.strLoremIpsum,
                maxLines: maxLines,
                style: TextStyle(
                    fontSize: getResSize(14),
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildRichText({
  //   String text1 = '',
  //   String text2 = '',
  // }) =>
  //     RichText(
  //       maxLines: 2,
  //       overflow: TextOverflow.ellipsis,
  //       text: TextSpan(
  //         style: TextStyle(
  //           color: Colors.white,
  //           fontSize: 20.sp, //24
  //           fontWeight: FontWeight.w500,
  //         ),
  //         children: <TextSpan>[
  //           TextSpan(
  //             text: text1,
  //           ),
  //           TextSpan(
  //               text: text2,
  //               style: const TextStyle(
  //                 color: ConstColor.salad100,
  //               )),
  //         ],
  //       ),
  //       // minFontSize: 14,
  //     );
}


class EnterRowContainer extends StatelessWidget {
  final Function? func;
  final IconData? icon;
  final String iconName;
  final String title;
  EnterRowContainer({Key? key, this.icon, this.iconName='', required this.title, this.func}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (() {
        if(func==null){
          Navigator.of(context).push(MaterialPageRoute<void>(
              builder: (context) => const PhoneAuthPage()));
        }
        else{
          func!();
        }
      }),
      child: Container(
          decoration: BoxDecoration(
            color: ConstColor.white10,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(
                    top: 4,
                    bottom: 4,
                    left: 4,
                    right: 24, //24
                  ),
                  child: Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13)),
                    child: icon != null
                        ? Icon(icon,
                        color: Colors.black, size: 21)
                        : Padding(
                      padding: const EdgeInsets.all(17),
                      child: Image.asset(
                        'assets/icons/$iconName.png',
                        width: 21.sp, //24
                        height: 21.sp,
                      ),
                    ),
                  )),
              Text(
                title,
                style: TextStyle(
                    fontSize: getResSize(16), //16
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              )
            ],
          )),
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
              Image.asset('assets/icons/handshake.png',
              width: 118,
              height: 118,
              ),
              _text(isColumn: true),
              // _social(opacity: opacity),
            ],
          )
        : Row(
            mainAxisAlignment:
                isRow ? MainAxisAlignment.start : MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/icons/handshake.png',
                width: 46,
                height: 46,
              ),
              _text(),
            ],
          );
  }

  Widget _circle() => Image.asset('assets/icons/handshake.png');

  Widget _text({bool isColumn = false}) => Padding(
        padding:
            EdgeInsets.only(left: isColumn ? 0 : 15.0, top: isColumn ? 10 : 0),
        child: Text(
          'network',
          style: TextStyle(
              fontSize: 23.5.sp, //34
              color: Colors.white,
              fontWeight: FontWeight.w600),
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
      // backgroundColor: ConstColor.blackBack,
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

Widget troubleEnter(BuildContext context) {
  return InkWell(
    onTap: (() {
      Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (context) => const RecoveryPage()));
    }),
    child: SizedBox(
      height: 23.sp, //30
      width: 55.5.sp, //160
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Positioned(
            right: 0,
            bottom: 10,
            child: Text(
              'Проблемы со входом?',
              style: TextStyle(
                  color: ConstColor.textGray,
                  fontSize: 16.5.sp, //14
                  fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            // padding: EdgeInsets.only(top: 8),
            child: Text(
              '_____________________________',
              style: TextStyle(
                  color: ConstColor.textGray,
                  fontSize: 15.5.sp, //12
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    ),
  );
}

class IconContainer extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color? contColor;
  final double? iconSize;
  final double? contSize;
  final Function? func;
  IconContainer(
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
        color: contColor ?? ConstColor.white10,
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
  final Function? func;
  final Color? contColor;
  BackButtonCustom({Key? key, this.func, this.contColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: IconContainer(
          func: func ?? Navigator.of(context).pop,
          icon: Network.arrow_back,
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
                          color: ConstColor.textGray,
                          fontSize: getResSize(14),
                        ),
                      ),
                      Text(
                        text2,
                        style: TextStyle(
                          color: ConstColor.textGray,
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
                        fontWeight1: FontWeight.w400,
                        fontWeight2: FontWeight.w700,
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
                  progressColor: ConstColor.salad100.withOpacity(0.2),
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
              : Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Icon(
                    Icons.close_rounded,
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
            color: Colors.white),
        initialValue: hintText,
        autofocus: false,
        decoration: InputDecoration(
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: ConstColor.salad100),
              borderRadius: BorderRadius.circular(20)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: ConstColor.salad100),
              borderRadius: BorderRadius.circular(20)),
          disabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: ConstColor.salad100),
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
  final _height = mediaHeight * 0.9;

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
                        height: _height - mediaWidth * 0.07733333333333334,
                        blur: 20,
                        color: Colors.transparent,
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 15, top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Энергия',
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: ConstColor.salad100),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                Constants.strLoremIpsum +
                                    Constants.strLoremIpsum +
                                    Constants.strLoremIpsum
                                // + '\n' +
                                // Constants.strLoremIpsum+Constants.strLoremIpsum+Constants.strLoremIpsum
                                // + '\n' +
                                // Constants.strLoremIpsum+Constants.strLoremIpsum+Constants.strLoremIpsum
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

class BuildRichTextTwo extends StatelessWidget {
  final String text1;
  final String text2;
  final double fontSize;
  final FontWeight fontWeight1;
  final FontWeight fontWeight2;
  final Color color1;
  final Color color2;
  final TextAlign textAlign;

  BuildRichTextTwo({
    Key? key,
    this.text1 = '',
    this.text2 = '',
    this.fontSize = 20,
    // this.fontWeight1 = FontWeight.w400,
    // this.fontWeight2 = FontWeight.w700,

    this.fontWeight1 = FontWeight.w600,
    this.fontWeight2 = FontWeight.w600,
    this.color1 = ConstColor.textWhite,
    this.color2 = ConstColor.salad100,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: TextStyle(
          color: color1,
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
                color: color2,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // titleStatText('Уровень Базовый'),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BuildRichTextTwo(
              text1: 'Уровень ',
              text2: 'Базовый',
            ),

            Container(
              decoration: BoxDecoration(
                  color: ConstColor.salad100,
                  borderRadius: BorderRadius.circular(7)),
              width: 24,
              height: 22,
              child: Icon(
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
            icon: Network.rhombus
        ),

        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: BuildRichTextTwo(
            text1: 'До следущего уровня осталось\nнабрать ',
            text2: '1500 токенов',
            fontSize: 14,
            fontWeight1: FontWeight.w500,
            fontWeight2: FontWeight.w500,
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 25, bottom: 7),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 20
              ),
              backgroundColor: ConstColor.salad100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13)
              )
            ),
              onPressed: (){},
              child: Text("Докупить токены",
              style: TextStyle(
                color: ConstColor.textBlack
              ),
              )
          ),
        ),


        progressParametr(
            context: context,
            text1: '5 встреч',
            text2: 'Еще 25 встреч',
            progress: 0.25,
            isMeetingRow: true,
            icon: Network.people),

        titleStatText('Статистика'),
        progressParametr(
            context: context,
            text1: 'Энергии на встречи  ',
            text2: '3/5',
            icon: Network.electric),

        progressParametr(
            context: context,
            text1: 'Скорость восстановления  ',
            text2: 'x1.5',
            icon: Network.speedometer),
        progressParametr(
            context: context,
            text1: 'Баллы за встречи  ',
            text2: '150',
            icon: Network.rhombus),
        progressParametr(
          context: context,
          text1: 'Количество сообщений в день  ',
          text2: '200',
          icon: Network.email_outlined,
          // Icons.email_outlined
        ),
        progressParametr(
            context: context,
            text1: 'Количество лайков в день  ',
            text2: '50',
            icon: Network.heart),
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
        activeColor: ConstColor.salad100,
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

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = color ?? ConstColor.white10;
    canvas.drawPath(path_0, paint_0_fill);

    Paint paint_1_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01866667;
    paint_1_stroke.color = Color(0xffE2FF2D).withOpacity(1.0);
    paint_1_stroke.strokeCap = StrokeCap.round;
    canvas.drawLine(
        Offset(size.width * 0.4560000, size.height * 0.1206897),
        Offset(size.width * 0.5440320, size.height * 0.1206897),
        paint_1_stroke);
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

class ChangeTabContainer extends StatelessWidget {
  int activeTab = 1;
  final int activeTabInit;
  final int position;
  final String text;
  final Function func;

  ChangeTabContainer({
    Key? key,
    required this.func,
    required this.activeTabInit,
    required this.position,
    required this.text,
  }) : super(key: key) {
    activeTab = activeTabInit;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () {
          func();
        },
        child: BlurryContainer(
          blur: 20,
          color: ConstColor.white10,
          borderRadius: BorderRadius.circular(20),
          padding: EdgeInsets.symmetric(
            vertical: 18.5.sp, //19
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  text,
                  style: TextStyle(
                      color: activeTab == position
                          ? ConstColor.salad100
                          : Colors.white,
                      fontSize: 16.5.sp, //14
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 16),
                child: activeTab == position
                    ? Icon(
                        Icons.keyboard_arrow_down,
                        color: ConstColor.salad100,
                        size: 19.sp, //20
                      )
                    : Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.white,
                        size: 19.sp, //20
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MeetRow extends StatelessWidget {
  final Function? func;
  final bool isExchange;
  MeetRow({Key? key, this.func, this.isExchange = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaWitdh = MediaQuery.of(context).size.width;
    final double contSize = mediaWitdh * 0.128; //48
    final double iconSize = 19.sp; //25
    final double iconElSize = 18.5.sp; //20

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
                    icon: Network.arrow_right_long,
                    iconSize: iconSize,
                    contSize: contSize,
                    contColor: ConstColor.black1A,
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
                            color: ConstColor.textBlack,
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
                                color: ConstColor.grey,
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
              IconContainer(
                icon: Icons.close_rounded,
                iconSize: iconSize,
                contSize: contSize,
              ),

              InkWell(
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
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconContainer(
                        icon: Network.electric,
                        iconSize: iconSize,
                        contSize: contSize,
                        contColor: ConstColor.black1A,
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

                      // Container(
                      //     decoration: BoxDecoration(
                      //         color: Colors.black,
                      //         borderRadius: BorderRadius.circular(15)
                      //       // shape: BoxShape.circle
                      //     ),
                      //     width: contSize,
                      //     height: contSize,
                      //     child: IconButton(
                      //       onPressed: () {},
                      //       icon: const Icon(
                      //         Network.electric,
                      //         color: Colors.white,
                      //       ),
                      //       iconSize: iconElSize,
                      //     )),

                      Padding(
                        padding: EdgeInsets.only(
                            left: mediaWitdh * 0.0453, //17
                            right: 8),
                        child: Text('Встретиться',
                            style: TextStyle(
                                color: ConstColor.textBlack,
                                fontSize: 15.sp, //12
                                fontWeight: FontWeight.w500)),
                      ),

                      //иконка >>
                      Padding(
                        padding:
                            EdgeInsets.only(right: mediaWitdh * 0.056), //21
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
                                    color: ConstColor.grey,
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
              ),

              IconContainer(
                icon: Network.star,
                iconSize: iconSize,
                contSize: contSize,
              ),

              // Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(15),
              //       color: Colors.black,
              //       // shape: BoxShape.circle
              //     ),
              //     width: contSize,
              //     height: contSize,
              //     child: IconButton(
              //       onPressed: () {},
              //       icon: const Icon(
              //         // Icons.star_border_outlined,
              //         Network.star,
              //         color: Colors.white,
              //       ),
              //       iconSize: iconSize,
              //     )),
            ],
          );
  }
}
