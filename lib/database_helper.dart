import 'dart:async';
import 'dart:io';

import 'package:flutter_gank/entity/news_data_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DataBaseHelper {
  static final DataBaseHelper _dataBaseHelper = new DataBaseHelper.internal();

  factory DataBaseHelper() => _dataBaseHelper;

  DataBaseHelper.internal();

  static Database _db;

  Future<String> get _dbPath async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "flutter.db");
    return path;
  }

  Future<Database> get create async {
    final path = await _dbPath;
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE news (articleId INTEGER PRIMARY KEY, articleTitle TEXT, coverBigUrl TEXT, authorPortraitUrl TEXT, authorName TEXT, articleRead INTEGER)");
    });
    return database;
  }

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await create;
    return _db;
  }

  Future<void> close() async {
    final db = await create;
    return db.close();
  }

  //增删改查
  Future<int> saveNews(Articles article) async {
    final db = await create;
    return db.insert("news", article.toMap());
  }

  Future<List<Map<String, dynamic>>> getAllNews() async {
    final db = await create;
    var result = await db.query("news", columns: [
      "articleId",
      "articleTitle",
      "coverBigUrl",
      "authorPortraitUrl",
      "authorName",
      "articleRead"
    ]);
    return result.toList();
  }

  Future<Articles> getNews(int articleId) async {
    final db = await create;
    List<Map<String, dynamic>> result =
        await db.rawQuery("SELECT * FROM news where articleId = $articleId");
    if (result.length > 0) {
      return Articles.fromJson(result.first);
    }

    return null;
  }

  Future<int> deleteNews(int articleId) async {
    final db = await create;
    return db.delete("news", where: "articleId = ?", whereArgs: [articleId]);
  }
}
