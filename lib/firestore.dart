import 'package:cloud_firestore/cloud_firestore.dart';
import 'generalfunctions.dart';

void addLogin(FirebaseFirestore dataBase, String nome, String senha) async {
  if (isEmpty(nome) || isEmpty(senha)) {
    print("Nome ou senha vazio, favor corrigir antes de proceder!!");
  } else {
    CollectionReference aptUsuariosCol =
        dataBase.collection("APT_USUARIOS_COL");

    aptUsuariosCol.add(
      {"nome": nome, "senha": senha},
    ).then((value) => print("Processado com sucesso!!"));
  }
}

Future<bool> validaLogin(
    FirebaseFirestore dataBase, String nome, String senha) async {
  String validaNome = '';
  String validaSenha = '';
  bool retorno = false;

  if (isEmpty(nome) || isEmpty(senha)) {
    print("Nome ou senha vazio, favor corrigir antes de proceder!!");
    retorno = false;
  }
//Tratativa para colocar o user em lowerCase
  nome = nome.toLowerCase();
  CollectionReference aptUsuariosCol = dataBase.collection("APT_USUARIOS_COL");
  await aptUsuariosCol.get().then((QuerySnapshot rs) {
    rs.docs.forEach((documento) {
      validaNome = '${documento['nom_usuario']}';
      validaSenha = '${documento['sen_usuario']}';
      if (validaNome == nome && validaSenha == senha) {
        print('Usuario e Senha encontrados, permitir acesso!');
        retorno = true;
      }
    });
  });
  if (retorno != true) {
    print('Usuario e Senha não encontrados!');
  }
  return retorno;
}

Future<List> menuExpansionMap(
    FirebaseFirestore dataBase, String nameUser) async {
  String codUsuario = '';
  var mapeamento = [{}];

  CollectionReference aptUsuariosCol = dataBase.collection("APT_USUARIOS_COL");
  await aptUsuariosCol
      .where("nom_usuario", isEqualTo: "$nameUser")
      .get()
      .then((QuerySnapshot rs) {
    rs.docs.forEach((documento) {
      codUsuario = documento['cod_usuario_col'];
    });
  });

  CollectionReference aptUsuariosColModulos =
      dataBase.collection("APT_USUARIOS_COL_MODULOS");
  await aptUsuariosColModulos
      .where("cod_usuario_col", isEqualTo: "$codUsuario")
      .get()
      .then((QuerySnapshot rs) {
    rs.docs.forEach((documento) {
      mapeamento = [
        {'': '${documento['nom_usuario']}'},
      ];
    });
  });

  return mapeamento;
}
