import 'package:flutter/material.dart';

class MenuBody extends StatefulWidget {
  const MenuBody({Key? key}) : super(key: key);

  @override
  _MenuBodyState createState() => _MenuBodyState();
}

class _MenuBodyState extends State<MenuBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            ExpansionTile(
              title: Text(
                "Entomologia",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                ListTile(
                  title: Text('Broca Populacional'),
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
            ExpansionTile(
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
          ],
        ),
      ),
    );
  }
}
