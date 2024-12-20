import 'package:estude/utils/data_constante.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> bancoDeDados() async {
  final String path = join(await getDatabasesPath(), "db_disciplina.db");
  return openDatabase(
    path,
    onCreate: (db, version) {
      List<String> tabelas = [
        CampTableDatabase.criandoTabelaDisciplina,
        CampTableDatabase.criandoTabelaEstudoDisciplina
      ];
      for (var tabelasPegas in tabelas) {
        db.execute(tabelasPegas);
      }
    },
    version: 1,
  );
}
