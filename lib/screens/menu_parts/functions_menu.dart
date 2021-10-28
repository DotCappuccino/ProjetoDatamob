// ignore: non_constant_identifier_names
bool CheckMenus(String nomeUsuario, String menuValidar) {
  String menuAcesso = 'Entomologia';

  if (menuValidar == 'Entomologia' && menuAcesso == 'Entomologia') return true;

  menuAcesso = 'Auditoria';
  if (menuValidar == 'Auditoria' && menuAcesso == 'Auditoria') return true;

  return false;
}
