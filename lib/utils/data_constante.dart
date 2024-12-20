import 'package:uuid/uuid.dart';

class CampTableDatabase {
  ///Nomes para disciplinas
  static const String idDisciplina = "id_disciplina";
  static const String nomeDisciplina = "nome_disciplina";
  static const String nomeProfessor = "nome_professor";

  ///Nomes para estudoDisciplina
  static const String idEstudoDisciplina = "id_estudo_disciplina";
  static const String turno = "turno";
  static const String tempoEstudadoDia = "tempo_estudadoDia";
  static const String dia = "dia";
  static const String tempo = "tempo";

  ///Nomes de tabelas
  static const String nomeTbDisciplina = "tabela_disciplina";
  static const String nomeTbEstudoDisciplina = "tabela_estudo_disciplina";

  ///Criando a tebala de disciplina
  static const String criandoTabelaDisciplina = """
  CREATE TABLE $nomeTbDisciplina(
  $idDisciplina TEXT PRIMARY KEY, 
  $nomeDisciplina TEXT, 
  $nomeProfessor TEXT
  );""";

  ///Criando a tebala de estudoDisciplina
  static const String criandoTabelaEstudoDisciplina = """
    CREATE TABLE $nomeTbEstudoDisciplina(
    $idEstudoDisciplina TEXT PRIMARY KEY,
    $idDisciplina TEXT,
    $dia TEXT,
    $turno INTEGER,
    $tempo INTEGER,
    $tempoEstudadoDia INTEGER,
    FOREIGN KEY ($idDisciplina) 
    REFERENCES $nomeTbDisciplina ($idDisciplina)
    );""";

  ///Filtrando estudoDiscipliane e disciplinas
  ///INNER JOIN de estudoDiscipliane e disciplinas
  static const String innerJoinEstudoDisciplinaEDisciplina = """
  SELECT $nomeTbDisciplina.$nomeDisciplina,
  $nomeTbDisciplina.$nomeProfessor,
  $nomeTbEstudoDisciplina.$idEstudoDisciplina,
  $nomeTbEstudoDisciplina.turno,
  $nomeTbEstudoDisciplina.tempo,
  $nomeTbEstudoDisciplina.CampTableDatabase.dia
  FROM $nomeTbEstudoDisciplina.
  INNER JOIN $nomeTbDisciplina ON 
  $nomeTbEstudoDisciplina.$idEstudoDisciplina = 
  $nomeTbDisciplina.$idDisciplina;
  """;
}

///Uuid para criar chaves primarias aleatorias
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
