import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/auth_pages/start/start_vm.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/network_row.dart';
import 'package:network_app/ui/widgets/view_model_data/view_model_builder.dart';


class StartView extends StatelessWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return ViewModelBuilder<StartViewModel>(
      createModelDataEx: () => StartViewModel(context),
      builder: (context, model) {
        return Scaffold(
          body: Center(
            child:
            InkWell(
              onTap: model.onTap,
              child: const NetworkRow(
                isRow: false,
              ),
            ),
          ),
        );
      });
  }
}
