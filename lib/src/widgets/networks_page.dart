import 'package:flutter/material.dart';

import 'package:grid_unlock/src/widgets/widgets.dart';

class NetworksPage extends StatelessWidget {
  static const routeName = '/networks';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Networks'),
      ),
      drawer: NavigationDrawer(),
      body: Text('Someday there will be a cool networks page here.'),
    );
  }
}
