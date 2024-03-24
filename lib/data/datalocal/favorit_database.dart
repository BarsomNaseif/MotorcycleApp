import 'package:flutter/material.dart';
import 'package:motorcycle_app/data/model/favorite_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class FavoriteDatabaseHelper {
  String TableFavorite = 'Favorite';
  String colId = 'id';
  String colname = 'name';
  String colPrice = "price";
  String colImage = 'image';
  String colRating = 'rating';

  static final FavoriteDatabaseHelper db = FavoriteDatabaseHelper();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDb();
    return _database!;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $TableFavorite'
        "($colId TEXT,"
        "$colname TEXT, $colRating INTEGER NOT NULL, $colPrice TEXT, $colImage TEXT)");
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'Favorite.db');
    var myDatabase = await openDatabase(path, version: 2, onCreate: _createDb);
    return myDatabase;
  }

  insert(Favorite_model model) async {
    var dbClient = await database;
    await dbClient.insert(
      TableFavorite,
      model.tojson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future deleteProduct(String productId) async {
    Database _db = await database;
    try {
      var delete = await _db.delete(
        TableFavorite,
        where: '$colId = ?',
        whereArgs: [productId],
      );
      return delete;
    } catch (e) {
      debugPrint("Something went wrong when deleting an item: $e");
    }
  }

  deleteAllProducts() async {
    Database _db = await database;
    await _db.delete(TableFavorite);
  }

  Future<List<Favorite_model>> getAllProducts() async {
    var dbClient = await database;

    final maps = await dbClient.query(TableFavorite);

    List<Favorite_model> list = maps.isNotEmpty
        ? maps.map((product) => Favorite_model.fromJson(product)).toList()
        : [];
    print(maps);
    print('*****');
    return list;
    // return maps.map((e) => cart_product_model.fromJson(e)).toList();
  }


}
