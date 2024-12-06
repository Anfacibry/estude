import 'package:uuid/uuid.dart';

class CampTableDatabase {
  static const String id = "id";
  static const String idDisciplina = "idDisciplina";
  static const String nomeDisciplina = "nomeDisciplina";
  static const String nomeProfessor = "nomeProfessor";
  static const String turno = "turno";
  static const String tempoHoras = "tempoHoras";
  static const String tempoMinutos = "tempoMinutos";

  static const String tabelaDisciplina = "disciplina";
  static const String tabelaEstudoDisciplina = "estudo_disciplina";
}

var uuid = const Uuid();

DateTime dataAtual = DateTime.now();
List<DateTime> listaDatas = [
  dataAtual,
  DateTime(dataAtual.year, dataAtual.month, dataAtual.day + 1,
      dataAtual.weekday + 1),
  DateTime(dataAtual.year, dataAtual.month, dataAtual.day + 2,
      dataAtual.weekday + 2),
  DateTime(dataAtual.year, dataAtual.month, dataAtual.day + 3,
      dataAtual.weekday + 3),
  DateTime(dataAtual.year, dataAtual.month, dataAtual.day + 4,
      dataAtual.weekday + 4),
  DateTime(dataAtual.year, dataAtual.month, dataAtual.day + 5,
      dataAtual.weekday + 5),
  DateTime(dataAtual.year, dataAtual.month, dataAtual.day + 6,
      dataAtual.weekday + 6),
];

List<String> textAppBar = [
  "Home",
  "Cronograma",
  "Disciplina",
  "Perfil",
];
