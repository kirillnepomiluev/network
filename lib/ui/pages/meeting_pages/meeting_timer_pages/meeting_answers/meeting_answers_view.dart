import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/navigation/app_router.gr.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/common/general_widgets.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingAnswersView extends StatefulWidget {
  const MeetingAnswersView({Key? key}) : super(key: key);

  @override
  State<MeetingAnswersView> createState() => _MeetingAnswersViewState();
}

class _MeetingAnswersViewState extends State<MeetingAnswersView> {
  String groupValue = 'Вариант ответа A';

  final _controller = TextEditingController();

  int _missedCount = 3;

  final int _questionCount = 3;
  int _questionIndex = 0;
  double _progress = 0.00;
  bool showSendButton = false;

  void sendFunction({bool isMissing = false}) {
    if (isMissing && _missedCount > 0) {
      _missedCount--;
    }

    _controller.clear();

    showSendButton = false;

    if ((_questionIndex + 1) == _questionCount) {
      context.router.push( const MeetingAnswersSuccessViewRoute());
    } else {
      groupValue = 'Вариант ответа A';
      _progress = (_questionIndex + 1) / _questionCount;
      _questionIndex++;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: ConstColor.blackBack,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: AppBackButton(),
              ),

              //Прогресс
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 0.1146 * mediaWidth, //43
                      height: 0.1146 * mediaWidth,
                      decoration: BoxDecoration(
                        color: AppColors.white10,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                          child: Text(
                        '1',
                        style: TextStyle(
                            // color: ConstColor.textWhite,
                            fontSize: 16.5.sp, //14
                            fontWeight: FontWeight.w500),
                      )),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.1173 * mediaWidth //44
                            ),
                        child: LinearProgressIndicator(
                          backgroundColor: AppColors.white10,
                          color: AppColors.salad100,
                          minHeight: 4,
                          value: _progress,
                        ),
                      ),
                    ),
                    Container(
                      width: 0.1146 * mediaWidth, //43
                      height: 0.1146 * mediaWidth,
                      decoration: BoxDecoration(
                        color: AppColors.white10,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                          child: Text(
                        '3',
                        style: TextStyle(
                            // color: ConstColor.textWhite,
                            fontSize: 16.5.sp, //14
                            fontWeight: FontWeight.w500),
                      )),
                    ),
                  ],
                ),
              ),

              //Нижняя часть
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 27, horizontal: 16),
                height: mediaHeight,
                width: mediaWidth,
                decoration: BoxDecoration(
                    color: AppColors.white10,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: _questionCount,
                        itemBuilder: (BuildContext context, int index) {
                          return _questionIndex == index
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Вопрос ${index + 1} из $_questionCount',
                                      style: TextStyle(
                                        fontSize: 17.5.sp, //16
                                        color: AppColors.salad100,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, right: 32),
                                      child: SizedBox(
                                        // width: 300,
                                        child: Text(
                                          index == 0
                                              ? 'А ещё вопрос может быть длинным придлинным и на него тоже нужно ответить?'
                                              : 'Какой-нибудь вопрос №${index + 1}',
                                          style: TextStyle(
                                            // color: ConstColor.textWhite,
                                            fontSize: 19.5.sp, //20
                                            fontWeight: FontWeight.w600,
                                          ),
                                          // textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Container();
                        }),

                    const SizedBox(
                      height: 42,
                    ),

                    // Padding(
                    //   padding: const EdgeInsets.only(top: 35),
                    //   child: _textEditor(),
                    // ),

                    levelContainer('Вариант ответа A'),
                    levelContainer('Вариант ответа B'),
                    levelContainer('Вариант ответа C'),

                    if (_missedCount > 0)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 42),
                            child: InkWell(
                              onTap: () {
                                sendFunction(isMissing: true);
                              },
                              child: Container(
                                // height: 32,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 18),
                                decoration: BoxDecoration(
                                  color: AppColors.white10,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.5),
                                      child: Text(
                                        'Пропустить этот вопрос',
                                        // style: TextStyle(
                                        //     fontWeight:
                                        //         FontWeight.w400,
                                        //     color: Colors.white,
                                        //     fontSize: 15.5.sp //12
                                        //     ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 11, top: 1),
                                      child: Container(
                                        width: 21,
                                        height: 21,
                                        decoration: const BoxDecoration(
                                            color: AppColors.salad100,
                                            shape: BoxShape.circle),
                                        child: Icon(
                                          Icons.close_rounded,
                                          size: UtilsResponsive.getResSize(
                                              12), //15
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6, left: 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Вы можете пропустить ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      // color: ConstColor.grey,
                                      color: Colors.grey.shade500,
                                      fontSize: 14.sp //10
                                      ),
                                ),
                                Text(
                                  '$_missedCount вопроса',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.salad100,
                                      fontSize: 14.sp //10
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                    Padding(
                      padding: const EdgeInsets.only(top: 71),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: buttonStyleCustom(radius: 20, padV: 26),
                            onPressed: () {
                              sendFunction();

                            },
                            child: Text(
                              'Следующий вопрос',
                              style: TextStyle(
                                  color: AppColors.textBlack,
                                  fontSize: 17.5.sp, //16
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget levelContainer(String title) => Padding(
        padding: const EdgeInsets.only(top: 0),
        child: RadioListTile(
            visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity),

            // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            contentPadding: EdgeInsets.zero,
            activeColor: AppColors.salad100,
            value: title,
            title: Text(
              title,
              style: const TextStyle(
                  color: AppColors.textWhite,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
            groupValue: groupValue,
            onChanged: (String? newValue) {
              setState(() {
                groupValue = newValue!;
              });
            }),
      );
}
