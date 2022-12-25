import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:network_app/ui/pages/auth_pages/auth/login_pages/login/login_view.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/network_row.dart';


class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:

        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute<void>(
                builder: (context) => const LoginView()));
          },
          child: const NetworkRow(
            isRow: false,
            opacity: 0.3,
          ),
        ),
      ),
    );
  }
}
