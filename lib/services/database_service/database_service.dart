import 'package:extraterrestrial_weather/models/image_db_item.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseService {
  DataBaseService(this.db);

  Database db;

  Future<List<ImageDbItem>> getAllImages() async {
    List<Map> maps = await db.query(ImageDbItem.tableName,
        orderBy: ImageDbItem.columnDate + " DESC");
    return ImageDbItem.fromMapList(maps);
  }

  Future<void> addImage(ImageDbItem image) async {
    await db.insert(ImageDbItem.tableName, image.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteImage(String hdURL) async {
    await db.delete(
      ImageDbItem.tableName,
      where: "${ImageDbItem.columnURL} = ?",
      whereArgs: [hdURL],
    );
  }
}
