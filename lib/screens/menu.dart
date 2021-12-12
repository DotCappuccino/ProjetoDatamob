import 'package:flutter/material.dart';
import 'package:projetodatamob/firestore.dart';
import 'package:projetodatamob/screens/apontamentos.dart';
import 'package:projetodatamob/screens/login.dart';
import 'package:projetodatamob/size.dart';

// ignore: must_be_immutable
class Menu extends StatefulWidget {
  static String routeName = "/Menu";
  String nameuser;
  Menu({Key? key, required this.nameuser}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late String name = widget.nameuser;

  late List<Map<String, String>> cardList = [];

  late List<Map<String, String>> menu = [];

  late List<Map<String, String>> modulo = [];

  @override
  Widget build(BuildContext context) {
    int tamModulo = 0;

    // ignore_for_filemenu = menuListMap() as List<Map<String, String>>;
    SizeConfig().init(context);
    return Scaffold(
      drawer: Drawer(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Divider(),
            ListTile(
              leading: Icon(Icons.api_sharp),
              title: Text('Menus'),
            ),
            Expanded(
              child: FutureBuilder(
                future: menuListMap(name),
                builder: (ctx, snapshot) {
                  if (snapshot.data == null && menu.length == 0) {
                    print("Ignorar snapshot(Menu)");
                  } else {
                    menu = snapshot.data as List<Map<String, String>>;
                  }
                  return FutureBuilder(
                      future: moduloListMap(name),
                      builder: (ctx, snapshot) {
                        if (snapshot.data == null && menu.length == 0) {
                          print("Ignorar snapshot(Modulo)");
                        } else {
                          modulo = snapshot.data as List<Map<String, String>>;
                        }
                        int tamMenu = menu
                            .where((element) =>
                                element["flg_modulo"]
                                    .toString()
                                    .toLowerCase() ==
                                "true")
                            .toList()
                            .length;
                        return Column(
                          children: [
                            Expanded(
                              //height: 60 * tamMenu as double, //440,
                              child: ListView.builder(
                                itemCount: tamMenu,
                                itemBuilder: (BuildContext context, int i) {
                                  var auxMenuExpansion = menu
                                      .where((element) =>
                                          element["flg_modulo"]
                                              .toString()
                                              .toLowerCase() ==
                                          "true")
                                      .toList();

                                  var auxMenuExpansionInfo =
                                      auxMenuExpansion[i];
                                  var listModulo = modulo
                                      .where((element) =>
                                          element["cod_menu"].toString() ==
                                          auxMenuExpansionInfo["cod_menu"]
                                              .toString())
                                      .toList();
                                  tamModulo = listModulo.length;
                                  return ExpansionTile(
                                    title: Text(
                                      auxMenuExpansionInfo["des_menu"]
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    children: <Widget>[
                                      Container(
                                        height: 50 * tamModulo as double,
                                        child: ListView.builder(
                                          itemCount: tamModulo,
                                          itemBuilder:
                                              ((BuildContext context, int x) {
                                            var auxModulo = listModulo[x];
                                            return ListTile(
                                                title: Text(
                                                  auxModulo["des_modulo"]
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                onTap: () =>
                                                    Navigator.pushNamed(
                                                        context,
                                                        Apontamentos
                                                            .routeName));
                                          }),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            //Divider(),
                          ],
                        );
                      });
                },
              ),
            ),
            // Divider(),
            // ListTile(
            //     leading: Icon(Icons.settings),
            //     title: Text('Configurações'),
            //     onTap: () => showDialog(
            //           context: context,
            //           builder: (context) {
            //             return AlertDialog(content: Text('$menu'));
            //           },
            //         ) //Navigator.pushNamed(context, Login.routeName),
            //     ),
            Divider(),
            ListTile(
              title: Text('Exit'),
              leading: Icon(Icons.exit_to_app),
              onTap: () => Navigator.pushNamed(context, Login.routeName),
            ),
          ],
        ),
      ),
      appBar: new AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(Icons.align_horizontal_left_rounded),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: Text(
              "+ 10 Ultimos Apontamentos",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: ListView.builder(
                  padding: EdgeInsets.only(right: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: ((BuildContext context, int x) {
                    return Container(
                      width: 200,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      alignment: Alignment.center,
                      child: ListTile(
                        title: Text(
                          "Apontamento ${x + 1}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () => Navigator.pushNamed(
                            context, Apontamentos.routeName),
                      ),
                    );
                  }),
                ),
              ),

              // Container(
              //   width: 200,
              //   height: 60,
              //   //color: Colors.red,
              //   decoration:
              //       BoxDecoration(border: Border.all(color: Colors.black)),
              //   alignment: Alignment.center,
              //   child: ListTile(
              //     title: Text(
              //       "Apontamento x",
              //       textAlign: TextAlign.center,
              //       style: TextStyle(
              //         fontSize: 18.0,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     onTap: () =>
              //         Navigator.pushNamed(context, Apontamentos.routeName),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
