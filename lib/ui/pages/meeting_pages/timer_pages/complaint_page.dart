import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/general_widgets.dart';
import 'package:network_app/ui/widgets/network_icons.dart';
import 'package:network_app/utils/responsive_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:network_app/ui/pages/meeting_pages/timer_pages/timer_page.dart';


class ComplaintPage extends StatefulWidget {
  const ComplaintPage({Key? key}) : super(key: key);

  @override
  State<ComplaintPage> createState() => _ComplaintPageState();
}





class _ComplaintPageState extends State<ComplaintPage> {


  final _controller = TextEditingController();

  bool showSendButton = false;
  bool showSuccess = false;


  void sendFunction(){

    FocusManager.instance.primaryFocus?.unfocus();

    _controller.clear();

    Navigator.of(context).pop();
    Navigator.of(context).pop();
    openBottomSheetComplain(
    context: context,
      icon: NetworkIcons.check_circle_outlined,
      text1: 'Ваша ',
      text2: 'жалоба отправлена',
      text3: 'В ближайшее время мы свяжемся с вами,\nчтобы сообщать о предпринятых мерах',
      textButton: 'Закрыть',
      func: (){
        Navigator.of(context).pop();
      }
    );

    // setState(() {
    //   showSuccess = true;
    // });

  }

  @override
  Widget build(BuildContext context) {

    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          // backgroundColor: Colors.grey.shade400,
          body:
          showSuccess == true?
          Column(
            children: [

              const Padding(
                padding: EdgeInsets.only(left: 16, top: 10, bottom: 20),
                child:  BackButtonCustom(),
              ),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  width: mediaWidth,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
                  child:

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Padding(
                            padding: EdgeInsets.only(
                                top: 0.087*mediaHeight   //63
                            ),
                            child: const Icon(NetworkIcons.check_circle_outlined, size: 100,),
                          ),

                          //Текстовое поле
                          Padding(
                              padding: EdgeInsets.only(
                                  top: mediaHeight*0.0624,    //45
                                  bottom: mediaHeight*0.0485  //35
                              ),
                              child:
                              Text(
                                'Ваша жалоба отправлена',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.5.sp, //18
                                    fontWeight: FontWeight.w500

                                ),
                              )
                          ),

                          Text(
                            'В ближайшее время мы свяжемся с вами,\nчтобы сообщать о предпринятых мерах',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.5.sp,   //14
                                fontWeight: FontWeight.w400

                            ),
                          ),
                        ],
                      ),


                      Padding(
                        padding: EdgeInsets.only(
                            bottom:  mediaHeight*0.0485  //35
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ButtonStyle(

                                backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(52),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 17),
                                child: Text(
                                  // 'Создать чат',
                                  'Закрыть',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.5.sp,   //16
                                      fontWeight: FontWeight.w500

                                  ),
                                ),
                              )),
                        ),
                      ),

                    ],
                  )

                ),
              ),
            ],
          )
              :

          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const Padding(
                  padding: EdgeInsets.only(left: 16, top: 10, bottom: 20),
                  child:  BackButtonCustom(),
                ),

                //Верхняя часть

                Container(
                  padding: const EdgeInsets.all(20),
                  width: mediaWidth*0.92,   //345
                  // decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      const Icon(NetworkIcons.smile_dead, size: 80, color: AppColors.salad100,),


                      Padding(
                        padding: const EdgeInsets.only(top: 27.6),
                        child: Text('Мы очень сожалеем о вашем плохом опыте. Пожалуйста, потратьте немного своего времени, чтобы точно описать, что произошло, чтобы мы могли исправить ситуацию, как можно скорее.',
                        textAlign: TextAlign.center,
                          style: TextStyle(
                          fontSize: 16.5.sp, //14
                          fontWeight: FontWeight.w400
                        ),
                        ),
                      )

                    ],
                  ),
                ),


                //Нижняя часть
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        color: AppColors.white10,
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(30))),
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(top: 32),
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                                color: AppColors.white10,
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [

                                Text('Выберете тип жалобы', style: TextStyle(
                                  // fontSize: 17.5.sp,   //16
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400
                                ),),

                                Icon(Icons.keyboard_arrow_down, size: 22, color: AppColors.salad100,)

                              ],
                            ),
                          ),
                        ),

                        //Текстовое поле
                        Padding(
                          padding: const EdgeInsets.only(top: 21, bottom: 48),
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.white10,
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: _textEditor()),

                                showSendButton==false?
                                // IconButton(onPressed: (){}, icon: const Icon(Icons.tag_faces_sharp)):
                                Container(width: 20,):
                                IconButton(onPressed: (){
                                  sendFunction();
                                }, icon: const Icon(Icons.send))

                              ],
                            ),
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(bottom: 35),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                    sendFunction();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 22),
                                  child: Text(
                                    'Отправить',
                                    style: TextStyle(
                                      color: AppColors.textBlack,
                                        fontSize: 17.5.sp,   //16
                                        fontWeight: FontWeight.w500

                                    ),
                                  ),
                                )),
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
    );
  }


  Widget _textEditor() => SizedBox(
    height: 200,
    child: TextField(
      onChanged: (value){

        if(value.isEmpty){
          setState(() {
            showSendButton = false;
          });
        }else{
          setState(() {
            showSendButton = true;
          });
        }

      },
      maxLines: 3,
      controller: _controller,
      style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
      textAlign: TextAlign.start,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Опишите проблему...',
        hintStyle: TextStyle(color: AppColors.textGray, fontSize: ResponsiveUtils.getResSize(14)),
        counterText: '',
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.transparent),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))
        ),
        enabledBorder:
        const OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.transparent),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))
          // borderRadius: BorderRadius.circular(15)
        ),
        // filled: true,
        // fillColor: Colors.white,
      ),
    ),
  );


}
