import 'package:flutter/material.dart';
import 'package:grid_unlock/widgets/widgets.dart';

class AccountPage extends StatelessWidget {
  static const routeName = '/account';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      drawer: NavigationDrawer(),
      body: Text('Someday there will be a cool account page here.'),
    );
  }
}
