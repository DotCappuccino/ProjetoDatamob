import 'package:flutter/material.dart';
import 'package:projetodatamob/size.dart';

class ApontamentosBody extends StatefulWidget {
  const ApontamentosBody({Key? key}) : super(key: key);

  @override
  _ApontamentosBodyState createState() => _ApontamentosBodyState();
}

class _ApontamentosBodyState extends State<ApontamentosBody> {
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    bool isChecked2 = false;
    return Center(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: getProportionateScreenWidth(350),
                //height: 100,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Seção',
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: getProportionateScreenWidth(175),
                //height: 100,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Quadra',
                  ),
                ),
              ),
              Container(
                width: getProportionateScreenWidth(175),
                //height: 100,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Talho',
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: getProportionateScreenWidth(300),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Nro. Lev',
                  ),
                ),
              ),
              Checkbox(
                checkColor: Colors.white,
                //fillColor: MaterialStateProperty.resolveWith(Colors.black),
                value: isChecked,
                onChanged: (bool? value) {
                  setState(
                    () {
                      isChecked = value!;
                    },
                  );
                },
              ),
              Checkbox(
                checkColor: Colors.white,
                //fillColor: MaterialStateProperty.resolveWith(Colors.black),
                value: isChecked2,
                onChanged: (bool? value) {
                  setState(
                    () {
                      isChecked2 = value!;
                    },
                  );
                },
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: getProportionateScreenWidth(350),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Pequenas',
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: getProportionateScreenWidth(350),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Aptas',
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: getProportionateScreenWidth(350),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Crisalidas',
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: getProportionateScreenWidth(350),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Massas',
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: getProportionateScreenWidth(350),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Outros Parasitas',
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: getProportionateScreenWidth(350),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Qtd. Colaboradores',
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: getProportionateScreenWidth(350),
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
