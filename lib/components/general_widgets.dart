import 'package:flutter/material.dart';
import 'package:network_app/auth/login_page.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/meetings/notifications_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
              color: ConstColor.white05,
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
        color: Colors.white.withOpacity(0.05),
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
          iconSize: 15.sp,
        )
        );
  }
}
