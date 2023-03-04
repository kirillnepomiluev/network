import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/reg_success/reg_success_vm.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';


class RegSuccessView extends StatefulWidget {
  const RegSuccessView({Key? key}) : super(key: key);

  @override
  State<RegSuccessView> createState() => _RegSuccessViewState();
}

class _RegSuccessViewState extends State<RegSuccessView> {
  @override
  Widget build(BuildContext context) {
  return ViewModelBuilder<RegSuccessViewModel>(
      createModelDataEx: () => RegSuccessViewModel(context),
      builder: (context, model) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),
                    AppBackButton(func: model.onBack),
                    const SizedBox(height: 31,),
                    AppContainer(
                      padV: 20,
                      padH: 20,
                      color: AppColors.white05,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppString.of(context).weCongratulate,
                            textAlign: TextAlign.center,
                            style:
                            AppTextStyles.salad24.copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 29,),
                          Text(
                              AppString.of(context).youSuccessfullySignedUp,
                              style: AppTextStyles.primary16,
                          ),

                          const SizedBox(height: 35,),

                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 4,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: ListTile(
                                    title: Text(
                                        '${AppString.of(context).rule} ${index + 1}',
                                        style: AppTextStyles.primary18.copyWith(fontWeight: FontWeight.w500),
                                    ),
                                    contentPadding: EdgeInsets.zero,
                                    subtitle: const Padding(
                                      padding: EdgeInsets.only(top: 15),
                                      child: Text(
                                        Constants.strLoremIpsum,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ),
                                );
                              },),
                        ],
                      ),
                    ),

                    const SizedBox(height: 42,),

                    AppButton(onPressed: model.onTap, text: AppString.of(context).accept,)

                  ],
                ),
              ),
            ),
          ),
        );
      },);
}

}
