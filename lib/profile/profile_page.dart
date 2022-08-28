import 'package:flutter/material.dart';
import 'package:network_app/profile/home_page.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  int _activeProfileTab = 1;

  Widget miniContainer({required int position, required String text,}) => Padding(
    padding: const EdgeInsets.only(right: 10),
    child: InkWell(
      onTap: ((){

          setState(() {
              _activeProfileTab=position;
          });

      }),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: _activeProfileTab==position? 2 : 0)
        ),
        height: 40,
        // width: 100,
        child: Row(children: [

          Container(
            width: 40,
            height: double.infinity,
            decoration: BoxDecoration(
              color: _activeProfileTab==position? Colors.grey.shade800 : Colors.grey.shade500,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: Container(
                margin: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                )
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(text, style: const TextStyle(fontSize: 12),),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(_activeProfileTab==position? Icons.arrow_drop_down: Icons.arrow_right_outlined),
          )

        ],),
      ),
    ),
  );




  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      extendBody: true,
        backgroundColor: Colors.grey.shade400,
        body: Padding(
          padding: const EdgeInsets.only(top: 25),
          child:
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  _activeProfileTab!=2? Container():
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Профиль', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
                  ),

                  // const Text('Профиль', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),

                  //Верхняя часть профиля
                  _activeProfileTab!=1? Container():
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              padding: const EdgeInsets.all(1),
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(
                                // color: Colors.black87,
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Тимофей, 37', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),

                              Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child:
                                Container(
                                    padding: const EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white70
                                    ),
                                    child:
                                    const Text('я люблю веселиться 😁', style: TextStyle(fontSize: 11),)),
                              ),
                            ],)
                        ],),

                    ],
                  ),

                  //Выбор интерфейса
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child:

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   // shrinkWrap: true,
                    //   // scrollDirection: Axis.horizontal,
                    //   children: [
                    //     miniContainer(position: 1, text: 'Профиль'),
                    //     miniContainer(position: 2, text: 'Шкаф'),
                    //     // miniContainer(position: 3, text: 'Встречи'),
                    //   ],
                    // ),

                    SingleChildScrollView(
                      // physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // shrinkWrap: true,
                        // scrollDirection: Axis.horizontal,
                        children: [

                          miniContainer(position: 1, text: 'Профиль'),
                          miniContainer(position: 2, text: 'Шкаф'),
                          miniContainer(position: 3, text: 'Встречи'),
                        ],
                      ),
                    ),

                  ),

                  //Нижняя часть профиля
                  _activeProfileTab!=1? Container():
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 2),
                        child: Text('Имя аватара', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                      ),

                      const Padding(
                        padding: EdgeInsets.only(left: 8, top: 8),
                        child: Text('Уровень "Базовый"', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),),
                      ),

                      Padding(
                          padding: const EdgeInsets.only(left: 8, top: 35),
                          child:
                          Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade700,
                                  shape: BoxShape.circle),
                              child: const Icon(Icons.check, size: 15, color: Colors.white,))
                      ),

                      const Padding(
                        padding: EdgeInsets.only(left: 8, top: 10),
                        child: Text('Готов к встрече', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            statContainer(title: '9.4k', subtitle: 'баллов'),
                            statContainer(title: '23', subtitle: 'встречи'),
                            statContainer(title: '4.5', subtitle: 'рейтинг'),
                          ],),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            statContainer(title: '9.4k', subtitle: 'баллов'),
                            statContainer(title: '23', subtitle: 'встречи'),
                            statContainer(title: '4.5', subtitle: 'рейтинг'),
                          ],),
                      ),

                    ],
                  ),

                  //////////////////////

                  _activeProfileTab!=2? Container():
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          const Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child:  Text('Шкаф пустой', textAlign: TextAlign.center, style: TextStyle(
                                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
                          ),

                          const Text('Посетите магазин, чтобы купить новые\nпредметы для своего персонажа', textAlign: TextAlign.center, style: TextStyle(
                              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: InkWell(
                              onTap: ((){
                                // Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const RecoveryEmailPage()));
                              }),
                              child: Container(
                                // width: MediaQuery.of(context).size.width*0.8,
                                padding: const EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child:
                                const Text('Посетить магазин', style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.w500), textAlign: TextAlign.center,),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),

          ),
        bottomNavigationBar: InkWell(
          onTap: ((){
            openBottomSheetProfile();
          }),
          child: Stack(
            alignment: Alignment.center,
            children: [

            Positioned(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(35))
                    ),
                  ),
                ),

              Positioned(
                bottom: 100,
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(shape: BoxShape.circle, color:  Colors.grey.shade400),
                ),
              ),

              Positioned(
                top: 0,
                child: Container(
                  height: 4,
                  width: 40,
                  decoration: const BoxDecoration(
                      // shape: BoxShape.circle,
                      color:  Colors.white
                  ),
                ),
              ),

            ],),
        )
    );
  }



  void openBottomSheetProfile(){

    showModalBottomSheet<void>(
      // elevation: 5,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(25)
            )
        ),
        context: context,
        builder: (BuildContext context) =>
            GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(30)
                    )
                ),
                height: MediaQuery.of(context).size.height * 0.9,
                // color: Colors.grey.shade100,
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
                child:
                SingleChildScrollView(
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
                                borderRadius: BorderRadius.circular(15)
                            ),),
                        ),
                      ),

                      titleStatText('Уровень Базовый'),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          progressParametr(context : context,
                              text1: '5 встреч',
                              text2: 'Еще 25 встреч',
                              progress: 0.25,
                              isMeetingRow: true
                          ),

                          titleStatText('Статистика'),

                          progressParametr(context : context,
                              text1: 'Энергии на встречи',
                              text2: '3/5'
                          ),

                          progressParametr(context : context,
                              text1: 'Скорость восстановления',
                              text2: 'x1.5'
                          ),

                          progressParametr(context : context,
                              text1: 'Баллы за встречи',
                              text2: '150'
                          ),

                          progressParametr(context : context,
                              text1: 'Количество сообщений в день',
                              text2: '200'
                          ),

                          progressParametr(context : context,
                              text1: 'Количество лайков в день',
                              text2: '50'
                          ),
                        ],
                      ),

                      titleStatText('Статус'),
                      textField('Sed aenean est eget sit eget at tellus sed.'),

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

                        ],),

                      titleStatText('Обо мне'),
                      textField('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultrices amet tellus.'),

                      titleStatText('Сфера деятельности'),
                      textField('Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eget varius a id in amet.'),

                      titleStatText('Пол'),
                      const RadioList(listOptions: ['Мужчина', 'Женщина'],),

                      titleStatText('Возраст'),
                      Row(children: [

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: const Text('37 лет', style: TextStyle(fontSize: 14),),
                        ),

                        IconButton(onPressed: (){
                          setState(() {
                          });
                        }, icon: Icon(Icons.check_circle, color: Colors.grey.shade600,),),

                        const Text('Скрыть возраст', style: TextStyle(fontSize: 14),),


                      ],),

                      titleStatText('Семейное положение'),
                      const RadioList(listOptions: ['Женат', 'Холост', 'Свободен', 'В поиске'],),

                      titleStatText('Цель встречи'),
                      const RadioList(listOptions: ['Деловая', 'Общение', 'Свидание'],),

                      titleStatText('Готов ли знакомиться с противоположным полом'),
                      const RadioList(listOptions: ['Да', 'Нет',],),

                      titleStatText('Какие критерии?'),
                      const RadioList(listOptions: ['Да', 'Нет',],),


                    ],),
                ),),
            )
    );
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
    return
      Transform.translate(
        offset: const Offset(-10, 0),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
            // padding: const EdgeInsets.only(left: 5, top: 25),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: widget.listOptions.length,
            itemBuilder: (BuildContext context, int index) {
              return
                  RadioListTile(
                      visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: -4),
                    activeColor: Colors.grey.shade600,
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                      title: Transform.translate(
                          offset: const Offset(-10, 0),
                          child: Text(widget.listOptions[index])),

                      value: widget.listOptions[index],
                      groupValue: groupValue,
                      onChanged: (value){
                        setState(() {
                          groupValue = value;
                        });
                      });

            }),
      );
  }
}



