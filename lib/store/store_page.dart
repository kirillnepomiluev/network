import 'package:flutter/material.dart';
import 'package:network_app/store/view_category_avatar_page.dart';
import 'package:network_app/store/view_category_hats.dart';

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

  final _avatarScrollContr = ScrollController();
  final _hatScrollContr = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      backgroundColor: Colors.grey.shade400,
      body:
      Padding(
        padding: const EdgeInsets.only(top: 20),
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
                      Text(_active==1 ? 'Аватары' : 'Боксы аватаров', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),

                      IconButton(onPressed: (){

                        Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const ViewCategoryAvatarPage()));

                        // const double moveWidth = 400;
                        // _avatarScrollContr.animateTo(
                        //     moveWidth,
                        //     curve: Curves.easeOut,
                        //     duration: const Duration(seconds: 1)
                        // );
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
                      avatarContainer(context: context, isBoxes: _active==2,),
                      avatarContainer(context: context, isBoxes: _active==2,),
                      avatarContainer(context: context, isBoxes: _active==2,),
                      avatarContainer(context: context, isBoxes: _active==2,),
                      avatarContainer(context: context, isBoxes: _active==2,),
                      avatarContainer(context: context, isBoxes: _active==2,),
                    ],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_active==1 ? 'Головные уборы' : 'Боксы одежды', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),

                      IconButton(onPressed: (){

                        Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const ViewCategoryHatsPage()));

                        // const double moveWidth = 320;
                        // _hatScrollContr.animateTo(
                        //     moveWidth,
                        //     curve: Curves.easeOut,
                        //     duration: const Duration(seconds: 1)
                        // );
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
                      hatContainer(context: context,),
                      hatContainer(context: context,),
                      hatContainer(context: context,),
                      hatContainer(context: context,),
                      hatContainer(context: context,),
                      hatContainer(context: context,),
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

}

