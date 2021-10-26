import 'package:flutter/material.dart';
import 'package:projetodatamob/screens/login_parts/background.dart';
import 'package:projetodatamob/screens/login_parts/labels.dart';
import 'package:projetodatamob/size.dart';

class Login extends StatefulWidget {
  static String routeName = "/Login";
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    //Pega o tamanho da page
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          LabelsLogin(),
        ],
      ),
    );
  }
}
