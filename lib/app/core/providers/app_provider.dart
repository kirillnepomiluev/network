import 'package:network_app/app/core/providers/notifiers/settings_notifier.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart' show SingleChildWidget;


class AppProviders{
  static final List<SingleChildWidget> provider = [
    ChangeNotifierProvider<UserNotifier>(create: (context) => UserNotifier()), //данные для авторизованного
    ChangeNotifierProvider<SettingsNotifier>(create: (context) => SettingsNotifier()), //данные настроек
  ];
}