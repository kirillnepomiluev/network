import 'package:flutter/material.dart';
import 'package:network_app/components/general_widgets.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/home_page.dart';
import 'package:network_app/meetings/meetings_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ViewPartnerProfilePage extends StatefulWidget {
  const ViewPartnerProfilePage({Key? key}) : super(key: key);

  @override
  State<ViewPartnerProfilePage> createState() => _ViewPartnerProfilePageState();
}

class _ViewPartnerProfilePageState extends State<ViewPartnerProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ConstColor.blackBack,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              viewAvatarContainer(),
              _statColumn()
            ],
          ),
        ),
      ),
    );
  }

  Widget viewAvatarContainer() {
    final mediaWidth = MediaQuery.of(context).size.width;

    final imageWidth = 0.624 * mediaWidth;

    return Container(
      // color: Colors.red,
      height: 662,
      width: mediaWidth,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [

          Container(
            width: mediaWidth,
            // height: 630,
            child: Image.asset(
              'assets/images/avatars/avatar_3.png',
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),

          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.3, 1],
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.88)
                    ]
                )
            ),
          ),

          Container(
            // width: mediaWidth,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(50)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    BackButtonCustom(contColor: ConstColor.black1A.withOpacity(0.65)),

                    Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                      decoration: BoxDecoration(
                        color: ConstColor.salad100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                          child: Text(
                        'Деловая встреча',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.5.sp, //12
                            fontWeight: FontWeight.w400),
                      )),
                    ),
                  ],
                ),

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 43),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Джоли, 28',
                              style: TextStyle(
                                  fontSize: 24.sp, //32
                                  // color: ConstColor.textWhite,
                                  fontWeight: FontWeight.w600)),

                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Icon(
                              Icons.verified,
                              color: ConstColor.salad100,
                              size: 22.sp, //26
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 11),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Text(
                            'Уровень "Базовый"',
                            style: TextStyle(
                                fontSize: 16.5.sp, //14
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),

                          rhombusText()

                        ],
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(top: 26),
                      child:

                      Text('250 м в направлении',
                          style: TextStyle(
                              fontSize: 16.5.sp, //14
                              // color: ConstColor.textWhite,
                              fontWeight: FontWeight.w400
                          )),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10,),
                      child: Container(
                          padding:
                              const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                          decoration: BoxDecoration(
                              color: ConstColor.white10,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [

                              Text(
                                'Открыть карту',
                                style: TextStyle(
                                    // color: ConstColor.textWhite,
                                    fontSize: 16.5.sp, //14
                                    fontWeight: FontWeight.w400
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: ConstColor.salad100,
                                      shape: BoxShape.circle),
                                  width: 0.048 * mediaWidth, //18
                                  height: 0.048 * mediaWidth,
                                  child: Icon(
                                    Icons.call_received,
                                    size: 15.sp, //11
                                    color: Colors.black,
                                  ), //Icons.turn
                                ),
                              ),
                            ],
                          )
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                        bottom: 20,
                      ),
                      child: MeetRow(func: (){
                        Navigator.of(context).push(MaterialPageRoute<void>(
                            builder: (context) => const ViewPartnerProfilePage()));
                      }),
                    ),
                  ],
                )

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _statColumn() => Container(
        padding:
            const EdgeInsets.only(left: 15, right: 15, bottom: 50, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [

            titleStatText('Статус'),
            textField('ищу партнеров для бизнеса', isEnable: false),

            titleStatText('Базовые данные'),
            textField('Женщина, 37 лет, свободна, цель встречи: деловая.', isEnable: false),
            titleStatText('Интересы'),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Wrap(
                spacing: 8,
                runSpacing: 10,
                direction: Axis.horizontal,
                children: [
                  hobbitsContainer('Большой теннис', hasEdit: false),
                  hobbitsContainer('Бассейн', hasEdit: false),
                  hobbitsContainer('Управление', hasEdit: false),
                  hobbitsContainer('Маркетинг', hasEdit: false),
                ],
              ),
            ),

            titleStatText('Обо мне'),
            textField('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultrices amet tellus.'),
            titleStatText('Сфера деятельности'),
            textField('Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eget varius a id in amet.'),
          ],
        ),
      );
}
