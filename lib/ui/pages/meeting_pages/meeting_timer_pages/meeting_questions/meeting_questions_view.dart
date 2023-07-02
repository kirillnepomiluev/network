import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/models/meeting_model.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_questions/widgets/meeting_question_container.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_questions/meeting_questions_vm.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/res.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class MeetingQuestionsView extends StatelessWidget {
  const MeetingQuestionsView({Key? key, required this.meetingModel}) : super(key: key);
  final MeetingModel meetingModel;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MeetingQuestionsViewModel>(
        createModelDataEx: () => MeetingQuestionsViewModel(context),
        builder: (context, model) {

          meetingModel.questionsList = model.questionsListNew;
          return Scaffold(
            extendBody: true,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     const AppBarRow(),
                      SizedBox(height: Res.s35,),
                      RichTextTwo(
                        text1: 'You should answer to ',
                        text2: '${model.questionsListNew.length} questions',
                      ),
                      SizedBox(height: Res.s35,),
                      //Начать с 1-го вопроса
                      AppButton(
                        onPressed: () {
                          context.router
                              .push(MeetingAnswersViewRoute(meetingModel: meetingModel));
                        },
                        text: 'Start with the 1st question',
                      ),

                      SizedBox(height: Res.s35,),

                      GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: Res.s12,
                              mainAxisSpacing: Res.s12,
                              mainAxisExtent: 46.sp,   //112
                          ),
                          itemCount: model.questionsListNew.length,
                          itemBuilder: (_, index) {
                            return
                              MeetingQuestionContainer(
                                text: model.questionsListNew[index].title,
                              );
                          },),

                      SizedBox(height: Res.s32,),

                    ],
                  ),
                ),
              ),
            ),
          );
        },);
  }
}
