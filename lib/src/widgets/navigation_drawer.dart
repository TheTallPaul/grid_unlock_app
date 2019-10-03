import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 132.0,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              _createHeader(),
              _createDrawerItem(
                icon: Icons.accessibility_new,
                text: 'Rider',
              ),
              _createDrawerItem(
                icon: Icons.directions_car,
                text: 'Driver',
              ),
              _createDrawerItem(
                icon: Icons.people,
                text: 'Networks',
              ),
              Divider(),
              _createDrawerItem(icon: Icons.settings, text: 'Settings'),
              _createDrawerItem(icon: Icons.account_circle, text: 'Account'),
            ],
          ),
        ));
  }

  Widget _createHeader() {
    return Container(
        height: 80,
        child: DrawerHeader(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(color: Color(0xFF0175c2)),
            child: Stack(children: <Widget>[
              Positioned(
                top: 14.0,
                left: 12.0,
                child: Text(
                  "GridUnlock",
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              )
            ])));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 6.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
