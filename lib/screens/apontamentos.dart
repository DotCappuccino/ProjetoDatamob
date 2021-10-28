import 'package:flutter/material.dart';
import 'package:projetodatamob/screens/apontamentos_parts/apontamentos_body.dart';
import 'package:projetodatamob/size.dart';

class Apontamentos extends StatefulWidget {
  static String routeName = "/Apontamentos";
  const Apontamentos({Key? key}) : super(key: key);

  @override
  _ApontamentosState createState() => _ApontamentosState();
}

class _ApontamentosState extends State<Apontamentos> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        //appBar: AppBar(
        //title: Container(
        //  child: const Icon(Icons.arrow_back),
        //),
        //Text('Apontamentos'),
        //),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.check),
          backgroundColor: Colors.green,
        ),
        body: Stack(
          children: [
            ApontamentosBody(),
          ],
        ));
  }
}
