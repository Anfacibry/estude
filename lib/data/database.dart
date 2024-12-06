import 'package:estude/data/data_constante.dart';
import 'package:estude/model/disciplina.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String tabelaEstudosDisciplina = """
    CREATE TABLE ${CampTableDatabase.tabelaEstudoDisciplina}(
    ${CampTableDatabase.id} TEXT PRIMARY KEY,
    ${CampTableDatabase.idDisciplina} TEXT,
    ${CampTableDatabase.turno} INTEGER,
    ${CampTableDatabase.tempoHoras} INTEGER,
    ${CampTableDatabase.tempoMinutos} INTEGER
    );""";

const String tabelaDisciplina = """
  CREATE TABLE ${CampTableDatabase.tabelaDisciplina}(
  ${CampTableDatabase.id} TEXT PRIMARY KEY, 
  ${CampTableDatabase.nomeDisciplina} TEXT, 
  ${CampTableDatabase.nomeProfessor} TEXT
  );""";

Future<Database> bancoDeDados() async {
  final String path = join(await getDatabasesPath(), "db_disciplina.db");
  return openDatabase(
    path,
    onCreate: (db, version) {
      List<String> tabelas = [tabelaDisciplina, tabelaEstudosDisciplina];
      for (var tabelasPegas in tabelas) {
        db.execute(tabelasPegas);
      }
    },
    version: 1,
  );
}

Future<void> insertDisciplina(Disciplina disciplina) async {
  final db = await bancoDeDados();
  await db.insert(
    CampTableDatabase.tabelaDisciplina,
    disciplina.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Disciplina>> listaDisciplinas() async {
  final db = await bancoDeDados();
  final List<Map<String, Object?>> toMaps =
      await db.query(CampTableDatabase.tabelaDisciplina);
  return [
    for (final {
          CampTableDatabase.id: id as String,
          CampTableDatabase.nomeDisciplina: nameDisciplina as String,
          CampTableDatabase.nomeProfessor: professor as String,
        } in toMaps)
      Disciplina(id: id, nomeDisciplina: nameDisciplina, professor: professor)
  ];
}

Future<void> atualizandoDisciplina(Disciplina disciplina) async {
  final db = await bancoDeDados();
  await db.update(
    CampTableDatabase.tabelaDisciplina,
    disciplina.toMap(),
    where: "${CampTableDatabase.id} = ?",
    whereArgs: [disciplina.id],
  );
  listaDisciplinas();
}

Future<void> deletarDisciplina(Disciplina disciplina) async {
  final db = await bancoDeDados();
  await db.delete(
    CampTableDatabase.tabelaDisciplina,
    where: "${CampTableDatabase.id} = ?",
    whereArgs: [disciplina.id],
  );
  listaDisciplinas();
}
