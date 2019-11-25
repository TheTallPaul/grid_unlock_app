import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grid_unlock/blocs/blocs.dart';
import 'package:grid_unlock/widgets/widgets.dart';

class CreateNetworkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworksBloc, NetworksState>(builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Networks'),
          ),
          drawer: NavigationDrawer(),
          body: Container(
            child: Column(children: <Widget>[
              Image(image: const AssetImage('assets/images/networks_splash.png')),
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
    });
  }
}
