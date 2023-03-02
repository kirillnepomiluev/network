import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/fields/app_text_field.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/utils/main_pages/dialog_utls.dart';
import 'package:network_app/utils/utils.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingComplaintView extends StatefulWidget {
  const MeetingComplaintView({Key? key}) : super(key: key);

  @override
  State<MeetingComplaintView> createState() => _MeetingComplaintViewState();
}

class _MeetingComplaintViewState extends State<MeetingComplaintView> {
  final _controller = TextEditingController();
  bool showSendButton = false;

  void sendFunction() {
    Utils.unFocus();
    _controller.clear();
    context.router.pop();
    context.router.pop();
    DialogUtils.openBottomSheetInfoWithIcon(
      context: context,
      icon: NetworkIcons.check_circle_outlined,
      text1: 'Ваша ',
      text2: 'жалоба отправлена',
      text3:
          'В ближайшее время мы свяжемся с вами,\nчтобы сообщать о предпринятых мерах',
      textButton: 'Закрыть',
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Utils.unFocus,
      child: SafeArea(
        child: Scaffold(
          // backgroundColor: Colors.grey.shade400,
          body: Column(
            children: [
              //Верхняя часть
              Padding(
                padding: EdgeInsets.only(
                    left: Res.s16,
                    right: Res.s16,
                    bottom: Res.s20,),
                child: Column(
                  children: [
                    const AppBarRow(),
                    Icon(
                      NetworkIcons.smile_dead,
                      size: 39.sp,   //80
                      color: AppColors.salad,
                    ),
                    SizedBox(
                      height: Res.s26,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Res.s10,
                      ),
                      child: const Text(
                        'Мы очень сожалеем о вашем плохом опыте. Пожалуйста, потратьте немного своего времени, чтобы точно описать, что произошло, чтобы мы могли исправить ситуацию, как можно скорее.',
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Res.s16,
              ),

              //Нижняя часть
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Res.s16,),
                  decoration: BoxDecoration(
                      color: AppColors.white10,
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(30),),),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Res.s32,
                      ),
                      //Выберете тип жалобы
                      Container(
                        padding: EdgeInsets.all(Res.s14),
                        decoration: BoxDecoration(
                            color: AppColors.white10,
                            borderRadius: BorderRadius.circular(15),),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Выберете тип жалобы',
                              style: AppTextStyles.primary16,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: Res.s22,
                              color: AppColors.salad,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Res.s21,
                      ),

                      //Ввод ответа
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.white10,
                                borderRadius: BorderRadius.circular(15),),
                            child: const AppTextField(
                              isTransparent: true,
                            ),),
                      ),

                      SizedBox(
                        height: 30.sp,
                      ), //48

                      Padding(
                          padding: EdgeInsets.only(
                              bottom: Res.s35,),
                          child: AppButton(
                            text: 'Отправить',
                            onPressed: sendFunction,
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
    );
  }

}
