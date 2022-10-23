import 'package:flutter/material.dart';
import 'package:network_app/components/general_widgets.dart';
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
      backgroundColor: Colors.grey.shade500,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [viewAvatarContainer(), _statColumn()],
          ),
        ),
      ),
    );
  }

  Widget viewAvatarContainer() {
    final mediaWidth = MediaQuery.of(context).size.width;

    final imageWidth = 0.624 * mediaWidth;

    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Container(
        width: mediaWidth,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(50)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackButtonCustom(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade500,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                      child: Text(
                    'Деловая встреча',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.5.sp, //12
                        fontWeight: FontWeight.w400),
                  )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 37),
              child: Container(
                width: imageWidth, //234
                height: 0.9359 * imageWidth, //219
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 43),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Джоли, 28',
                      style: TextStyle(
                          fontSize: 24.sp, //32
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
                  Padding(
                    padding: const EdgeInsets.only(left: 19),
                    child: Icon(
                      Icons.verified, color: Colors.black,
                      size: 22.sp, //26
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Уровень "Базовый"',
                style: TextStyle(
                    fontSize: 16.5.sp, //14
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                '+150 баллов',
                style: TextStyle(
                    fontSize: 16.5.sp, //14
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('250 м в направлении',
                      style: TextStyle(
                          fontSize: 16.5.sp, //14
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                      width: 0.048 * mediaWidth, //18
                      height: 0.048 * mediaWidth,
                      child: Icon(
                        Icons.call_received,
                        size: 15.sp, //11
                        color: Colors.white,
                      ), //Icons.turn
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 13, bottom: 19),
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 18),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    'Открыть карту',
                    style: TextStyle(
                        fontSize: 16.5.sp, //14
                        fontWeight: FontWeight.w400),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 31,
              ),
              child: meetRow(context),
            )
          ],
        ),
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
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 0),
              child: Center(
                child: Container(
                  // alignment: Alignment.center,
                  width: 35,
                  height: 4,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            titleStatText('Статус'),
            textField('Sed aenean est eget sit eget at tellus sed.',
                isEnable: false),
            titleStatText('Базовые данные'),
            textField('Женщина, 37 лет, свободна, цель встречи: деловая.',
                isEnable: false),
            titleStatText('Интересы'),
            Wrap(
              spacing: 8,
              runSpacing: 10,
              direction: Axis.horizontal,
              children: [
                hobbitsContainer('Большой теннис'),
                hobbitsContainer('Маркетинг'),
                hobbitsContainer('Управление'),
                hobbitsContainer('Маркетинг'),
                hobbitsContainer('Большой теннис'),
              ],
            ),
            titleStatText('Обо мне'),
            textField(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultrices amet tellus.'),
            titleStatText('Сфера деятельности'),
            textField(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eget varius a id in amet.'),
          ],
        ),
      );
}
