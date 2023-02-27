import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_questions/meeting_question_container.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_questions/meeting_questions_vm.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingQuestionsView extends StatelessWidget {
  const MeetingQuestionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MeetingQuestionsViewModel>(
        createModelDataEx: () => MeetingQuestionsViewModel(context),
        builder: (context, model) {
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
                      const RichTextTwo(
                        text1: 'Вам необходимо ответить\nна ',
                        text2: '10 вопросов',
                      ),
                      SizedBox(height: Res.s35,),
                      //Начать с 1-го вопроса
                      AppButton(
                        onPressed: () {
                          context.router
                              .push(const MeetingAnswersViewRoute());
                        },
                        text: 'Начать с 1-го вопроса',
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
                          itemCount: model.questionsList.length,
                          itemBuilder: (_, index) {
                            return
                              MeetingQuestionContainer(
                                text: model.questionsList[index],
                              );
                          },)
                    ],
                  ),
                ),
              ),
            ),
          );
        },);
  }
}
