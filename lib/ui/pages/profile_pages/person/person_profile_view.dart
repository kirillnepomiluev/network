import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/navigation/app_router.gr.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/common/hobbits_container.dart';
import 'package:network_app/ui/widgets/common/meet_exchange_row.dart';
import 'package:network_app/ui/widgets/common/rhomus_text.dart';
import 'package:network_app/ui/widgets/common/general_widgets.dart';
import 'package:network_app/ui/widgets/texts/title_stat_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PersonProfileView extends StatefulWidget {
  const PersonProfileView({Key? key}) : super(key: key);

  @override
  State<PersonProfileView> createState() => _PersonProfileViewState();
}

class _PersonProfileViewState extends State<PersonProfileView> {
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


    return SizedBox(
      // color: Colors.red,
      height: 662,
      width: mediaWidth,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [

          Positioned(
            top: 50,
            child: SizedBox(
              width: mediaWidth,
              // height: 630,
              child:

              Assets.images.avatars.avatar3D.image(
                  alignment: Alignment.topCenter,
              )

              // Image.asset(
              //   'assets/images/avatars/avatar_3D.png',
              //   // fit: BoxFit.fitWidth,
              //   alignment: Alignment.topCenter,
              // ),
            ),
          ),

          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.2, 0.8, 1],
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.88),
                      Colors.black.withOpacity(0.88),
                      // Colors.black
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

                    AppBackButton(contColor: AppColors.black1A.withOpacity(0.65)),

                    Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                      decoration: BoxDecoration(
                        color: AppColors.salad100,
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
                              color: AppColors.salad100,
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

                          const RhombusText()

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
                              color: AppColors.white10,
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
                                      color: AppColors.salad100,
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
                        bottom: 32,
                      ),
                      child: MeetExchangeRow(onTap: (){
                        context.router.push(const PersonProfileViewRoute());
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
            const EdgeInsets.only(left: 15, right: 15, bottom: 50, top: 27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [

            Padding(
              padding: const EdgeInsets.only(bottom: 5),
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
                  onPressed: (){
                    context.router.push(HomeStoreViewRoute(isPartnerCupboard: true));

                  },
                  child: const Text("Перейти в список вещей",
                    style: TextStyle(
                        color: AppColors.textBlack
                    ),
                  )
              ),
            ),


            const TitleStatText('Статус'),
            textField('ищу партнеров для бизнеса', isEnable: false),

            const TitleStatText('Базовые данные'),
            textField('Женщина, 37 лет, свободна, цель встречи: деловая.', isEnable: false),
            const TitleStatText('Интересы'),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Wrap(
                spacing: 8,
                runSpacing: 10,
                direction: Axis.horizontal,
                children: const [
                  HobbitsContainer('Большой теннис', hasEdit: false),
                  HobbitsContainer('Бассейн', hasEdit: false),
                  HobbitsContainer('Управление', hasEdit: false),
                  HobbitsContainer('Маркетинг', hasEdit: false),
                ],
              ),
            ),

            const TitleStatText('Обо мне'),
            textField('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultrices amet tellus.'),
            const TitleStatText('Сфера деятельности'),
            textField('Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eget varius a id in amet.'),
          ],
        ),
      );
}
