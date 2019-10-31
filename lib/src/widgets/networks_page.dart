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
        body: Container(
          child: Column(children: <Widget>[
            Image(image: AssetImage('assets/images/networks_splash.png')),
            Text(
              "Networks connect you to communties of people you can trust to share rides with.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
            FlatButton(
                onPressed: () {},
                child: Text(
                  'Get Started',
                  style: TextStyle(fontSize: 42.0),
                )),
          ]),
        ));
  }
}
