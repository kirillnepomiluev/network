import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/profile_pages/person_profile/widgets/person_profile_avatar_container.dart';
import 'package:network_app/ui/pages/profile_pages/person_profile/widgets/person_profile_stat_column.dart';


class PersonProfileView extends StatelessWidget {
  const PersonProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              PersonProfileAvatarContainer(),
              PersonProfileStatColumn()
            ],
          ),
        ),
      ),
    );
  }
}
