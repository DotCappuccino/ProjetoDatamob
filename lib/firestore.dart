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

Future<List<Map<String, String>>> moduloListMap(String user) async {
  FirebaseFirestore dataBase = FirebaseFirestore.instance;
  CollectionReference aptUsuariosCol = dataBase.collection("APT_USUARIOS_COL");
  CollectionReference aptUsuariosColModulos =
      dataBase.collection("APT_USUARIOS_COL_MODULOS");
  CollectionReference aptModulos = dataBase.collection("APT_MODULOS");

  var auxAptUsuariosCol;
  var stringAptUsuariosColModulos = '';
  List<String> auxAptUsuariosColModulos;
  List<Map<String, String>> mapeamento = [{}];

  await aptUsuariosCol
      .where("nom_usuario", isEqualTo: user)
      .get()
      .then((QuerySnapshot rs) {
    rs.docs.forEach((getAptUsuariosCol) {
      auxAptUsuariosCol = (getAptUsuariosCol['cod_usuario_col'].toString());
    });
  });
  //print("auxAptUsuariosCol > $auxAptUsuariosCol");

  await aptUsuariosColModulos
      .where("cod_usuario_col", isEqualTo: auxAptUsuariosCol)
      .get()
      .then((QuerySnapshot rs) {
    rs.docs.forEach((getAptUsuariosColModulos) {
      if (getAptUsuariosColModulos['cod_modulo'] != null ||
          getAptUsuariosColModulos['cod_modulo'] != '') {
        stringAptUsuariosColModulos +=
            "${getAptUsuariosColModulos['cod_modulo']},";
      }
    });
  });

  stringAptUsuariosColModulos = stringAptUsuariosColModulos.substring(
      0, stringAptUsuariosColModulos.length - 1);

  auxAptUsuariosColModulos = stringAptUsuariosColModulos.split(",").toList();

  //print("auxAptUsuariosColModulos(List) > $auxAptUsuariosColModulos");

  await aptModulos.get().then(
    (QuerySnapshot rs) {
      rs.docs.forEach((getAptModulos) {
        for (var i = 0; i < auxAptUsuariosColModulos.length; i++) {
          if (getAptModulos["cod_modulo"].toString() ==
              auxAptUsuariosColModulos[i]) {
            mapeamento += [
              {
                "cod_menu": getAptModulos["cod_menu"].toString(),
                "cod_modulo": getAptModulos["cod_modulo"].toString(),
                "des_modulo": getAptModulos["des_modulo"].toString(),
              }
            ];
          }
        }
      });
    },
  );
  //print(mapeamento);
  return mapeamento;
}

Future<List<Map<String, String>>> menuListMap(String user) async {
  FirebaseFirestore dataBase = FirebaseFirestore.instance;
  CollectionReference aptMenus = dataBase.collection("APT_MENUS");
  List<Map<String, String>> mapeamento = [{}];

  await aptMenus.orderBy("nro_ordem").get().then(
    (querySnap) {
      querySnap.docs.forEach((document) {
        var aux = document.data() as Map;

        mapeamento += [
          {
            "cod_menu": aux["cod_menu"],
            "des_menu": aux["des_menu"],
            "flg_modulo": aux["flg_modulo"],
            "nro_ordem": aux["nro_ordem"],
          }
        ];
      });
    },
  );
  return mapeamento;
}

Future<List<String>> getSecaoApontamento(FirebaseFirestore dataBase) async {
  List<String> listSecao = [];
  CollectionReference aptFazendas = dataBase.collection("APT_FAZENDAS");

  await aptFazendas.get().then(
    (querySnap) {
      querySnap.docs.forEach((document) {
        var aux = document.data() as Map;
        listSecao += [aux["des_fazenda"]];
      });
    },
  );
  return listSecao;
}

Future<List<String>> getQuadraApontamento(
    FirebaseFirestore dataBase, selectSecao) async {
  List<String> listQuadra = [];

  CollectionReference aptFazendas = dataBase.collection("APT_FAZENDAS");
  CollectionReference aptTalhoes = dataBase.collection("APT_TALHOES");

  String codFazenda = '';

  await aptFazendas
      .where("des_fazenda", isEqualTo: selectSecao.toString())
      .get()
      .then((querySnap) {
    querySnap.docs.forEach((document) {
      var auxFazenda = document.data() as Map;
      codFazenda = auxFazenda["cod_fazenda"];
    });
  });

  //if (codFazenda.isEmpty) throw Exception("Erro, codFazenda não pode ser null");

  await aptTalhoes
      .where("cod_fazenda", isEqualTo: codFazenda)
      .get()
      .then((querySnap) {
    querySnap.docs.forEach((document) {
      var auxQuadra = document.data() as Map;
      listQuadra += [auxQuadra["cod_talhao_01"]];
    });
  });

  return listQuadra;
}

Future<List<String>> getTalhoApontamento(
    FirebaseFirestore dataBase, String selectSecao, String codQuadra) async {
  List<String> listTalho = ['0'];

  CollectionReference aptFazendas = dataBase.collection("APT_FAZENDAS");
  CollectionReference aptTalhoes = dataBase.collection("APT_TALHOES");

  String codFazenda = '';

  await aptFazendas
      .where("des_fazenda", isEqualTo: selectSecao.toString())
      .get()
      .then((querySnap) {
    querySnap.docs.forEach((document) {
      var auxFazenda = document.data() as Map;
      codFazenda = auxFazenda["cod_fazenda"];
    });
  });

  //if (codFazenda.isEmpty) throw Exception("Erro, codFazenda não pode ser null");
  //if (codFazenda.isEmpty) throw Exception("Erro, codFazenda não pode ser null");

  await aptTalhoes
      .where("cod_fazenda", isEqualTo: codFazenda)
      .where("cod_talhao_01", isEqualTo: codQuadra)
      .get()
      .then((querySnap) {
    querySnap.docs.forEach((document) {
      var auxTalho2 = document.data() as Map;
      listTalho += [auxTalho2["cod_talhao_02"]];
    });
  });

  return listTalho;
}
