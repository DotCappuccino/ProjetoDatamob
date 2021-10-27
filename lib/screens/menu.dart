import 'package:flutter/material.dart';
import 'package:projetodatamob/screens/menu_parts/menu_body.dart';
import 'package:projetodatamob/size.dart';
import 'menu_parts/searchfield.dart';

class Menu extends StatefulWidget {
  static String routeName = "/Menu";
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          if (true) SearchField(),
          //if (true) MenuBody(),
        ],
      ),
    );
  }
}
