import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/navigation/app_router.gr.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/common/general_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingRequestsListView extends StatefulWidget {
  const MeetingRequestsListView({Key? key}) : super(key: key);

  @override
  State<MeetingRequestsListView> createState() => _MeetingRequestsListViewState();
}

class _MeetingRequestsListViewState extends State<MeetingRequestsListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child:
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const AppBackButton(),
                      Center(child: Text('Список личных запросов',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.5.sp,   //18
                          fontWeight: FontWeight.w600,
                        ),
                      ))
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: buttonStyleCustom(
                            color: Colors.white, padH: 0, padV: 22, radius: 20),
                        onPressed: () {
                          context.router.push(const ChooseMeetingCategoriesViewRoute());
                        },
                        child: Text(
                          'Создать новый запрос',
                          style: TextStyle(
                              fontSize: 18.5.sp, //18
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        )),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text('Созданные раннее',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.salad100,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const RequestContainerInfo(),

                const RequestContainerInfo(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}



class RequestContainerInfo extends StatelessWidget {
  const RequestContainerInfo(
      {Key? key,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white10,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 27, horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [

              Text('Деловая встреча',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
              ),
              ),

                Text('#256893',
                  style: TextStyle(
                    color: AppColors.salad100,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),

            ],),

            const Padding(
              padding: EdgeInsets.only(top: 5),
              child:
              Text('от 25.11.2022',
                style: TextStyle(
                  color: AppColors.textGray,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),

            ),

            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text('Здесь будет небольшое описание встречи, которое будет видно на 2 строчки...',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

}
