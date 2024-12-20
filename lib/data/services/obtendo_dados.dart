import 'package:estude/data/model/disciplina.dart';
import 'package:estude/utils/data_constante.dart';
import 'package:flutter/material.dart';

import '../model/estudo_disciplina.dart';
import '../repositories/database.dart';

///Pegando as listas das disciplinas do banco de dados
Future<List<Disciplina>> listaDisciplinas() async {
  final db = await bancoDeDados();
  final List<Map<String, Object?>> toMaps =
      await db.query(CampTableDatabase.nomeTbDisciplina);
  return [
    for (final {
          CampTableDatabase.idDisciplina: idDisciplina as String,
          CampTableDatabase.nomeDisciplina: nameDisciplina as String,
          CampTableDatabase.nomeProfessor: professor as String,
        } in toMaps)
      Disciplina(
          idDisciplina: idDisciplina,
          nomeDisciplina: nameDisciplina,
          professor: professor)
  ];
}

///Obtendo lista com os dados de ESTUDOS DISCIPLINA filtrado por turno
Future<List<List<EstudoDisciplina>>> listaEstudoDisciplinas() async {
  final db = await bancoDeDados();
  final List<Map<String, Object?>> toMaps =
      await db.query(CampTableDatabase.nomeTbEstudoDisciplina);
  debugPrint(toMaps.toString());

  List<EstudoDisciplina> lista = [
    for (final {
          CampTableDatabase.idEstudoDisciplina: idEstudoDisciplina as String,
          CampTableDatabase.idDisciplina: idDisciplina as String,
          CampTableDatabase.dia: dia as List<int>,
          CampTableDatabase.turno: turno as int,
          CampTableDatabase.tempo: tempo as int,
          CampTableDatabase.tempoEstudadoDia: tempoEstudoDia as int
        } in toMaps)
      EstudoDisciplina(
          idEstudoDisciplina: idEstudoDisciplina,
          idDisciplina: idDisciplina,
          dia: dia,
          turno: turno,
          tempo: tempo,
          tempoEstudadoDia: tempoEstudoDia)
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

///Teste de join
Future<List<Disciplina>> listaFiltrada() async {
  final db = await bancoDeDados();
  final List<Map<String, Object?>> toMaps =
      await db.rawQuery(CampTableDatabase.innerJoinEstudoDisciplinaEDisciplina);
  debugPrint("Chegou aqui ${toMaps.toString()}");
  return [
    for (final {
          CampTableDatabase.idDisciplina: idDisciplina as String,
          CampTableDatabase.nomeDisciplina: nameDisciplina as String,
          CampTableDatabase.nomeProfessor: professor as String,
        } in toMaps)
      Disciplina(
          idDisciplina: idDisciplina,
          nomeDisciplina: nameDisciplina,
          professor: professor)
  ];
}