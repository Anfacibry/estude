import 'package:estude/data/data_constante.dart';
import 'package:estude/model/estudo_disciplina.dart';

import 'package:sqflite/sqflite.dart';

import 'database.dart';

Future<List<List<EstudoDisciplina>>> listaEstudoDisciplinas() async {
  final db = await bancoDeDados();
  final List<Map<String, Object?>> toMaps =
      await db.query(CampTableDatabase.tabelaEstudoDisciplina);

  List<EstudoDisciplina> lista = [
    for (final {
          CampTableDatabase.id: id as String,
          CampTableDatabase.idDisciplina: idDisciplina as String,
          CampTableDatabase.turno: turno as int,
          CampTableDatabase.tempoHoras: tempoHoras as int,
          CampTableDatabase.tempoMinutos: tempoMinutos as int
        } in toMaps)
      EstudoDisciplina(
          id: id,
          idDisciplina: idDisciplina,
          turno: turno,
          tempoHoras: tempoHoras,
          tempMinutos: tempoMinutos)
  ];
  List<EstudoDisciplina> manha = lista.where((dis) => dis.turno == 1).toList();
  List<EstudoDisciplina> tarde = lista.where((dis) => dis.turno == 2).toList();
  List<EstudoDisciplina> noite = lista.where((dis) => dis.turno == 3).toList();

  return [
    manha,
    tarde,
    noite,
  ];
}

Future<void> insertEstudoDisciplina(EstudoDisciplina estudoDisciplina) async {
  final db = await bancoDeDados();
  await db.insert(
    CampTableDatabase.tabelaEstudoDisciplina,
    estudoDisciplina.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<void> atualizandoEstudoDisciplina(
    EstudoDisciplina estudoDisciplina) async {
  final db = await bancoDeDados();
  await db.update(
    CampTableDatabase.tabelaEstudoDisciplina,
    estudoDisciplina.toMap(),
    where: "${CampTableDatabase.id} = ?",
    whereArgs: [estudoDisciplina.id],
  );
}

Future<void> deletarEstudoDisciplina(EstudoDisciplina estudoDisciplina) async {
  final db = await bancoDeDados();
  await db.delete(
    CampTableDatabase.tabelaEstudoDisciplina,
    where: "${CampTableDatabase.id} = ?",
    whereArgs: [estudoDisciplina.id],
  );
  listaEstudoDisciplinas();
}
