import 'package:flutter/material.dart';
import 'package:projetodatamob/screens/apontamentos.dart';

class MenuBody extends StatefulWidget {
  const MenuBody({Key? key}) : super(key: key);

  @override
  _MenuBodyState createState() => _MenuBodyState();
}

class _MenuBodyState extends State<MenuBody> {
  @override
  Widget build(BuildContext context) {
    //String user = 'Teste';
    //CheckMenus(user, 'Entomologia');
    //bool auditoriaVisible = CheckMenus(user, 'Auditoria');

    final menu = [
      {'nome': 'Teste1'},
      {"nome": "Teste2"}
    ];
    int menus = menu.length;
    return Container(
      padding: EdgeInsets.only(top: 50),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.api_sharp),
            title: Text('Apontamentos $menus'),
          ),
          Visibility(
            visible: true,
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
                      onTap: () {
                        Navigator.pushNamed(context, Apontamentos.routeName);
                      },
                    ),
                    ListTile(
                      title: Text('Pós Colheita'),
                      onTap: () {
                        Navigator.pushNamed(context, Apontamentos.routeName);
                      },
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
