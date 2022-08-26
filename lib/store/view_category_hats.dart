import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/store/view_prod_hat.dart';

class ViewCategoryHatsPage extends StatefulWidget {
  const ViewCategoryHatsPage({Key? key}) : super(key: key);

  @override
  State<ViewCategoryHatsPage> createState() => _ViewCategoryHatsPageState();
}

class _ViewCategoryHatsPageState extends State<ViewCategoryHatsPage> {

  // int _active = 0;

  Widget miniContainer({required int position, required String text}) => Padding(
    padding: const EdgeInsets.only(right: 10),
    child: InkWell(
      onTap: ((){
        // setState(() {
        //   _active=position;
        // });
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1.5, color: Colors.grey.shade500)
        ),
        // height: 30,
        // width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 5, right: 3),
              child: Text(text, style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),),
            ),

            const Icon(Icons.keyboard_arrow_down_sharp, size: 14, color: Colors.black,)

          ],),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // extendBody: true,
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(child:
          IconButton(
              onPressed: (){
                Navigator.of(context).pop();
                // Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const HomePage()));
              },
              icon: const Icon(Icons.arrow_back, color: Colors.black, size: 25,)),
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade400,
      body:
      SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text('Головные уборы', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
                ),

                const Text(Constants.strLoremIpsum,
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    )),


                //Выбор интерфейса
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 24),
                  child:

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        miniContainer(position: 1, text: 'Цена'),
                        miniContainer(position: 2, text: 'Категория'),
                        miniContainer(position: 3, text: 'Сортировка'),
                      ],
                    ),
                  ),
                ),

                Center(
                  child: Column(
                    // direction: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            hatContainer(
                              context: context,
                              contWidth: MediaQuery.of(context).size.width*0.42
                            ),

                            hatContainer(
                              context: context,
                                contWidth: MediaQuery.of(context).size.width*0.42
                            ),

                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            hatContainer(
                                context: context,
                                contWidth: MediaQuery.of(context).size.width*0.42
                            ),

                            hatContainer(
                                context: context,
                                contWidth: MediaQuery.of(context).size.width*0.42
                            ),

                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            hatContainer(
                                context: context,
                                contWidth: MediaQuery.of(context).size.width*0.42
                            ),

                            hatContainer(
                                context: context,
                                contWidth: MediaQuery.of(context).size.width*0.42
                            ),

                          ],
                        ),
                      ),

                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

}


Widget hatContainer({required BuildContext context, double contWidth = 150,}) => Padding(
  padding: const EdgeInsets.only(right: 10),
  child: InkWell(
    onTap: ((){
      Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const ViewProdHatPage()));
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
            height: contWidth*0.7,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10)
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(top: 20),
            child:
            Text('1.6 SOL', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 2, bottom: 10),
            child: Text('#0863246', style: TextStyle(fontSize: 11, color: Colors.grey.shade600),),
          ),

        ],),
    ),
  ),
);