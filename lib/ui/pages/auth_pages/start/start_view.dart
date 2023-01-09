import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/pages/auth_pages/start/start_vm.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/network_row.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';


class StartView extends StatefulWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {

  getInit() async {
    Future.delayed(const Duration(microseconds: 100)).then((value) {
      context.router.pushAndPopUntil(HomeViewRoute(initIndex: 0), predicate: (route) => false);
    });
  }

  @override
  void initState() {
    super.initState();
    getInit();
  }

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
