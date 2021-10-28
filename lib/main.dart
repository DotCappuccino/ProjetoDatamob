import 'dart:html';

import 'package:flutter/material.dart';
import 'package:projetodatamob/routes.dart';
import 'package:projetodatamob/screens/login.dart';
import 'package:projetodatamob/screens/menu.dart';
import 'package:projetodatamob/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Datamob',
      //theme: theme(),
      initialRoute: Menu.routeName,
      routes: routes,
    );
  }
}
