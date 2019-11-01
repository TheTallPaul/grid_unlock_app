import 'package:flutter/material.dart';

import 'utilities/router.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 160.0,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              _createHeader(),
              _createDrawerItem(
                icon: Icons.accessibility_new,
                text: 'Rider',
                onTap: () =>
                    Navigator.pushReplacementNamed(context, Router.mapRoute),
              ),
              _createDrawerItem(
                icon: Icons.directions_car,
                text: 'Driver',
                onTap: () =>
                    Navigator.pushReplacementNamed(context, Router.mapRoute),
              ),
              _createDrawerItem(
                icon: Icons.people,
                text: 'Networks',
                onTap: () => Navigator.pushReplacementNamed(
                    context, Router.networksRoute),
              ),
              Divider(),
              _createDrawerItem(
                icon: Icons.settings,
                text: 'Settings',
                onTap: () => Navigator.pushReplacementNamed(
                    context, Router.settingsRoute),
              ),
              _createDrawerItem(
                icon: Icons.account_circle,
                text: 'Account',
                onTap: () => Navigator.pushReplacementNamed(
                    context, Router.accountRoute),
              ),
            ],
          ),
        ));
  }

  Widget _createHeader() {
    return Container(
        height: 120,
        child: DrawerHeader(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(color: Color(0xFF877b62)),
            child: Stack(children: <Widget>[
              Positioned(
                top: 29.0,
                left: 20.0,
                child: Text(
                  "GridUnlock",
                  style: TextStyle(
                      fontSize: 24.0,
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
