import 'package:flutter/material.dart';
import 'package:network_app/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

// import 'package:network_app/ui/widgets/view_model_data/view_model_builder.dart';
// Widget build(BuildContext context) {
//   return ViewModelBuilder<LoginViewModel>(
//       createModelDataEx: () => LoginViewModel(context),
//       builder: (context, model) {
//         return Scaffold();
//       });
// }


// import 'package:flutter/material.dart';
// import 'package:network_app/ui/widgets/view_model_data/view_model_data.dart';
// class TestViewModel extends ViewModel {
//   final BuildContext context;
//   TestViewModel(this.context);
//
//   void onTap() {
//     Navigator.of(context).push(MaterialPageRoute<void>(
//         builder: (context) => const InputNamePage()));
//   }
//
// }
