import '../data/data_constante.dart';

class Disciplina {
  final String id;
  final String nomeDisciplina;
  final String professor;
  Disciplina({
    required this.id,
    required this.nomeDisciplina,
    required this.professor,
  });

  Map<String, Object?> toMap() {
    return {
      CampTableDatabase.id: id,
      CampTableDatabase.nomeDisciplina: nomeDisciplina,
      CampTableDatabase.nomeProfessor: professor,
    };
  }

  @override
  String toString() {
    return "id: $id Disciplina: $nomeDisciplina, Professor: $professor";
  }
}
