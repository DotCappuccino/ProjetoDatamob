import 'package:flutter/material.dart';
import 'package:projetodatamob/screens/login.dart';
import 'package:projetodatamob/screens/navbar_parts/menu_body.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          MenuBody(),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => Navigator.pushNamed(context, Login.routeName),
          ),
          Divider(),
          ListTile(
            title: Text('Exit'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => Navigator.pushNamed(context, Login.routeName),
          ),
        ],
      ),
    );
  }
}
