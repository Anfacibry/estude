import 'package:flutter/foundation.dart';

import '../../utils/data_constante.dart';

class EstudoDisciplina {
  final String idEstudoDisciplina;
  final String idDisciplina;
  final List<int> dia;
  final int turno;
  int tempoEstudadoDia;
  final int tempo;

  EstudoDisciplina({
    required this.idEstudoDisciplina,
    required this.idDisciplina,
    required this.dia,
    required this.turno,
    this.tempoEstudadoDia = 0,
    required this.tempo,
  });

  Map<String, Object?> toMap() => {
        CampTableDatabase.idEstudoDisciplina: idEstudoDisciplina,
        CampTableDatabase.idDisciplina: idDisciplina,
        CampTableDatabase.dia: Uint8List.fromList(dia),
        CampTableDatabase.turno: turno,
        CampTableDatabase.tempo: tempo,
        CampTableDatabase.tempoEstudadoDia: tempoEstudadoDia,
      };

  @override
  String toString() {
    return "ID: $idEstudoDisciplina, nome_disciplina: ****, Professor: **** Turno: $turno, Tempo: $tempo, TempoEstudadoDia: $tempoEstudadoDia";
  }
}
