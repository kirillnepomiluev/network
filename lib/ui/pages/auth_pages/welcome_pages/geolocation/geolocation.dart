import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/home/home_page.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/general_widgets.dart';
import 'package:network_app/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TurnOnLocationPage extends StatefulWidget {
  const TurnOnLocationPage({Key? key}) : super(key: key);

  @override
  State<TurnOnLocationPage> createState() => _TurnOnLocationPageState();
}

class _TurnOnLocationPageState extends State<TurnOnLocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BackButtonCustom(),
                    Container(
                        decoration: BoxDecoration(
                          color: ConstColor.white10,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 18),
                        child: Row(
                          children: const [
                            Text('Пропустить'),
                            Icon(
                              Icons.close_rounded,
                              color: ConstColor.salad100,
                            )
                          ],
                        )),
                  ],
                ),
                const EnterInfoContainer(
                  padTop: 32,
                  text1: 'Включите ',
                  text2: 'геолокацию',
                  description: '''Знакомьтесь  и встречайтесь 
с людьми рядом с вами

Ваше местоположение будет 
использовано для показа потенциальных партнеров для встреч''',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: buttonStyleCustom(
                            color: Colors.white, padH: 0, padV: 22, radius: 20),
                        onPressed: () {

                          Route route = MaterialPageRoute<void>(builder: (context) => const HomePage(initIndex: 0));
                          Navigator.pushAndRemoveUntil<void>(context, route, (route) => false);

                        },
                        child: Text(
                          'Включить геолокацию',
                          style: TextStyle(
                              fontSize: 18.5.sp, //18
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
