import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/help_models.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'helpsdatabase.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE helps(name TEXT NOT NULL, mail TEXT NOT NULL, subject TEXT NOT NULL, message TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }

  Future<int> insertHelps(HelpModel model) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.insert('helps', model.toJson());
    print("eklendi");
    return result;
  }

  Future<List<HelpModel>> getHelps() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('helps');
    return queryResult.map((e) => HelpModel.fromJson(e)).toList();
  }

  void updateHelps(HelpModel model) async {
    final Database db = await initializeDB();
    db.update('helps', model.toJson());
  }

  void deleteHelps(HelpModel model) async {
    final Database db = await initializeDB();
    db.delete('helps');
  }
}