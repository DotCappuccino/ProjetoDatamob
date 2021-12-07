import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projetodatamob/firestore.dart';
import 'package:projetodatamob/generalfunctions.dart';
import 'package:projetodatamob/screens/menu.dart';
import 'package:projetodatamob/size.dart';

class LabelsLogin extends StatefulWidget {
  const LabelsLogin({Key? key}) : super(key: key);

  @override
  _LabelsLoginState createState() => _LabelsLoginState();
}

class _LabelsLoginState extends State<LabelsLogin> {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    minimumSize: Size(200, 50),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(40)),
    ),
  );
  final _user = TextEditingController();
  final _senha = TextEditingController();

  abrirMenu(String variable) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => Menu(nameuser: variable)));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.black,
              image: const DecorationImage(
                image: AssetImage('assets/images/logo_datamob.png'),
                fit: BoxFit.fill,
              ),
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 5),
            height: getProportionateScreenHeight(80),
            width: getProportionateScreenWidth(150),
            child: TextField(
              controller: _user,
              decoration: InputDecoration(
                labelText: 'Usuario',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5, bottom: 10),
            height: getProportionateScreenHeight(80),
            width: getProportionateScreenWidth(150),
            child: TextField(
              controller: _senha,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
            ),
          ),
          ElevatedButton(
            style: raisedButtonStyle,
            child: Text('Acessar !'),
            onPressed: () async {
              if (isEmpty(_user.text) || isEmpty(_senha.text)) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        content: Text('Usuario ou Senha está vazio!'));
                  },
                );
              } else {
                await Firebase.initializeApp();
                FirebaseFirestore dataBase = FirebaseFirestore.instance;
                if (await validaLogin(dataBase, _user.text, _senha.text)) {
                  abrirMenu(_user.text.toLowerCase());
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          content: Text('Usuario ou Senha não localizado!'));
                    },
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
