import 'package:flutter/material.dart';
import 'package:network_app/app/core/models/meeting_model.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_questions/meeting_questions_vm.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/utils/res.dart';

// List<String> _testList = [
//   'А ещё вопрос может быть длинным придлинным и на него тоже нужно ответить?',
//   'Второй вопрос',
//   'Третий вопрос'
// ];


class MeetingAnswersQuestionItem extends StatelessWidget {
  const MeetingAnswersQuestionItem({
    Key? key, required this.questionCount, required this.questionIndex, required this.meetingModel,
  }) : super(key: key);
  final int questionCount;
  final int questionIndex;
  final MeetingModel meetingModel;

  @override
  Widget build(BuildContext context) {

    final qusetionModel = meetingModel.questionsList[questionIndex] as MeetingQuestionModel;

    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Question ${questionIndex + 1} from $questionCount',
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
                qusetionModel.title,
                  style: AppTextStyles.primary20
                      .copyWith(fontWeight: FontWeight.w600),),
            ),
          ),
        ],
      );
      // _TestColumn(questionCount: questionCount, index: questionIndex, textInit: _testList[questionIndex],);
  }
}
