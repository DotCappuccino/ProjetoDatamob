// ignore: non_constant_identifier_names
bool ExistUser(String nomeusuario) {
  if (nomeusuario == 'Teste') {
    return true;
  } else {
    return false;
  }
}

// ignore: non_constant_identifier_names
bool AccessUser(String nomeusuario, String senhausuario) {
  if (nomeusuario == 'Teste' && senhausuario == '1234') {
    return true;
  } else {
    return false;
  }
}
