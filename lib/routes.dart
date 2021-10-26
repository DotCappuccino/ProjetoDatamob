import 'package:flutter/widgets.dart';
import 'package:projetodatamob/screens/login.dart';
import 'package:projetodatamob/screens/home.dart';
import 'package:projetodatamob/screens/menu.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  Login.routeName: (context) => Login(),
  Home.routeName: (context) => Home(),
  Menu.routeName: (context) => Menu(),
};
