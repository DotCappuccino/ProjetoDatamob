import 'package:flutter/material.dart';
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
                image: AssetImage('assets/images/usuario.png'),
                fit: BoxFit.fill,
              ),
              border: Border.all(
                color: Colors.black,
                width: 5,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 5),
            //width: 250,
            //height: 60,
            height: getProportionateScreenHeight(80),
            width: getProportionateScreenWidth(150),
            child: TextField(
              decoration: InputDecoration(
                //border: OutlineInputBorder(),
                labelText: 'Usuario',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5, bottom: 10),
            height: getProportionateScreenHeight(80),
            width: getProportionateScreenWidth(150),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                //border: OutlineInputBorder(),
                focusColor: Colors.yellow,
                labelText: 'Senha',
              ),
            ),
          ),
          ElevatedButton(
            style: raisedButtonStyle,
            child: Text('Login !'),
            onPressed: () {
              Navigator.pushNamed(context, Menu.routeName);
            },
          ),
        ],
      ),
    );
  }
}
