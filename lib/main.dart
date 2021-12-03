import 'dart:html';

import 'package:flutter/material.dart';
import 'package:projetodatamob/routes.dart';
import 'package:projetodatamob/screens/login.dart';
import 'package:projetodatamob/theme.dart';

void main() async {
  // await Firebase.initializeApp();
  // FirebaseFirestore dataBase = FirebaseFirestore.instance;
  // String nome = "";
  // String senha = "123456789";
  // addLogin(dataBase, nome, senha);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projeto Datamob',
      theme: theme(),
      initialRoute: Login.routeName,
      routes: routes,
    );
  }
}
