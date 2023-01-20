import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_answers/meeting_answers_progress_row.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_answers/meeting_answers_question_item.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_answers/meeting_answers_skip_question.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_answers/meeting_answers_vm.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_answers/widgets/meeting_answers_radio_list_tile.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingAnswersView extends StatefulWidget {
  const MeetingAnswersView({Key? key}) : super(key: key);

  @override
  State<MeetingAnswersView> createState() => _MeetingAnswersViewState();
}

class _MeetingAnswersViewState extends State<MeetingAnswersView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MeetingAnswersViewModel>(
        createModelDataEx: () => MeetingAnswersViewModel(context),
        builder: (context, model) {
          final mediaHeight = MediaQuery.of(context).size.height;
          final mediaWidth = MediaQuery.of(context).size.width;
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: UtilsResponsive.getResSize(10),
                          top: UtilsResponsive.getResSize(10),
                      ),
                      child: const AppBackButton(),
                    ),
                    SizedBox(
                      height: UtilsResponsive.getResSize(20),
                    ),

                    //Прогресс
                    MeetingAnswersProgressRow(
                      progress: model.progress,
                    ),

                    SizedBox(
                      height: UtilsResponsive.getResSize(20),
                    ),

                    //Нижняя часть
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: UtilsResponsive.getResSize(16),
                          vertical: UtilsResponsive.getResSize(26),
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
                          ),
                          SizedBox(
                            height: UtilsResponsive.getResSize(40),
                          ),

                          for (final answer in model.answersList)
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
                            text: 'Следующий вопрос',
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