import 'package:flutter/material.dart';
import 'package:projetodatamob/screens/apontamentos_parts/apontamento_broca_populacional.dart';
import 'package:projetodatamob/screens/apontamentos_parts/apontamentos_body.dart';
import 'package:projetodatamob/screens/apontamentos_parts/maps.dart';
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
      appBar: new AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Apontamentos.routeName);
            },
            icon: Icon(Icons.add_circle_outline_sharp),
          ),
          Text('Adicionar Novo'),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.camera_alt),
            onPressed: () {},
            heroTag: null,
          ),
          SizedBox(
            height: 10,
          ),
          Maps(),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      content: Text('Apontamento salvo com sucesso!!'));
                },
              );
            },
            child: const Icon(Icons.check),
            backgroundColor: Colors.green,
          ),
        ],
      ),
      body: Stack(
        children: [
          ApontamentosBody(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(top: 230)),
              Text('Teste')
            ],
          ),
          ApontamentoBP(),
        ],
      ),
    );
  }
}
