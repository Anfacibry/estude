import 'package:estude/data/services/obtendo_dados.dart';
import 'package:estude/utils/data_constante.dart';
import 'package:estude/data/model/disciplina.dart';
import 'package:sqflite/sqflite.dart';

import 'database.dart';

///Arquivo de ação CRUD de estudoDisciplina
///
///Adicionando uma disciplina no banco de dados
Future<void> insertDisciplina(Disciplina disciplina) async {
  final db = await bancoDeDados();
  await db.insert(
    CampTableDatabase.nomeTbDisciplina,
    disciplina.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

///Atualizando uma disciplina do banco de dados
Future<void> atualizandoDisciplina(Disciplina disciplina) async {
  final db = await bancoDeDados();
  await db.update(
    CampTableDatabase.nomeTbDisciplina,
    disciplina.toMap(),
    where: "${CampTableDatabase.idDisciplina} = ?",
    whereArgs: [disciplina.idDisciplina],
  );
  listaDisciplinas();
}

///Deletando uma disciplina do banco de dados
Future<void> deletarDisciplina(Disciplina disciplina) async {
  final db = await bancoDeDados();
  await db.delete(
    CampTableDatabase.nomeTbDisciplina,
    where: "${CampTableDatabase.idDisciplina} = ?",
    whereArgs: [disciplina.idDisciplina],
  );
  listaDisciplinas();
}
