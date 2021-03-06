import 'package:flutter/material.dart';

class NetworksStartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
