import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/auth_pages/start/start_vm.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/network_row.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';


class StartView extends StatelessWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return ViewModelBuilder<StartViewModel>(
      createModelDataEx: () => StartViewModel(context),
      builder: (context, model) {
        return const Scaffold(
          body: Center(
            child:
            NetworkRow(
              isAppBar: false,
            ),
          ),
        );
      },);
  }
}
