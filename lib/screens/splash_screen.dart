import 'package:flutter/material.dart';
import 'package:grid_unlock/widgets/widgets.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: NavigationDrawer(),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
