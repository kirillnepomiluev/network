import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/common/general_widgets.dart';
import 'package:network_app/ui/widgets/fields/app_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddCommentRow extends StatefulWidget {
  final Color color;
  const AddCommentRow({Key? key, required this.color}) : super(key: key);

  @override
  State<AddCommentRow> createState() => _AddCommentRowState();
}

class _AddCommentRowState extends State<AddCommentRow> {
  bool showTextField = false;
  final _controller = TextEditingController();

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
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Padding(
                padding: const EdgeInsets.only(left: 21, bottom: 2),
                child: Text(
                  'Добавить комментарий',
                  style: TextStyle(
                    fontSize: 16.5.sp, //14
                    fontWeight: FontWeight.w400,
                    // color: widget.color
                  ),
                ),
              )
            ],
          ),
        ),
      );

  Widget textFieldColumn() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppTextField(),
          const SizedBox(
            height: 20,
          ),
          AppButton(
              height: 60,
              width: 200,
              buttonColor: AppColors.salad,
              borderColor: AppColors.salad,
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                _controller.clear();
                setState(() {
                  showTextField = false;
                });
              },
              text: 'Отправить'),
        ],
      );
}
