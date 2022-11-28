import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:network_app/auth/login_page.dart';
import 'package:network_app/components/general_widgets.dart';


class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ConstColor.blackBack,
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute<void>(
                builder: (context) => const LoginPage()));
          },
          child:
          const NetworkRow(isRow: false, opacity: 0.3,),
        ),
      ),
    );
  }
}






