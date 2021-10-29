import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      drawer: Drawer(
        child: Stack(
          children: [
            Navbar(),
          ],
        ),
      ),
      appBar: new AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(Icons.align_horizontal_left_rounded),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [],
      ),
    );
  }
}
