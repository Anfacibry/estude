import '../data/data_constante.dart';

class EstudoDisciplina {
  final String id, idDisciplina;
  final int turno;
  final int tempoHoras;
  final int tempMinutos;

  EstudoDisciplina({
    required this.id,
    required this.idDisciplina,
    required this.turno,
    required this.tempoHoras,
    required this.tempMinutos,
  });

  Map<String, Object?> toMap() => {
        CampTableDatabase.id: id,
        CampTableDatabase.idDisciplina: idDisciplina,
        CampTableDatabase.turno: turno,
        CampTableDatabase.tempoHoras: tempoHoras,
        CampTableDatabase.tempoMinutos: tempMinutos,
      };

  @override
  String toString() {
    return "ID: $id, nome_disciplina: ****, Professor: **** Turno: $turno, Tempo: $tempoHoras : $tempMinutos";
  }
}
