import 'package:flutter/material.dart';
import 'package:network_app/app/core/models/meeting_model.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_answers/meeting_answers_progress_row.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_answers/meeting_answers_question_item.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_answers/meeting_answers_skip_question.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_answers/meeting_answers_vm.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_answers/widgets/meeting_answers_radio_list_tile.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_questions/meeting_questions_vm.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/res.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class MeetingAnswersView extends StatelessWidget {
  const MeetingAnswersView({Key? key, required this.meetingModel}) : super(key: key);
  final MeetingModel meetingModel;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MeetingAnswersViewModel>(
        createModelDataEx: () => MeetingAnswersViewModel(context, meetingModel),
        builder: (context, model) {
          final mediaHeight = MediaQuery.of(context).size.height;
          final mediaWidth = MediaQuery.of(context).size.width;
          final qusetionModel = meetingModel.questionsList[model.questionIndex] as MeetingQuestionModel;
          final answerList = qusetionModel.answersList.isEmpty? ['Yes', 'No', "I don't know"] : qusetionModel.answersList;

          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: Res.s10,
                          top: Res.s10,
                      ),
                      child: const AppBackButton(),
                    ),
                    SizedBox(
                      height: Res.s20,
                    ),

                    //Прогресс
                    MeetingAnswersProgressRow(
                      progress: model.progress,
                      questionCount: model.questionCount,
                    ),

                    SizedBox(
                      height: Res.s20,
                    ),

                    //Нижняя часть
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Res.s16,
                          vertical: Res.s26,
                      ),
                      height: mediaHeight,
                      width: mediaWidth,
                      decoration: BoxDecoration(
                          color: AppColors.white10,
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MeetingAnswersQuestionItem(
                            questionCount: model.questionCount,
                            questionIndex: model.questionIndex,
                            meetingModel: meetingModel,
                          ),
                          SizedBox(
                            height: Res.s40,
                          ),
                          // for (final answer in model.answersList)
                          for (final answer in answerList)
                            MeetingAnswersRadioListTile(
                                title: answer,
                                groupValue: model.groupValue,
                                onAnswerTap: model.onAnswerTap,),

                          if (model.missedCount > 0)
                            MeetingAnswersSkipQuestion(
                              missedCount: model.missedCount,
                              sendFunction: model.sendFunction,
                            ),
                          SizedBox(
                            height: 28.sp, //71
                          ),
                          AppButton(
                            onPressed: model.sendFunction,
                            text: 'Next question',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                  ],
                ),
              ),
            ),
          );
        },);
  }
}