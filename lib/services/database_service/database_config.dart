import 'package:extraterrestrial_weather/models/image_db_item.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static const databaseName = 'weather.db';
  static Database? _database;

  Future<Database> getInstance() async {
    if (_database == null) {
      _database = await openDatabase(
        databaseName,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(ImageDbItem.create());
          await db.execute(
              "CREATE UNIQUE INDEX ix_uniq ON ${ImageDbItem.tableName}(${ImageDbItem.columnURL})");
        },
      );
    }
    return _database!;
  }

  Future<Database> get database async {
    if (_database == null) {
      return await getInstance();
    } else {
      return _database!;
    }
  }

  close() async {
    await _database?.close();
  }
}
