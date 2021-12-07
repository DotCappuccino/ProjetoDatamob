import 'package:flutter/material.dart';
import 'package:projetodatamob/screens/Navbar.dart';
import 'package:projetodatamob/screens/login.dart';
import 'package:projetodatamob/size.dart';

class Menu extends StatefulWidget {
  static String routeName = "/Menu";
  String nameuser;

  Menu({Key? key, required this.nameuser}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late String name = widget.nameuser;
  final menu = [
    {"nome": "Teste1", "senha": "1234"},
    {"nome": "Teste2", "senha": "123456"},
    {"nome": "Teste3", "senha": "123456789"},
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
                height: 520,
                child: ListView.builder(
                    itemCount: menu.length,
                    itemBuilder: (BuildContext context, int i) {
                      var aux = menu[i];
                      return ExpansionTile(
                        title: Text(
                          aux["nome"].toString(),
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      );
                    })),
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
            //Navbar(),
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
      body: Stack(
        children: [Text('Clique no canto superior esquerdo Sr. $name')],
      ),
    );
  }
}
