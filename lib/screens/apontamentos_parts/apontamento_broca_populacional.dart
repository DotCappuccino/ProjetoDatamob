import 'package:flutter/material.dart';
import 'package:projetodatamob/size.dart';

class ApontamentoBP extends StatefulWidget {
  const ApontamentoBP({Key? key}) : super(key: key);

  @override
  _ApontamentoBPState createState() => _ApontamentoBPState();
}

class _ApontamentoBPState extends State<ApontamentoBP> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.only(top: 120)),
          Padding(padding: EdgeInsets.all(5)),
          Row(
            children: [
              Container(
                width: getProportionateScreenWidth(175),
                height: getProportionateScreenHeight(50),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Nro. Lev',
                  ),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(5)),
          Row(
            children: [
              Container(
                width: getProportionateScreenWidth(350),
                height: getProportionateScreenHeight(50),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Pequenas',
                  ),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(5)),
          Row(
            children: [
              Container(
                width: getProportionateScreenWidth(350),
                height: getProportionateScreenHeight(50),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Aptas',
                  ),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(5)),
          Row(
            children: [
              Container(
                width: getProportionateScreenWidth(350),
                height: getProportionateScreenHeight(50),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Crisalidas',
                  ),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(5)),
          Row(
            children: [
              Container(
                width: getProportionateScreenWidth(350),
                height: getProportionateScreenHeight(50),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Massas',
                  ),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(5)),
          Row(
            children: [
              Container(
                width: getProportionateScreenWidth(350),
                height: getProportionateScreenHeight(50),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Outros parasitadas',
                  ),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(5)),
          Row(
            children: [
              Container(
                width: getProportionateScreenWidth(350),
                height: getProportionateScreenHeight(50),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'QTD. Colaboradores',
                  ),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(5)),
          Row(
            children: [
              Container(
                width: getProportionateScreenWidth(350),
                height: getProportionateScreenHeight(50),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Tempo/Pessoa',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
