import 'package:flutter/material.dart';

import 'package:grid_unlock/src/widgets/widgets.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: NavigationDrawer(),
      body: Text('Someday there will be a cool settings page here.'),
    );
  }
}
