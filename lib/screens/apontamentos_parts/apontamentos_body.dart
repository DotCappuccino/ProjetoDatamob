import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projetodatamob/firestore.dart';
import 'package:projetodatamob/size.dart';

class ApontamentosBody extends StatefulWidget {
  const ApontamentosBody({Key? key}) : super(key: key);

  @override
  _ApontamentosBodyState createState() => _ApontamentosBodyState();
}

class _ApontamentosBodyState extends State<ApontamentosBody> {
  FirebaseFirestore dataBase = FirebaseFirestore.instance;
  List<String> listSecao = [];
  List<String> listQuadra = [];
  List<String> listTalho = [];

  var selectSecao = "1";
  var selectQuadra = "1";
  var selectTalho = "1";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(padding: EdgeInsets.all(5)),
        Row(
          children: [
            Container(
              width: getProportionateScreenWidth(350),
              height: getProportionateScreenHeight(50),
              child: FutureBuilder(
                future: getSecaoApontamento(dataBase),
                builder: (ctx, snapshot) {
                  if (snapshot.data == null) {
                    print("Ignorar snapshot(Seção)");
                  } else {
                    listSecao = snapshot.data as List<String>;
                  }
                  return Autocomplete(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<String>.empty();
                      }
                      return listSecao.where(
                        (String option) {
                          return option
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase());
                        },
                      );
                    },
                    onSelected: (String selection) {
                      selectSecao = selection;
                      print('Retonou(Seção) - $selection');
                    },
                    fieldViewBuilder:
                        (context, controller, focusNode, onEditingComplete) {
                      return TextField(
                          controller: controller,
                          focusNode: focusNode,
                          onEditingComplete: onEditingComplete,
                          decoration: InputDecoration(
                            labelText: 'Seção',
                          ),
                          keyboardType: TextInputType.text);
                    },
                  );
                },
              ),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.all(5)),
        Row(
          children: [
            Container(
              //Quadra
              width: getProportionateScreenWidth(175),
              height: getProportionateScreenHeight(50),
              child: FutureBuilder(
                future: getQuadraApontamento(dataBase, selectSecao),
                builder: (ctx, snapshot) {
                  if (snapshot.data == null) {
                    print("Ignorar snapshot(Quadra)");
                  } else {
                    listQuadra = snapshot.data as List<String>;
                  }
                  return Autocomplete(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<String>.empty();
                      }
                      return listQuadra.where(
                        (String option) {
                          return option
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase());
                        },
                      );
                    },
                    onSelected: (String selection) {
                      selectQuadra = selection;
                      print('Retonou(Quadra) - $selection');
                    },
                    fieldViewBuilder:
                        (context, controller, focusNode, onEditingComplete) {
                      return TextField(
                          controller: controller,
                          focusNode: focusNode,
                          onEditingComplete: onEditingComplete,
                          decoration: InputDecoration(
                            labelText: 'Quadra',
                          ),
                          keyboardType: TextInputType.text);
                    },
                  );
                },
              ),
            ),
            Container(
              //Talho
              width: getProportionateScreenWidth(175),
              height: getProportionateScreenHeight(50),
              child: FutureBuilder(
                future:
                    getTalhoApontamento(dataBase, selectSecao, selectQuadra),
                builder: (ctx, snapshot) {
                  if (snapshot.data == null || snapshot.data == '') {
                    print("Ignorar snapshot(Talho)");
                  } else {
                    listTalho = snapshot.data as List<String>;
                  }
                  return Autocomplete(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<String>.empty();
                      }
                      return listTalho.where(
                        (String option) {
                          return option
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase());
                        },
                      );
                    },
                    onSelected: (String selection) {
                      selectTalho = selection;
                      print('Retonou(Talho) - $selection');
                    },
                    fieldViewBuilder:
                        (context, controller, focusNode, onEditingComplete) {
                      return TextField(
                          controller: controller,
                          focusNode: focusNode,
                          onEditingComplete: onEditingComplete,
                          decoration: InputDecoration(
                            labelText: 'Talho',
                          ),
                          keyboardType: TextInputType.text);
                    },
                  );
                },
              ),
            ),
          ],
        ),
        Divider(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
      ],
    );
  }
}
