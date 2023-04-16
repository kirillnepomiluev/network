import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/fields/app_text_field.dart';
import 'package:network_app/utils/utils.dart';
import 'package:network_app/utils/res.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddCommentRow extends StatefulWidget {
  const AddCommentRow({Key? key, required this.controller,}) : super(key: key);
  final TextEditingController controller;

  @override
  State<AddCommentRow> createState() => _AddCommentRowState();
}

class _AddCommentRowState extends State<AddCommentRow> {
  bool showTextField = false;

  @override
  Widget build(BuildContext context) {
    return showTextField ? textFieldColumn() : commentRow();
  }

  Widget commentRow() => Padding(
        padding: const EdgeInsets.only(bottom: 3),
        child: InkWell(
          onTap: () {
            setState(() {
              showTextField = !showTextField;
            });
          },
          child: Row(
            children: [
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(3.1415),
                child: Icon(
                  Icons.chat_bubble_outline,
                  size: 20.sp, //22
                  color: AppColors.salad,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 21, bottom: 2),
                child: Text(
                  'Добавить комментарий',
                ),
              )
            ],
          ),
        ),
      );

  Widget textFieldColumn() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 40.sp,
              child: AppTextField(
                controller: widget.controller,
              ),),
          SizedBox(
            height: Res.s20,
          ),
          AppButton(
              width: 55.sp,
              height: 30.sp,
              textStyle: AppTextStyles.black,
              buttonColor: AppColors.salad,
              borderColor: AppColors.salad,
              onPressed: () {
                Utils.unFocus();
                widget.controller.clear();
                setState(() {
                  showTextField = false;
                });
              },
              text: 'Отменить',),
        ],
      );
}
