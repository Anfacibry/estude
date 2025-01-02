import 'dart:typed_data';

import 'package:estude/data/model/disciplina.dart';
import 'package:flutter/foundation.dart';

import '../../utils/data_constante.dart';

class EstudoDisciplina extends Disciplina {
  final String idEstudoDisciplina;
  final List<int> dia;
  final int turno;
  final String tempo;

  EstudoDisciplina({
    required this.idEstudoDisciplina,
    super.idDisciplina = "",
    super.nomeDisciplina = "",
    super.professor = "",
    required this.dia,
    required this.turno,
    required this.tempo,
  });

  @override
  Map<String, Object?> toMap() => {
        CampTableDatabase.idEstudoDisciplina: idEstudoDisciplina,
        CampTableDatabase.idDisciplina: idDisciplina,
        CampTableDatabase.dia: Uint8List.fromList(dia),
        CampTableDatabase.turno: turno,
        CampTableDatabase.tempo: tempo,
      };

  @override
  String toString() {
    return "Id_Estudo_Disciplina: $idEstudoDisciplina, id_Disciplina $idDisciplina, nome_disciplina: $nomeDisciplina, Professor: $professor Turno: $turno, Tempo: $tempo, dia: $dia";
  }
}
