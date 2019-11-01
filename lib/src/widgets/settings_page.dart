import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:grid_unlock/src/blocs/blocs.dart';
import 'package:grid_unlock/src/repositories/style.dart';
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
        body: ListView(
          children: <Widget>[
            BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
              return SwitchListTile(
                value: state.theme == nightTheme(),
                title: Text('Dark Mode'),
                onChanged: (_) {
                  BlocProvider.of<SettingsBloc>(context).add(ThemeToggled());
                },
              );
            })
          ],
        ));
  }
}
