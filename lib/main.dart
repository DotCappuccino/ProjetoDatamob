import 'package:flutter/material.dart';
import 'package:projetodatamob/routes.dart';
import 'package:projetodatamob/screens/login.dart';
import 'package:projetodatamob/theme.dart';

void main() async {
  /*Remover comentario para popular o firebase*/
  //mapearFireStore();
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
