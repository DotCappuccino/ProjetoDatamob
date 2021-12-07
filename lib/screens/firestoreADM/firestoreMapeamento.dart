import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

/*
05/12/2021 - mapearFireStore (Está função é responsavel por estruturar o firebase)
-Validar se a collection existes
-Gerar Collection
-Popular documentos (Collection -> Documentos[SubDivisão])
*/
void mapearFireStore() {
  Firebase.initializeApp();
  FirebaseFirestore dataBase = FirebaseFirestore.instance;
  print("Inicio aptUnidadesCollection !");
  aptUnidadesCollection(dataBase);
  print("Inicio aptColaboradoresCollection !");
  aptColaboradoresCollection(dataBase);
  print("Inicio aptFazendasCollection !");
  aptFazendasCollection(dataBase);
  print("Inicio aptTalhoesCollection !");
  aptTalhoesCollection(dataBase);
  print("Inicio aptMenusCollection !");
  aptMenusCollection(dataBase);
  print("Inicio aptModulosCollection !");
  aptModulosCollection(dataBase);
  print("Inicio aptPragasCollection !");
  aptPragasCollection(dataBase);
  print("Inicio aptModulosPragasCollection !");
  aptModulosPragasCollection(dataBase);
  print("Inicio aptItensCollection !");
  aptItensCollection(dataBase);
  print("Inicio aptItensPragasCollection !");
  aptItensPragasCollection(dataBase);
  print("Inicio aptValoresItensPragasCollection !");
  aptValoresItensPragasCollection(dataBase);
  print("Inicio aptUsuariosColCollection !");
  aptUsuariosColCollection(dataBase);
  print("Inicio aptUsuariosColModulosCollection !");
  aptUsuariosColModulosCollection(dataBase);
  print("Inicio aptAmostrasCollection !");
  aptAmostrasCollection(dataBase);
  print("Inicio aptDadosAmostrasCollection !");
  aptDadosAmostrasCollection(dataBase);
  print("Inicio aptAmostrasColaboradoresCollection !");
  aptAmostrasColaboradoresCollection(dataBase);
}

void aptUnidadesCollection(FirebaseFirestore dataBase) async {
  int size = 0;

  /*aptUnidades: Unidades (Fazendas, Empresas, Etc)*/
  CollectionReference aptUnidades = dataBase.collection("APT_UNIDADES");
  await aptUnidades.get().then((querySnapshot) => {size = querySnapshot.size});
  // ignore: unnecessary_null_comparison
  if (size <= 0 || size == null) {
    aptUnidades.doc().set({"cod_unidade": "1", "des_unidade": "DataMob"}).then(
        (value) => print("aptUnidades criado com sucesso!!"));
  } else {
    print("aptUnidades | Quantida = $size | Já existe !!");
  }
}

void aptColaboradoresCollection(FirebaseFirestore dataBase) async {
  int size = 0;

  /*aptColaboradores: Vincula um colaborador com uma Unidade (aptUnidades)*/
  CollectionReference aptColaboradores =
      dataBase.collection("APT_COLABORADORES");
  await aptColaboradores
      .get()
      .then((querySnapshot) => {size = querySnapshot.size});
  // ignore: unnecessary_null_comparison
  if (size <= 0 || size == null) {
    aptColaboradores.doc().set({
      "cod_colaborador": "1",
      "nom_colaborador ": "Ricardo",
      "cod_unidade": "1"
    }).then((value) => print("aptColaboradores criado com sucesso!!"));
    aptColaboradores.doc().set({
      "cod_colaborador": "2",
      "nom_colaborador ": "DataMob",
      "cod_unidade": "1"
    }).then((value) => print("aptColaboradores criado com sucesso!!"));
    aptColaboradores.doc().set({
      "cod_colaborador": "3",
      "nom_colaborador ": "Maria Da Silva",
      "cod_unidade": "1"
    }).then((value) => print("aptColaboradores criado com sucesso!!"));
  } else {
    print("aptColaboradores | Quantida = $size | Já existe !!");
  }
}

void aptFazendasCollection(FirebaseFirestore dataBase) async {
  int size = 0;

  /*aptFazendas: Dentro da unidade existe varias fazendas, a mesma vincula a unidade com a fazenda*/
  CollectionReference aptFazendas = dataBase.collection("APT_FAZENDAS");
  await aptFazendas.get().then((querySnapshot) => {size = querySnapshot.size});
  // ignore: unnecessary_null_comparison
  if (size <= 0 || size == null) {
    aptFazendas.doc().set({
      "cod_fazenda": "1",
      "des_fazenda": "Fazenda Teste DataMob",
      "cod_unidade": "1"
    }).then((value) => print("aptFazendas criado com sucesso!!"));
    aptFazendas.doc().set({
      "cod_fazenda": "2",
      "des_fazenda": "Fazenda Santo Antônio",
      "cod_unidade": "1"
    }).then((value) => print("aptFazendas criado com sucesso!!"));
  } else {
    print("aptFazendas | Quantida = $size | Já existe !!");
  }
}

void aptTalhoesCollection(FirebaseFirestore dataBase) async {
  int size = 0;
  /*aptTalhoes:  Dentro da fazenda, existe mais de um talhão, talhão é uma quebra da fazenda, por onde os caminhões passam colhendo*/
  CollectionReference aptTalhoes = dataBase.collection("APT_TALHOES");
  await aptTalhoes.get().then((querySnapshot) => {size = querySnapshot.size});
  // ignore: unnecessary_null_comparison
  if (size <= 0 || size == null) {
    /*Fazenda: 1*/
    aptTalhoes.doc().set({
      "cod_talhao_01": "1",
      "cod_talhao_02": "1",
      "cod_unidade": "1",
      "cod_fazenda": "1"
    }).then((value) => print("aptTalhoes criado com sucesso!!"));
    aptTalhoes.doc().set({
      "cod_talhao_01": "2",
      "cod_talhao_02": "2",
      "cod_unidade": "1",
      "cod_fazenda": "1"
    }).then((value) => print("aptTalhoes criado com sucesso!!"));
    aptTalhoes.doc().set({
      "cod_talhao_01": "2",
      "cod_talhao_02": "3",
      "cod_unidade": "1",
      "cod_fazenda": "1"
    }).then((value) => print("aptTalhoes criado com sucesso!!"));
    aptTalhoes.doc().set({
      "cod_talhao_01": "3",
      "cod_talhao_02": "4",
      "cod_unidade": "1",
      "cod_fazenda": "1"
    }).then((value) => print("aptTalhoes criado com sucesso!!"));
    /*Fazenda: 2*/
    aptTalhoes.doc().set({
      "cod_talhao_01": "1",
      "cod_talhao_02": "1",
      "cod_unidade": "1",
      "cod_fazenda": "2"
    }).then((value) => print("aptTalhoes criado com sucesso!!"));
    aptTalhoes.doc().set({
      "cod_talhao_01": "2",
      "cod_talhao_02": "2",
      "cod_unidade": "1",
      "cod_fazenda": "2"
    }).then((value) => print("aptTalhoes criado com sucesso!!"));
    aptTalhoes.doc().set({
      "cod_talhao_01": "2",
      "cod_talhao_02": "3",
      "cod_unidade": "1",
      "cod_fazenda": "2"
    }).then((value) => print("aptTalhoes criado com sucesso!!"));
    aptTalhoes.doc().set({
      "cod_talhao_01": "3",
      "cod_talhao_02": "4",
      "cod_unidade": "1",
      "cod_fazenda": "2"
    }).then((value) => print("aptTalhoes criado com sucesso!!"));
  } else {
    print("aptTalhoes | Quantida = $size | Já existe !!");
  }
}

void aptMenusCollection(FirebaseFirestore dataBase) async {
  int size = 0;
  CollectionReference aptMenus = dataBase.collection("APT_MENUS");
  await aptMenus.get().then((querySnapshot) => {size = querySnapshot.size});
  // ignore: unnecessary_null_comparison
  if (size <= 0 || size == null) {
    aptMenus.doc().set({
      "cod_menu": "1",
      "des_menu": "Entomologia",
      "flg_modulo": "true",
      "nro_ordem": "1"
    }).then((value) => print("aptMenus (Entomologia) criado com sucesso!!"));
    aptMenus.doc().set({
      "cod_menu": "2",
      "des_menu": "Auditoria",
      "flg_modulo": "true",
      "nro_ordem": "2"
    }).then((value) => print("aptMenus (Auditoria) criado com sucesso!!"));
    aptMenus.doc().set({
      "cod_menu": "3",
      "des_menu": "Unidades",
      "flg_modulo": "false",
      "nro_ordem": "3"
    }).then((value) => print("aptMenus (Unidades) criado com sucesso!!"));
    aptMenus.doc().set({
      "cod_menu": "4",
      "des_menu": "Fazendas",
      "flg_modulo": "false",
      "nro_ordem": "4"
    }).then((value) => print("aptMenus (Fazendas) criado com sucesso!!"));
    aptMenus.doc().set({
      "cod_menu": "5",
      "des_menu": "Talhões",
      "flg_modulo": "false",
      "nro_ordem": "5"
    }).then((value) => print("aptMenus (Talhões) criado com sucesso!!"));
    aptMenus.doc().set({
      "cod_menu": "6",
      "des_menu": "Usuarios",
      "flg_modulo": "false",
      "nro_ordem": "6"
    }).then((value) => print("aptMenus (Usuarios) criado com sucesso!!"));
    aptMenus.doc().set({
      "cod_menu": "7",
      "des_menu": "Menus",
      "flg_modulo": "false",
      "nro_ordem": "7"
    }).then((value) => print("aptMenus (Menus) criado com sucesso!!"));
  } else {
    print("aptMenus | Quantida = $size | Já existe !!");
  }
}

void aptModulosCollection(FirebaseFirestore dataBase) async {
  int size = 0;
/*aptModulos: Dentro do menu, existe modulos*/
  CollectionReference aptModulos = dataBase.collection("APT_MODULOS");
  await aptModulos.get().then((querySnapshot) => {size = querySnapshot.size});
  // ignore: unnecessary_null_comparison
  if (size <= 0 || size == null) {
    aptModulos.doc().set({
      "cod_modulo": "1",
      "des_modulo": "Pragas de Solo",
      "flg_gps": "true",
      "flg_mapa": "true",
      "flg_foto": "true",
      "cod_menu": "1",
      "nro_ordem": "1"
    }).then(
        (value) => print("aptModulos (Pragas de Solo) criado com sucesso!!"));
    aptModulos.doc().set({
      "cod_modulo": "1",
      "des_modulo": "Sphenophorus",
      "flg_gps": "true",
      "flg_mapa": "true",
      "flg_foto": "true",
      "cod_menu": "1",
      "nro_ordem": "2"
    }).then((value) => print("aptModulos (Sphenophorus) criado com sucesso!!"));
    aptModulos.doc().set({
      "cod_modulo": "1",
      "des_modulo": "Broca Gigante",
      "flg_gps": "true",
      "flg_mapa": "true",
      "flg_foto": "true",
      "cod_menu": "1",
      "nro_ordem": "3"
    }).then(
        (value) => print("aptModulos (Broca Gigante) criado com sucesso!!"));
    aptModulos.doc().set({
      "cod_modulo": "1",
      "des_modulo": "Perdas",
      "flg_gps": "true",
      "flg_mapa": "true",
      "flg_foto": "true",
      "cod_menu": "2",
      "nro_ordem": "1"
    }).then((value) => print("aptModulos (Perdas) criado com sucesso!!"));
  } else {
    print("aptModulos | Quantida = $size | Já existe !!");
  }
}

void aptPragasCollection(FirebaseFirestore dataBase) async {
  int size = 0;
  CollectionReference aptPragas = dataBase.collection("APT_PRAGAS");
  await aptPragas.get().then((querySnapshot) => {size = querySnapshot.size});
  // ignore: unnecessary_null_comparison
  if (size <= 0 || size == null) {
    aptPragas.doc().set({
      "cod_praga": "1",
      "des_praga": "Sphenophorus",
      "flg_apto_colaborador": "true",
      "flg_obri_colaborador": "true"
    }).then((value) =>
        print("aptPragas (Broca Populacional) criado com sucesso!!"));
    aptPragas.doc().set({
      "cod_praga": "2",
      "des_praga": "Broca Gigante",
      "flg_apto_colaborador": "true",
      "flg_obri_colaborador": "false"
    }).then((value) =>
        print("aptPragas (Broca Rev. Laboratorio) criado com sucesso!!"));
    aptPragas.doc().set({
      "cod_praga": "3",
      "des_praga": "Outras Pragas",
      "flg_apto_colaborador": "false",
      "flg_obri_colaborador": "false"
    }).then((value) =>
        print("aptPragas (Broca Rev. Laboratorio) criado com sucesso!!"));
    aptPragas.doc().set({
      "cod_praga": "4",
      "des_praga": "Perdas",
      "flg_apto_colaborador": "false",
      "flg_obri_colaborador": "false"
    }).then((value) =>
        print("aptPragas (Broca Rev. Laboratorio) criado com sucesso!!"));
  } else {
    print("aptPragas | Quantida = $size | Já existe !!");
  }
}

void aptModulosPragasCollection(FirebaseFirestore dataBase) async {
  int size = 0;
  CollectionReference aptModulosPragas =
      dataBase.collection("APT_MODULOS_PRAGAS");
  await aptModulosPragas
      .get()
      .then((querySnapshot) => {size = querySnapshot.size});
  // ignore: unnecessary_null_comparison
  if (size <= 0 || size == null) {
    aptModulosPragas.doc().set({
      "cod_modulo": "1",
      "cod_praga": "1",
      "nro_ordem": "1",
      "flg_praga_opcional": "false"
    }).then((value) => print("aptModulosPragas criado com sucesso!!"));
    aptModulosPragas.doc().set({
      "cod_modulo": "1",
      "cod_praga": "3",
      "nro_ordem": "2",
      "flg_praga_opcional": "false"
    }).then((value) => print("aptModulosPragas criado com sucesso!!"));
    aptModulosPragas.doc().set({
      "cod_modulo": "2",
      "cod_praga": "1",
      "nro_ordem": "1",
      "flg_praga_opcional": "false"
    }).then((value) => print("aptModulosPragas criado com sucesso!!"));
    aptModulosPragas.doc().set({
      "cod_modulo": "3",
      "cod_praga": "2",
      "nro_ordem": "1",
      "flg_praga_opcional": "false"
    }).then((value) => print("aptModulosPragas criado com sucesso!!"));
    aptModulosPragas.doc().set({
      "cod_modulo": "4",
      "cod_praga": "4",
      "nro_ordem": "1",
      "flg_praga_opcional": "false"
    }).then((value) => print("aptModulosPragas criado com sucesso!!"));
  } else {
    print("aptModulosPragas | Quantida = $size | Já existe !!");
  }
}

void aptItensCollection(FirebaseFirestore dataBase) async {
  int size = 0;
  CollectionReference aptItens = dataBase.collection("APT_ITENS");
  await aptItens.get().then((querySnapshot) => {size = querySnapshot.size});
  // ignore: unnecessary_null_comparison
  if (size <= 0 || size == null) {
    aptItens.doc().set({
      "cod_item": "1",
      "des_item": "Toco Total",
      "tip_dado": "false",
      "qtd_decimal": "0"
    }).then((value) => print("aptItens (Toco Total) criado com sucesso!!"));
    aptItens.doc().set({
      "cod_item": "2",
      "des_item": "Toco Danificado",
      "tip_dado": "false",
      "qtd_decimal": "0"
    }).then(
        (value) => print("aptItens (Toco Danificado) criado com sucesso!!"));
    aptItens.doc().set({
      "cod_item": "3",
      "des_item": "Larvas",
      "tip_dado": "false",
      "qtd_decimal": "0"
    }).then((value) => print("aptItens (Larvas) criado com sucesso!!"));
    aptItens.doc().set({
      "cod_item": "4",
      "des_item": "Pupas",
      "tip_dado": "false",
      "qtd_decimal": "0"
    }).then((value) => print("aptItens (Pupas) criado com sucesso!!"));
    aptItens.doc().set({
      "cod_item": "5",
      "des_item": "Adultos",
      "tip_dado": "false",
      "qtd_decimal": "0"
    }).then((value) => print("aptItens (Adultos) criado com sucesso!!"));
    aptItens.doc().set({
      "cod_item": "6",
      "des_item": "Hyponeuma Táutula",
      "tip_dado": "false",
      "qtd_decimal": "0"
    }).then(
        (value) => print("aptItens (Hyponeuma Táutula) criado com sucesso!!"));
    aptItens.doc().set({
      "cod_item": "7",
      "des_item": "Pão De Galinha",
      "tip_dado": "false",
      "qtd_decimal": "0"
    }).then((value) => print("aptItens (Pão De Galinha) criado com sucesso!!"));
    aptItens.doc().set({
      "cod_item": "8",
      "des_item": "Larva Arame",
      "tip_dado": "false",
      "qtd_decimal": "0"
    }).then((value) => print("aptItens (Larva Arame) criado com sucesso!!"));
    aptItens.doc().set({
      "cod_item": "9",
      "des_item": "Naopactus",
      "tip_dado": "false",
      "qtd_decimal": "0"
    }).then((value) => print("aptItens (Naopactus) criado com sucesso!!"));
    aptItens.doc().set({
      "cod_item": "10",
      "des_item": "Pérola Da Terra",
      "tip_dado": "false",
      "qtd_decimal": "0"
    }).then(
        (value) => print("aptItens (Pérola Da Terra) criado com sucesso!!"));
    aptItens.doc().set({
      "cod_item": "11",
      "des_item": "Percevejo Castanho",
      "tip_dado": "false",
      "qtd_decimal": "0"
    }).then(
        (value) => print("aptItens (Percevejo Castanho) criado com sucesso!!"));
    aptItens.doc().set({
      "cod_item": "12",
      "des_item": "Crisonelideo",
      "tip_dado": "false",
      "qtd_decimal": "0"
    }).then((value) => print("aptItens (Crisonelideo) criado com sucesso!!"));
    aptItens.doc().set({
      "cod_item": "13",
      "des_item": "Migdólus",
      "tip_dado": "false",
      "qtd_decimal": "0"
    }).then((value) => print("aptItens (Migdólus) criado com sucesso!!"));
    aptItens.doc().set({
      "cod_item": "14",
      "des_item": "Tipo De Colheita",
      "tip_dado": "false",
      "qtd_decimal": "0"
    }).then(
        (value) => print("aptItens (Tipo De Colheita) criado com sucesso!!"));
    aptItens.doc().set({
      "cod_item": "15",
      "des_item": "Toco Total (KG)",
      "tip_dado": "false",
      "qtd_decimal": "2"
    }).then((value) => print("aptItens (Toco Total KG) criado com sucesso!!"));
    aptItens.doc().set({
      "cod_item": "16",
      "des_item": "Cana Inteira (KG)",
      "tip_dado": "false",
      "qtd_decimal": "2"
    }).then(
        (value) => print("aptItens (Cana Inteira KG) criado com sucesso!!"));
    aptItens.doc().set({
      "cod_item": "17",
      "des_item": "Cana Ponta (KG)",
      "tip_dado": "false",
      "qtd_decimal": "2"
    }).then((value) => print("aptItens (Cana Ponta KG) criado com sucesso!!"));
    aptItens.doc().set({
      "cod_item": "18",
      "des_item": "Toletes (KG)",
      "tip_dado": "false",
      "qtd_decimal": "2"
    }).then((value) => print("aptItens (Toletes KG) criado com sucesso!!"));
    aptItens.doc().set({
      "cod_item": "19",
      "des_item": "Estilhaço (KG)",
      "tip_dado": "false",
      "qtd_decimal": "2"
    }).then((value) => print("aptItens (Estilhaço KG) criado com sucesso!!"));
    aptItens.doc().set({
      "cod_item": "20",
      "des_item": "Pedaço Fixo (KG)",
      "tip_dado": "false",
      "qtd_decimal": "2"
    }).then((value) => print("aptItens (Pedaço Fixo KG) criado com sucesso!!"));
    aptItens.doc().set({
      "cod_item": "21",
      "des_item": "Pedaço (KG)",
      "tip_dado": "false",
      "qtd_decimal": "2"
    }).then((value) => print("aptItens (Pedaço KG) criado com sucesso!!"));
  } else {
    print("aptItens | Quantida = $size | Já existe !!");
  }
}

void aptItensPragasCollection(FirebaseFirestore dataBase) async {
  int size = 0;
  CollectionReference aptItensPragas = dataBase.collection("APT_ITENS_PRAGAS");
  await aptItensPragas
      .get()
      .then((querySnapshot) => {size = querySnapshot.size});
  // ignore: unnecessary_null_comparison
  if (size <= 0 || size == null) {
    aptItensPragas.doc().set({
      "cod_praga": "1",
      "cod_item": "1",
      "flg_tipo": "L",
      "vlr_faixa_ini": "0.00",
      "vlr_faixa_fim": "100.00",
      "ord_exibicao": "1",
      "flg_codbarras": "false",
      "flg_mantervalor": "false",
      "flg_obrigatorio": "true",
      "flg_gps": "false"
    }).then((value) => print("aptItensPragas (1) criado com sucesso!!"));
    aptItensPragas.doc().set({
      "cod_praga": "1",
      "cod_item": "2",
      "flg_tipo": "L",
      "vlr_faixa_ini": "0.00",
      "vlr_faixa_fim": "100.00",
      "ord_exibicao": "2",
      "flg_codbarras": "false",
      "flg_mantervalor": "false",
      "flg_obrigatorio": "true",
      "flg_gps": "false"
    }).then((value) => print("aptItensPragas (2) criado com sucesso!!"));
    aptItensPragas.doc().set({
      "cod_praga": "1",
      "cod_item": "3",
      "flg_tipo": "L",
      "vlr_faixa_ini": "0.00",
      "vlr_faixa_fim": "100.00",
      "ord_exibicao": "3",
      "flg_codbarras": "false",
      "flg_mantervalor": "false",
      "flg_obrigatorio": "true",
      "flg_gps": "false"
    }).then((value) => print("aptItensPragas (3) criado com sucesso!!"));
    aptItensPragas.doc().set({
      "cod_praga": "2",
      "cod_item": "4",
      "flg_tipo": "L",
      "vlr_faixa_ini": "0.00",
      "vlr_faixa_fim": "100.00",
      "ord_exibicao": "1",
      "flg_codbarras": "false",
      "flg_mantervalor": "false",
      "flg_obrigatorio": "true",
      "flg_gps": "false"
    }).then((value) => print("aptItensPragas (4) criado com sucesso!!"));
    aptItensPragas.doc().set({
      "cod_praga": "2",
      "cod_item": "5",
      "flg_tipo": "L",
      "vlr_faixa_ini": "0.00",
      "vlr_faixa_fim": "100.00",
      "ord_exibicao": "2",
      "flg_codbarras": "false",
      "flg_mantervalor": "false",
      "flg_obrigatorio": "true",
      "flg_gps": "false"
    }).then((value) => print("aptItensPragas (5) criado com sucesso!!"));
    aptItensPragas.doc().set({
      "cod_praga": "2",
      "cod_item": "6",
      "flg_tipo": "L",
      "vlr_faixa_ini": "0.00",
      "vlr_faixa_fim": "100.00",
      "ord_exibicao": "3",
      "flg_codbarras": "false",
      "flg_mantervalor": "false",
      "flg_obrigatorio": "true",
      "flg_gps": "false"
    }).then((value) => print("aptItensPragas (6) criado com sucesso!!"));
    aptItensPragas.doc().set({
      "cod_praga": "4",
      "cod_item": "7",
      "flg_tipo": "T",
      "vlr_faixa_ini": "0",
      "vlr_faixa_fim": "0",
      "ord_exibicao": "1",
      "flg_codbarras": "false",
      "flg_mantervalor": "true",
      "flg_obrigatorio": "true",
      "flg_gps": "false"
    }).then((value) => print("aptItensPragas (7) criado com sucesso!!"));
  } else {
    print("aptItensPragas | Quantida = $size | Já existe !!");
  }
}

void aptValoresItensPragasCollection(FirebaseFirestore dataBase) async {
  int size = 0;
  CollectionReference aptValoresItensPragas =
      dataBase.collection("APT_VALORES_ITENS_PRAGAS");
  await aptValoresItensPragas
      .get()
      .then((querySnapshot) => {size = querySnapshot.size});
  // ignore: unnecessary_null_comparison
  if (size <= 0 || size == null) {
    aptValoresItensPragas.doc().set({
      "cod_valor": "1",
      "cod_praga": "4",
      "cod_item": "7",
      "des_valor": "Mecânica Crua"
    }).then((value) => print("aptValoresItensPragas (1) criado com sucesso!!"));
    aptValoresItensPragas.doc().set({
      "cod_valor": "2",
      "cod_praga": "4",
      "cod_item": "7",
      "des_valor": "Mecânica Queimada"
    }).then((value) => print("aptValoresItensPragas (2) criado com sucesso!!"));
    aptValoresItensPragas.doc().set({
      "cod_valor": "3",
      "cod_praga": "4",
      "cod_item": "7",
      "des_valor": "Manual Crua"
    }).then((value) => print("aptValoresItensPragas (3) criado com sucesso!!"));
    aptValoresItensPragas.doc().set({
      "cod_valor": "4",
      "cod_praga": "4",
      "cod_item": "7",
      "des_valor": "Manual Queimada"
    }).then((value) => print("aptValoresItensPragas (4) criado com sucesso!!"));
  } else {
    print("aptValoresItensPragas | Quantida = $size | Já existe !!");
  }
}

void aptUsuariosColCollection(FirebaseFirestore dataBase) async {
  int size = 0;
  CollectionReference aptUsuariosCol = dataBase.collection("APT_USUARIOS_COL");
  await aptUsuariosCol
      .get()
      .then((querySnapshot) => {size = querySnapshot.size});
  // ignore: unnecessary_null_comparison
  if (size <= 0 || size == null) {
    aptUsuariosCol.doc().set({
      "cod_usuario_col": "1",
      "nom_usuario": "ricardo",
      "sen_usuario": "1234",
      "cod_unidade": "1"
    }).then((value) => print("aptUsuariosCol (ricardo) criado com sucesso!!"));
    aptUsuariosCol.doc().set({
      "cod_usuario_col": "2",
      "nom_usuario": "samuel",
      "sen_usuario": "1234",
      "cod_unidade": "1"
    }).then((value) => print("aptUsuariosCol (samuel) criado com sucesso!!"));
    aptUsuariosCol.doc().set({
      "cod_usuario_col": "3",
      "nom_usuario": "datamob",
      "sen_usuario": "123456",
      "cod_unidade": "1"
    }).then((value) => print("aptUsuariosCol (datamob) criado com sucesso!!"));
  } else {
    print("aptUsuariosCol | Quantida = $size | Já existe !!");
  }
}

void aptUsuariosColModulosCollection(FirebaseFirestore dataBase) async {
  int size = 0;
  CollectionReference aptUsuariosColModulos =
      dataBase.collection("APT_USUARIOS_COL_MODULOS");
  await aptUsuariosColModulos
      .get()
      .then((querySnapshot) => {size = querySnapshot.size});
  // ignore: unnecessary_null_comparison
  if (size <= 0 || size == null) {
    aptUsuariosColModulos.doc().set({
      "cod_modulo": "1",
      "cod_usuario_col": "1",
    }).then((value) => print("aptUsuariosColModulos criado com sucesso!!"));
    aptUsuariosColModulos.doc().set({
      "cod_modulo": "2",
      "cod_usuario_col": "1",
    }).then((value) => print("aptUsuariosColModulos criado com sucesso!!"));
    aptUsuariosColModulos.doc().set({
      "cod_modulo": "3",
      "cod_usuario_col": "1",
    }).then((value) => print("aptUsuariosColModulos criado com sucesso!!"));
    aptUsuariosColModulos.doc().set({
      "cod_modulo": "4",
      "cod_usuario_col": "1",
    }).then((value) => print("aptUsuariosColModulos criado com sucesso!!"));
    aptUsuariosColModulos.doc().set({
      "cod_modulo": "1",
      "cod_usuario_col": "2",
    }).then((value) => print("aptUsuariosColModulos criado com sucesso!!"));
    aptUsuariosColModulos.doc().set({
      "cod_modulo": "2",
      "cod_usuario_col": "2",
    }).then((value) => print("aptUsuariosColModulos criado com sucesso!!"));
    aptUsuariosColModulos.doc().set({
      "cod_modulo": "3",
      "cod_usuario_col": "2",
    }).then((value) => print("aptUsuariosColModulos criado com sucesso!!"));
    aptUsuariosColModulos.doc().set({
      "cod_modulo": "4",
      "cod_usuario_col": "2",
    }).then((value) => print("aptUsuariosColModulos criado com sucesso!!"));
    aptUsuariosColModulos.doc().set({
      "cod_modulo": "1",
      "cod_usuario_col": "3",
    }).then((value) => print("aptUsuariosColModulos criado com sucesso!!"));
    aptUsuariosColModulos.doc().set({
      "cod_modulo": "2",
      "cod_usuario_col": "3",
    }).then((value) => print("aptUsuariosColModulos criado com sucesso!!"));
  } else {
    print("aptUsuariosColModulos | Quantida = $size | Já existe !!");
  }
}

void aptAmostrasCollection(FirebaseFirestore dataBase) async {
  int size = 0;
  CollectionReference aptAmostras = dataBase.collection("APT_AMOSTRAS");
  await aptAmostras.get().then((querySnapshot) => {size = querySnapshot.size});
  // ignore: unnecessary_null_comparison
  if (size <= 0 || size == null) {
    aptAmostras.doc().set({
      "cod_valor": "",
      "cod_praga": "",
      "cod_item": "",
      "des_valor": ""
    }).then((value) => print("aptAmostras criado com sucesso!!"));
  } else {
    print("aptAmostras | Quantida = $size | Já existe !!");
  }
}

void aptDadosAmostrasCollection(FirebaseFirestore dataBase) async {
  int size = 0;
  CollectionReference aptDadosAmostras =
      dataBase.collection("APT_DADOS_AMOSTRAS");
  await aptDadosAmostras
      .get()
      .then((querySnapshot) => {size = querySnapshot.size});
  // ignore: unnecessary_null_comparison
  if (size <= 0 || size == null) {
    aptDadosAmostras.doc().set({
      "id_amostra_col": "",
      "cod_unidade": "",
      "cod_usuario_col": "",
      "dta_apontamento": "",
      "cod_ponto": "",
      "cod_fazenda": "",
      "cod_talhao_01": "",
      "cod_talhao_02": "",
      "cod_modulo": "",
      "dta_coletor": "",
      "dta_gps": "",
      "vlr_lat": "",
      "vlr_lon": "",
      "flg_foto": ""
    }).then((value) => print("aptDadosAmostras criado com sucesso!!"));
  } else {
    print("aptDadosAmostras | Quantida = $size | Já existe !!");
  }
}

void aptAmostrasColaboradoresCollection(FirebaseFirestore dataBase) async {
  int size = 0;
  CollectionReference aptAmostrasColaboradores =
      dataBase.collection("APT_AMOSTRAS_COLABORADORES");
  await aptAmostrasColaboradores
      .get()
      .then((querySnapshot) => {size = querySnapshot.size});
  // ignore: unnecessary_null_comparison
  if (size <= 0 || size == null) {
    aptAmostrasColaboradores.doc().set({
      "id_dado_amostra_col": "",
      "id_amostra_col": "",
      "cod_praga": "",
      "cod_item": "",
      "vlr_valor": "",
      "dta_gps": "",
      "vlr_lat": "",
      "vlr_lon": ""
    }).then((value) => print("aptAmostrasColaboradores criado com sucesso!!"));
  } else {
    print("aptAmostrasColaboradores | Quantida = $size | Já existe !!");
  }
}
