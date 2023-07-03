import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/settings_pages/avatar_edit/avatar_edit_vm.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/res.dart';
import 'package:provider/provider.dart';


class AvatarEditView extends StatelessWidget {
  const AvatarEditView({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AvatarEditViewModel>(
      createModelDataEx: () => AvatarEditViewModel(context),
      builder: (context, model) {
        final userNotifier = Provider.of<UserNotifier>(context);
        final userData = userNotifier.userData;
        final mediaWidth = MediaQuery.of(context).size.width;
        return Scaffold(
          body: SafeArea(
            child:
            model.showLoading? const Center(child: CircularProgressIndicator(),):
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Res.s15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    AppBarRow(title: AppString.of(context).profilePhoto,),
                    SizedBox(height: Res.s26,),
                    // AppCircleAvatar(
                    //   avatarUrl: userData.avatarURL,
                    //   // contSize: contSize??40.sp,
                    //   contSize: mediaWidth,
                    //   isAssetImage: false,
                    // ),
                    Container(
                      width: mediaWidth, //120
                      height: mediaWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image:
                        model.photoChoosed?
                        DecorationImage(
                          image: FileImage(model.file!),
                          fit: BoxFit.cover,
                        )
                            :
                        DecorationImage(
                          image: NetworkImage(userData.avatarURL),
                          fit: BoxFit.cover,
                          // alignment: Alignment.bottomCenter
                        ),
                      ),
                    ),

                    SizedBox(height: Res.s26,),

                    // AppButton(onPressed: model.addPhotoFunc, text: AppString.of(context).chooseNewPhoto),

                    InkWell(
                      onTap: model.addPhotoFunc,
                      child: AppContainer.outlined(
                          width: mediaWidth,
                          child: Text(AppString.of(context).chooseNewPhoto, textAlign: TextAlign.center, style: AppTextStyles.primary18,)),
                    ),

                    SizedBox(height: Res.s26,),

                    if(model.photoChoosed)
                    AppButton(onPressed: (){
                      model.uploadPhotoFunc(userNotifier);
                    }, text: AppString.of(context).changeThePhoto)

                    // PersonProfileAvatarContainer(partnerModel: userData),
                    // const PersonProfileStatColumn()

                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
