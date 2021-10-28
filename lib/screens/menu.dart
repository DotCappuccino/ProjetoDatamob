import 'package:flutter/material.dart';
import 'package:projetodatamob/screens/Navbar.dart';
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
      appBar: AppBar(title: Text("Teste")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          Navbar(),
          //SearchField(),
          //MenuBody(),
        ],
      ),
    );
  }
}
