import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'generalfunctions.dart';

void addLogin(FirebaseFirestore dataBase, String nome, String senha) async {
  if (isEmpty(nome) || isEmpty(senha)) {
    print("Nome ou senha vazio, favor corrigir antes de proceder!!");
  } else {
    CollectionReference login = dataBase.collection("login");

    login.add(
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
  CollectionReference login = dataBase.collection("login");
  await login.get().then((QuerySnapshot rs) {
    rs.docs.forEach((documento) {
      validaNome = '${documento['nome']}';
      validaSenha = '${documento['senha']}';
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
