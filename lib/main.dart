import 'dart:html';

import 'package:flutter/material.dart';
import 'package:projetodatamob/routes.dart';
import 'package:projetodatamob/screens/login.dart';
import 'package:projetodatamob/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseFirestore dataBase = FirebaseFirestore.instance;
  CollectionReference login = dataBase.collection("login");

  login.add(
    {"nome": "TesteMasterII", "senha": "123456"},
  ).then((value) => print("Processado com sucesso!!"));

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
