import '../../utils/data_constante.dart';

class Disciplina {
  final String idDisciplina;
  final String nomeDisciplina;
  final String professor;
  Disciplina({
    required this.idDisciplina,
    required this.nomeDisciplina,
    required this.professor,
  });

  Map<String, Object?> toMap() {
    return {
      CampTableDatabase.idDisciplina: idDisciplina,
      CampTableDatabase.nomeDisciplina: nomeDisciplina,
      CampTableDatabase.nomeProfessor: professor,
    };
  }

  @override
  String toString() {
    return "id: $idDisciplina Disciplina: $nomeDisciplina, Professor: $professor";
  }
}
