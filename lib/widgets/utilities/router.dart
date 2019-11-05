import 'package:flutter/material.dart';
import 'package:grid_unlock/repositories/repositories.dart';
import 'package:grid_unlock/screens/screens.dart';

class Router {
  static const accountRoute = '/account';
  static const mapRoute = '/maps';
  static const networksRoute = '/networks';
  static const settingsRoute = '/settings';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    UserRepository userRepository = UserRepository();
    switch (routeSettings.name) {
      case mapRoute:
        return MaterialPageRoute(builder: (_) => MapPage());
      case accountRoute:
        return MaterialPageRoute(
            builder: (_) => AccountPage(
                  userRepository: userRepository,
                ));
      case networksRoute:
        return MaterialPageRoute(builder: (_) => NetworksPage());
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => SettingsPage());
      default:
        return MaterialPageRoute(builder: (_) => MapPage());
    }
  }
}
