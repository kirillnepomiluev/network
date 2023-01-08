import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';

class MeetingAnswersQuestionItem extends StatelessWidget {
  final int questionCount;
  final int questionIndex;
  const MeetingAnswersQuestionItem({
    Key? key, required this.questionCount, required this.questionIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: questionCount,
        itemBuilder: (BuildContext context, int index) {
          return questionIndex == index
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Вопрос ${index + 1} из $questionCount',
                        style: AppTextStyles.salad16.copyWith(
                          fontWeight: FontWeight.w700,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, right: 32),
                      child: SizedBox(
                        child: Text(
                            index == 0
                                ? 'А ещё вопрос может быть длинным придлинным и на него тоже нужно ответить?'
                                : 'Какой-нибудь вопрос №${index + 1}',
                            style: AppTextStyles.primary20
                                .copyWith(fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
                )
              : Container();
        });
  }
}
