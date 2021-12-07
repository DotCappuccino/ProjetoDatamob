import 'package:flutter/material.dart';
import 'package:projetodatamob/screens/login.dart';
import 'package:projetodatamob/screens/navbar_parts/menu_body.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final menu = [
    {"nome": "Teste1", "nome": "Teste2"}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      ListView(
        children: [
          //MenuBody(),
        ],
      ),
    ]));
  }
}
