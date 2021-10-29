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
    return Center(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.all(5)),
          Row(
            children: [
              Container(
                width: getProportionateScreenWidth(350),
                height: getProportionateScreenHeight(50),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Seção',
                  ),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(5)),
          Row(
            children: [
              Container(
                width: getProportionateScreenWidth(175),
                height: getProportionateScreenHeight(50),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Quadra',
                  ),
                ),
              ),
              Container(
                width: getProportionateScreenWidth(175),
                height: getProportionateScreenHeight(50),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Talho',
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
