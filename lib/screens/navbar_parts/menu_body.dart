import 'package:flutter/material.dart';
import 'package:projetodatamob/screens/login.dart';
import 'package:projetodatamob/screens/menu_parts/functions_menu.dart';

class MenuBody extends StatefulWidget {
  const MenuBody({Key? key}) : super(key: key);

  @override
  _MenuBodyState createState() => _MenuBodyState();
}

class _MenuBodyState extends State<MenuBody> {
  @override
  Widget build(BuildContext context) {
    String user = 'Teste';
    bool entomologiaVisible = CheckMenus(user, 'Entomologia');
    bool auditoriaVisible = CheckMenus(user, 'Auditoria');

    return Container(
      padding: EdgeInsets.only(top: 50),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Visibility(
            visible: entomologiaVisible,
            child: ExpansionTile(
              title: Text(
                "Entomologia",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                ListTile(
                  title: Text('Broca Populacional'),
                  onTap: () {
                    Navigator.pushNamed(context, Login.routeName);
                  },
                ),
                ListTile(
                  title: Text('Broca Rev. Lab.'),
                ),
                ListTile(
                  title: Text('Broca/Cigarrinha'),
                ),
                ListTile(
                  title: Text('Broquinha Control. Quimico'),
                ),
              ],
            ),
          ),
          Visibility(
            visible: auditoriaVisible,
            child: ExpansionTile(
              title: Text(
                "Auditoria",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                ExpansionTile(
                  title: Text("Plantio Mecanizado"),
                  children: <Widget>[
                    ListTile(
                      title: Text('Pré Colheita'),
                    ),
                    ListTile(
                      title: Text('Pós Colheita'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}