import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  static String routeName = "/Menu";
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String value = 'A';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Background(),
          //LabelsLogin(),
        ],
      ),
    );
  }
}
