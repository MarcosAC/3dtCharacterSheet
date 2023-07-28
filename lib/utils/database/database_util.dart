import 'package:dtcharactersheet/models/character.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as db;

class DataBaseUtil {
  static Future<db.Database> database() async {
    final dbPath = await db.getDatabasesPath();

    return db.openDatabase(
      path.join(dbPath, 'characters.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE characters ('
          'id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'name TEXT, '
          'force INTEGER, '
          'ability INTEGER, '
          'resistance INTEGER, '
          'armor INTEGER, '
          'firePower INTEGER, '
          'healthPoints INTEGER, '
          'magicPoints INTEGER, '
          'forceDamage TEXT, '
          'firePowerDamage TEXT, '
          'water INTEGER, '
          'air INTEGER, '
          'fire INTEGER, '
          'light INTEGER, '
          'earth INTEGER, '
          'darkness INTEGER, '
          'advantage TEXT, '
          'disadvantage TEXT, '
          'spells TEXT, '
          'moneyItems TEXT, '
          'history TEXT, '
          'experience INTEGER)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, dynamic> data) async {
    final dataBase = await DataBaseUtil.database();
    await dataBase.insert(table, data, conflictAlgorithm: db.ConflictAlgorithm.replace);
  }

  static Future<void> delete(String table, int? id) async {
    final dataBase = await DataBaseUtil.database();
    await dataBase.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> update(String table, Character data) async {
    final dataBase = await DataBaseUtil.database();
    await dataBase.update(table, data.toMap(), where: 'id = ?', whereArgs: [data.id]);
  }

  static Future<List<Map<String, dynamic>>> getAll(String table) async {
    final dataBase = await DataBaseUtil.database();
    return dataBase.query(table);
  }
}
