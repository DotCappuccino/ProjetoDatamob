import 'package:flutter/widgets.dart';
//import 'package:projetodatamob/screens/apontamentos_parts/maps.dart';
import 'package:projetodatamob/screens/apontamentos.dart';
import 'package:projetodatamob/screens/login.dart';
import 'package:projetodatamob/screens/menu.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  Login.routeName: (context) => Login(),
  Menu.routeName: (context) => Menu(),
  Apontamentos.routeName: (context) => Apontamentos(),
  //Maps.routeName: (context) => Maps(),
};
