import 'package:sqflite/sqflite.dart' as db;
import 'package:path/path.dart' as path;

class DataBaseUtil {
  static Future<db.Database> database() async {
    final dbPath = await db.getDatabasesPath();

    return db.openDatabase(
      path.join(dbPath, 'characters.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE characters ('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'advantage TEXT, '
          'disadvantage TEXT, '
          'spells TEXT, '
          'moneyItems TEXT, '
          'history TEXT, '
          'healthPoints INTEGER, '
          'experience INTEGER, '
          'magicPoints INTEGER)',
        );
      },
      version: 1,
    );
    print('CREATE TABLE characters ('
        'id INTEGER PRIMARY KEY, '
        'name TEXT, '
        'advantage TEXT, '
        'disadvantage TEXT, '
        'spells TEXT, '
        'moneyItems TEXT, '
        'history TEXT, '
        'healthPoints INTEGER, '
        'experience INTEGER, '
        'magicPoints INTEGER)');
  }

  static Future<void> insert(String table, Map<String, dynamic> data) async {
    final dataBase = await DataBaseUtil.database();

    await dataBase.insert(
      table,
      data,
      conflictAlgorithm: db.ConflictAlgorithm.replace,
    );
  }
}
