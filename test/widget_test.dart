import 'package:projetodatamob/screens/apontamentos_parts/maps.dart';
import 'package:projetodatamob/screens/login_parts/functions_login.dart';

void main() {
  print(AccessUser('Teste', '1234'));
  print(AccessUser('', ''));
  print(AccessUser('152', '152'));
  print(ExistUser(''));
  //print(ExistUser(null)); //Não permite null
}
