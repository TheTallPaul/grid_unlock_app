import 'package:flutter/material.dart';

import 'map_page.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Grid Unlock')),
        body: GridView.count(
            primary: true,
            padding: const EdgeInsets.all(5.0),
            crossAxisSpacing: 5.0,
            crossAxisCount: 2,
            children: List.generate(_choices.length, (index) {
              return Center(child: _ChoiceCard(choice: _choices[index]));
            })));
  }
}

class _Choice {
  const _Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<_Choice> _choices = <_Choice>[
  _Choice(title: 'Rider', icon: Icons.directions_walk),
  _Choice(title: 'Driver', icon: Icons.directions_car),
  _Choice(title: 'Networks', icon: Icons.ac_unit),
  _Choice(title: 'Settings', icon: Icons.settings),
];

class _ChoiceCard extends StatelessWidget {
  const _ChoiceCard({Key key, this.choice}) : super(key: key);
  final _Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return GestureDetector(
      child: Card(
          child: Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(choice.icon, size: 80.0, color: textStyle.color),
              Text(choice.title, style: textStyle),
            ]),
      )),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MapPage()));
      },
    );
  }
}
