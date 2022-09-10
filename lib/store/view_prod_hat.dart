import 'package:flutter/material.dart';
import 'package:network_app/home_page.dart';


class ViewProdHatPage extends StatefulWidget {
  const ViewProdHatPage({Key? key}) : super(key: key);

  @override
  State<ViewProdHatPage> createState() => _ViewProdHatPageState();
}

class _ViewProdHatPageState extends State<ViewProdHatPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   shape: const Border(
      //       bottom: BorderSide(
      //           color: Colors.white,
      //           width: 0
      //       )),
      //   toolbarHeight: 65,
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      //   title: Container(
      //     width: 55,
      //     height: 55,
      //     decoration: BoxDecoration(
      //       color: Colors.grey.shade200,
      //       borderRadius: BorderRadius.circular(20),
      //     ),
      //     child: Center(child:
      //     IconButton(
      //         onPressed: (){
      //           Navigator.of(context).pop();
      //         },
      //         icon: const Icon(Icons.arrow_back, color: Colors.black, size: 25,)),
      //     ),
      //   ),
      // ),
      backgroundColor: Colors.grey.shade400,

      bottomNavigationBar:
      Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          // borderRadius: BorderRadius.vertical(top: Radius.circular(35))
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 30),
                child: Text('1.6 SOL', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              ),
              Expanded(
                child: ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    onPressed: (){}, child: const Text('Купить сейчас', style: TextStyle(fontSize: 16),)),
              )


            ],
          ),
        ),

      ),


      body:
      SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              viewAvatarContainer(),

              const Padding(
                padding: EdgeInsets.only(left: 20, top: 30),
                child: Text('Преимущества', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // statContainer(title: '', subtitle: 'Базовый уровень'),
                    // statContainer(title: '+10', subtitle: 'баллов'),
                    // statContainer(title: '+0.2', subtitle: 'рейтинг'),
                  ],),
              ),

              // _statColumn()

            ],
          ),
        ),
      ),
    );
  }



  Widget viewAvatarContainer() => Padding(
    padding: const EdgeInsets.only(bottom: 0),
    child: Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      // padding: EdgeInsets.symmetric(vertical: 0, horizontal: 100),
      // padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(50)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: backButton(context),
          ),

          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10)
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(top: 30),
            child:
            Text('Головной убор', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),),
          ),


          const Padding(
            padding: EdgeInsets.only(top: 10),
            child:
            Text('#0863246', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 25),
            child:
            Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: const Text('Категория', style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),)),
          ),

        ],),
    ),
  );

}