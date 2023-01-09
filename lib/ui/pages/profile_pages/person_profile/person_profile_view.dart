import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/profile_pages/person_profile/widgets/person_profile_avatar_container.dart';
import 'package:network_app/ui/pages/profile_pages/person_profile/widgets/person_profile_stat_column.dart';

class PersonProfileView extends StatefulWidget {
  const PersonProfileView({Key? key}) : super(key: key);

  @override
  State<PersonProfileView> createState() => _PersonProfileViewState();
}

class _PersonProfileViewState extends State<PersonProfileView> {
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
