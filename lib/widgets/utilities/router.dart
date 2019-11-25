import 'package:flutter/material.dart';
import 'package:grid_unlock/screens/screens.dart';
import 'package:user_repository/user_repository.dart';

class Router {
  static const accountRoute = '/account';
  static const mapRoute = '/maps';
  static const networksRoute = '/networks';
  static const settingsRoute = '/settings';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final UserRepository userRepository = UserRepository();

    switch (routeSettings.name) {
      case mapRoute:
        return MaterialPageRoute<void>(builder: (_) => MapPage());
      case accountRoute:
        return MaterialPageRoute<void>(
            builder: (_) => AccountPage(
                  userRepository: userRepository,
                ));
      case networksRoute:
        return MaterialPageRoute<void>(
            builder: (_) => NetworksPage(userRepository: userRepository));
      case settingsRoute:
        return MaterialPageRoute<void>(builder: (_) => SettingsPage());
      default:
        return MaterialPageRoute<void>(builder: (_) => MapPage());
    }
  }
}
