import 'package:flutter/material.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {

  int _active = 1;

  Widget miniContainer({required int position, required String text}) => Padding(
    padding: const EdgeInsets.only(right: 10),
    child: InkWell(
      onTap: ((){
        // if(position==1){
        //   openBottomSheetProfile();
        // }

        setState(() {
          _active=position;
        });
      }),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: _active==position? 2 : 0)
        ),
        height: 40,
        // width: 100,
        child: Row(children: [

          Container(
            width: 40,
            height: double.infinity,
            decoration: BoxDecoration(
              color: _active==position? Colors.grey.shade800 : Colors.grey.shade500,
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

          Icon(_active==position? Icons.arrow_drop_down: Icons.arrow_right_outlined)

        ],),
      ),
    ),
  );

  ScrollController _avatarScrollContr = ScrollController();
  ScrollController _hatScrollContr = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body:
      SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text('Магазин', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
                ),

                //Выбор интерфейса
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child:

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // shrinkWrap: true,
                    // scrollDirection: Axis.horizontal,
                    children: [
                      miniContainer(position: 1, text: 'Магазин'),
                      miniContainer(position: 2, text: 'Лотерея'),
                      // miniContainer(position: 3, text: 'Встречи'),
                    ],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Аватары', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),

                      IconButton(onPressed: (){
                        const double moveWidth = 390;
                        _avatarScrollContr.animateTo(
                            moveWidth,
                            curve: Curves.easeOut,
                            duration: const Duration(seconds: 1)
                        );
                      }, icon: const Icon(Icons.arrow_forward))
                    ],
                  ),
                ),

                SingleChildScrollView(
                  controller: _avatarScrollContr,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      avatarContainer(),
                      avatarContainer(),
                      avatarContainer(),
                      avatarContainer(),
                      avatarContainer(),
                      avatarContainer(),
                    ],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Головные уборы', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),

                      IconButton(onPressed: (){
                        const double moveWidth = 390;
                        _hatScrollContr.animateTo(
                            moveWidth,
                            curve: Curves.easeOut,
                            duration: const Duration(seconds: 1)
                        );
                      }, icon: const Icon(Icons.arrow_forward))
                    ],
                  ),
                ),

                SingleChildScrollView(
                  controller: _hatScrollContr,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      avatarContainer(contWidth: 150),
                      avatarContainer(contWidth: 150),
                      avatarContainer(contWidth: 150),
                      avatarContainer(contWidth: 150),
                      avatarContainer(contWidth: 150),
                      avatarContainer(contWidth: 150),
                    ],
                  ),
                ),

                // SizedBox(
                //   height: 310,
                //   child: ListView.builder(
                //     // padding: const EdgeInsets.only(left: 5, top: 25),
                //       scrollDirection: Axis.horizontal,
                //       shrinkWrap: true,
                //       // controller: myController,
                //       // physics: const BouncingScrollPhysics(),
                //       itemCount: 6,
                //       itemBuilder: (BuildContext context, int index) {
                //         return
                //           avatarContainer();
                //       }),
                // ),


              ],
            ),
          ),
        ),
      ),


    );
  }

  Widget avatarContainer({double contWidth = 185}) => Padding(
    padding: const EdgeInsets.only(right: 10),
    child: InkWell(
      onTap: ((){
      }),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
        ),
        // height: 310,
        width: contWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          const Padding(
            padding: EdgeInsets.only(bottom: 20,),
            child: Text('Категория', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
          ),

            Container(
              height: contWidth-35,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10)
              ),
            ),

          const Padding(
            padding: EdgeInsets.only(top: 25),
            child: Text('Имя аватара', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),),
          ),

          const Padding(
            padding: EdgeInsets.only(top: 2),
            child: Text('#0863246', style: TextStyle(fontSize: 11),),
          ),

          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text('1.6 SOL', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.spaceBetween,
              children: const [
                Text('Уровень "Базовый"', style: TextStyle(fontSize: 10),),

                Text('Баллы +150', style: TextStyle(fontSize: 10),),
              ],
            ),
          ),

        ],),
      ),
    ),
  );



}
