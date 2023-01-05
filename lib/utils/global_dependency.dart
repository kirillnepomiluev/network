// import 'package:flutter/material.dart';
// import 'package:network_app/app/app.dart';
// import 'package:network_app/navigation/app_router.gr.dart';
// import 'package:network_app/navigation/auth_guard.dart';
// import 'dart:async';
// export 'package:provider/provider.dart';


// class GlobalDependency extends WellAsyncDependency {
//   AppRouter router = AppRouter(authGuard: AuthGuard());
//
//   @override
//   Future initAsync(BuildContext context) async {
//     print('1 initAsync');
//     WidgetsFlutterBinding.ensureInitialized();
//     router = AppRouter(authGuard: AuthGuard());
//     // App.router = router = AppRouter(authGuard: AuthGuard());
//   }
// }
//
// abstract class WellAsyncDependency extends WellDependency {
//   final Completer _inited = Completer();
//   @override
//   void init(BuildContext context) {
//     print('2 initAsync');
//     initAsync(context).then((_) => _inited.complete());
//   }
//
//   Future<void> initAsync(BuildContext context);
// }
//
// abstract class WellDependency extends ChangeNotifier {
//   void init(BuildContext context);
//
//   static T of<T extends WellDependency>(BuildContext context) =>
//       context.read<T>();
//
//   static T depend<T extends WellDependency>(BuildContext context) =>
//       context.watch<T>();
// }
//
// class AsyncDependencyWidget<T extends WellAsyncDependency>
//     extends ChangeNotifierProvider<T> {
//   AsyncDependencyWidget({
//     super.key,
//     required T Function() create,
//     required WidgetBuilder loaderBuilder,
//     required Widget child,
//   }) : super(
//           create: (context) => create()..init(context),
//           child: child,
//           builder: (context, child) => FutureBuilder(
//             future: context.read<T>()._inited.future,
//             builder: (context, snap) {
//               if (snap.connectionState != ConnectionState.done) {
//                 return loaderBuilder(context);
//               }
//               return child!;
//             },
//           ),
//         );
// }
