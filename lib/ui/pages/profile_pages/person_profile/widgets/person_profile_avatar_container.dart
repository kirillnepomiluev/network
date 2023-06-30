import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/ui/pages/profile_pages/person_profile/widgets/person_profile_avatar_info_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PersonProfileAvatarContainer extends StatelessWidget {
  const PersonProfileAvatarContainer({
    Key? key, required this.partnerModel,
  }) : super(key: key);
  final UserModel partnerModel;

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 112.sp, //662
      width: mediaWidth,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            // top: 50,
            child: SizedBox(
                // width: mediaWidth,
                child:
                // Assets.images.avatars.avatar3D.image(
                //   alignment: Alignment.topCenter,
                // )
                Image.network(partnerModel.bodyURL,
                    height: double.infinity,
                    fit: BoxFit.cover
                )
              ,),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [
                  0.2,
                  0.8,
                  1
                ],
                    colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.88),
                  Colors.black.withOpacity(0.88),
                  // Colors.black
                ],),),
          ),
          PersonProfileAvatarInfoContainer(partnerModel: partnerModel),
        ],
      ),
    );
  }
}
