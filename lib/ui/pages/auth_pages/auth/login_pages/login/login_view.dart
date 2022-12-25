import 'package:flutter/material.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login/login_vm.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/button_trouble_enter.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/network_row.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/widgets/view_model_data/view_model_builder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final _buttonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.white),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    )));

class AppButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  const AppButton(
      {Key? key,
      this.onPressed,
      this.width = double.infinity,
      this.height,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: _buttonStyle,
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18.sp, //18
              color: Colors.black
          ),
        ),
      ),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<LoginViewModel> //Надо указывать, чтоб он понимал какого типа model, иначе model - это Object
      (
        createModelDataEx: () => LoginViewModel(context),    //передаем модель для управления
        builder: (context, model) {
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  Positioned(
                      bottom: 17.sp, //5
                      right: 17.sp, //10
                      child: const ButtonTroubleEnter()
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 188,
                      ),
                      const Center(child: NetworkRow(isRow: false, opacity: 0.05)),
                      const SizedBox(
                        height: 106,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 17.5.sp,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildRichText(
                                text1: 'Главное в связах\n - это ', text2: 'связи'),
                            SizedBox(
                              height: 26.sp,
                            ),
                            Wrap(
                              direction: Axis.horizontal,
                              children: [
                                AppButton(
                                  width: 56.sp, //168
                                  height: 35.sp, //62
                                  onPressed: model.onEnterTap,
                                  text: AppString.of(context).signIn,
                                ),

                                Padding(
                                  padding: EdgeInsets.only(left: 14.sp //10
                                  ), //10
                                  child: InkWell(
                                    onTap: (() {}),
                                    child: Container(
                                      padding: const EdgeInsets.all(24),
                                      // padding: const EdgeInsets.all(22),
                                      width: 35.sp, //66
                                      height: 35.sp, //64
                                      decoration: BoxDecoration(
                                        color: ConstColor.white10,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child:
                                      Assets.images.icons.logoGoogle.image()
                                      // Image.asset(
                                      //   'assets/icons/logo_google.png',
                                      // ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 14.sp), // 10
                                  child: Container(
                                    padding: const EdgeInsets.all(24),
                                    width: 35.sp, //64
                                    height: 35.sp, //64
                                    decoration: BoxDecoration(
                                      color: ConstColor.white10,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child:

                                    Assets.images.icons.logoFacebook.image(
                                        width: 10,
                                        height: 10,
                                    )
                                    // Image.asset(
                                    //   'assets/icons/logo_facebook.png',
                                    //   width: 10,
                                    //   height: 10,
                                    // ),

                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });

  }

  Widget _buildRichText({
    String text1 = '',
    String text2 = '',
  }) =>
      RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          style: TextStyle(
            color: Colors.white,
            fontSize: 26.sp, //36
            fontWeight: FontWeight.w700,
          ),
          children: <TextSpan>[
            TextSpan(
              text: text1,
            ),
            TextSpan(
                text: text2,
                style: const TextStyle(
                  color: ConstColor.salad100,
                )),
          ],
        ),
        // minFontSize: 14,
      );
}
