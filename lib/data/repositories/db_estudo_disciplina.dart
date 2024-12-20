import 'package:estude/data/services/obtendo_dados.dart';
import 'package:estude/utils/data_constante.dart';
import 'package:estude/data/model/estudo_disciplina.dart';

import 'package:sqflite/sqflite.dart';

import 'database.dart';

///Arquivo de ação CRUD de estudoDisciplina

///Adicionando estudoDisciplina
Future<void> insertEstudoDisciplina(EstudoDisciplina estudoDisciplina) async {
  final db = await bancoDeDados();
  await db.insert(
    CampTableDatabase.nomeTbEstudoDisciplina,
    estudoDisciplina.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

///Atualizando estudoDisciplina
Future<void> atualizandoEstudoDisciplina(
    EstudoDisciplina estudoDisciplina) async {
  final db = await bancoDeDados();
  await db.update(
    CampTableDatabase.nomeTbEstudoDisciplina,
    estudoDisciplina.toMap(),
    where: "${CampTableDatabase.idEstudoDisciplina} = ?",
    whereArgs: [estudoDisciplina.idEstudoDisciplina],
  );
}

///Deletando estudoDisciplina
Future<void> deletarEstudoDisciplina(EstudoDisciplina estudoDisciplina) async {
  final db = await bancoDeDados();
  await db.delete(
    CampTableDatabase.nomeTbEstudoDisciplina,
    where: "${CampTableDatabase.idEstudoDisciplina} = ?",
    whereArgs: [estudoDisciplina.idEstudoDisciplina],
  );
  listaEstudoDisciplinas();
}
