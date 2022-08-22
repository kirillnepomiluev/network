import 'package:flutter/material.dart';


class Path {
  const Path(this.pattern, this.builder);
  final String pattern;
  final Widget Function(BuildContext, String?) builder;
}

class RouteConfiguration {
  static List<Path> paths = [


  ];

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    for (Path path in paths) {
      final regExpPattern = RegExp(path.pattern);
      if (regExpPattern.hasMatch(settings.name?? "")) {

        final firstMatch = regExpPattern.firstMatch(settings.name?? "");
        final match = (firstMatch!.groupCount == 1) ? firstMatch.group(1) : "";
        return MaterialPageRoute<void>(
          builder: (context) => path.builder(context, match),
          settings: settings,
        );
      }
    }
// If no match is found, [WidgetsApp.onUnknownRoute] handles it.
    return MaterialPageRoute<void>(
      builder: (context) => const Scaffold(body: Center(child:
      Text("Страница не найденна")
        ,),),
      settings: settings,
    );
  }
}