import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/utils/res.dart';

List<String> _testList = [
  'А ещё вопрос может быть длинным придлинным и на него тоже нужно ответить?',
  'Второй вопрос',
  'Третий вопрос'
];


class MeetingAnswersQuestionItem extends StatelessWidget {
  const MeetingAnswersQuestionItem({
    Key? key, required this.questionCount, required this.questionIndex,
  }) : super(key: key);
  final int questionCount;
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Вопрос ${questionIndex + 1} из $questionCount',
              style: AppTextStyles.salad16.copyWith(
                fontWeight: FontWeight.w700,
              ),),
          Padding(
            padding: EdgeInsets.only(
                top: Res.s25, //25
                right: Res.s32, //32
            ),
            child: SizedBox(
              child: Text(
                  _testList[questionIndex],
                  style: AppTextStyles.primary20
                      .copyWith(fontWeight: FontWeight.w600),),
            ),
          ),
        ],
      );
      // _TestColumn(questionCount: questionCount, index: questionIndex, textInit: _testList[questionIndex],);
  }
}
