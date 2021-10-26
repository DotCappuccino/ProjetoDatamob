import 'package:flutter/material.dart';
import 'package:projetodatamob/screens/login.dart';

class Home extends StatefulWidget {
  static String routeName = "/Home";
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
// ignore: deprecated_member_use
        child: RaisedButton(
            child: Text('Abrir rota(tela)'),
            onPressed: () {
              Navigator.pushNamed(context, Login.routeName);
            }),
      ),
    );
  }
}
