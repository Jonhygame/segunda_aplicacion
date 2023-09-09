import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AgendaDB {
  static final nameDB = 'AGENDADB';
  static final versionDB = 1;

  static late Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    return _database = await _initDatabase();
  }

  /*Future<Database?> _initDatabase() async {
    Directory folder = await getApplicationCacheDirectory();
    String pathDB = join(folder.path.nameDB);
    return await openDatabase(pathDB,
        version: versionDB, onCreate: _createDB, onUpgrade: _upgradeDB);
  }*/

  FutureOr<void> _upgradeDB(Database db, int oldVersion, int newVersion) {}

  FutureOr<void> _createDB(Database db, int version) {
    String query = '''CREATE TABLE tblTareas(
      idTask INTEGER PRIMARY KEY,
      nameTask VARCHAR(50),
      descriptionTask VARCHAR(50),
      sttTask BYTE)''';
    db.execute(query);
  }
}
