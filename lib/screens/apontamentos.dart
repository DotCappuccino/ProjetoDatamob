import 'package:flutter/material.dart';
import 'package:projetodatamob/screens/apontamentos_parts/apontamentos_body.dart';

class Apontamentos extends StatefulWidget {
  static String routeName = "/Apontamentos";
  const Apontamentos({Key? key}) : super(key: key);

  @override
  _ApontamentosState createState() => _ApontamentosState();
}

class _ApontamentosState extends State<Apontamentos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        ApontamentosBody(),
      ],
    ));
  }
}
