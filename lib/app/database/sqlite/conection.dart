import 'package:path/path.dart';
import 'package:pi_agenda/app/database/sqlite/script.dart';
import 'package:sqflite/sqflite.dart';

class Conection {
  static Database? _db;

  //retorna a conexão ao banco de dados
  static Future<Database> get() async {
    // verifica se a conexão existe e se está aberta
    if (_db == null || !_db!.isOpen) {
      var path = join(await getDatabasesPath(), 'banco_contatos');
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, v) {
          db.execute(criarTabela);
          db.execute(inserir1);
          db.execute(inserir2);
          db.execute(inserir3);
        },
      );
    }
    return _db!;
  }
}
