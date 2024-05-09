import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import '../moudle/user.dart';

class DBUserProvider {
  late Database db;
  final database = "user.db";
  final table = "user";
  static DBUserProvider? _instance;
  static DBUserProvider instance = getInstance();

  DBUserProvider._();

  factory DBUserProvider() {
    return instance;
  }

  static getInstance() {
    if (_instance == null) {
      _instance = DBUserProvider._();
    }
    return _instance ?? DBUserProvider._();
  }

  connection() async {


    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, database);

    // await deleteDatabase(path);
    print('当前地址：${path}');
    if (File(path).existsSync()) {
      db = await openDatabase(path);
    } else {
      db = await openDatabase(path, version: 1,
          onCreate: (database, version) async {
        database.execute(
            "CREATE TABLE `${table}` (id integer primary key autoincrement,name text not null,age INTEGER )");
      });
    }
  }

  close() async {
    await db.close();
  }

  //插入
  Future<User> insert(User user) async {
    int id = await db.insert(table, user.toJson());
    user.id = id;
    return user;
  }

  //删除
  Future<int> delete(int id) async {
    return await db.delete(table, where: "id = ?", whereArgs: [id]);
  }

  //通过id查询
  Future<User?> selectById(int id) async {
    var list = await db.query(table, where: "id = ?", whereArgs: [id]);
    if (list.isNotEmpty) {
      return User.fromJson(list.first);
    }
    return null;
  }

  //获取所有列表
  Future<List<User>> queryList() async {
    var result = await db.query(table);
    return result.map((e) => User.fromJson(e)).toList();
  }

  //修改信息
  Future<int> update(User user) async {
    return await db
        .update(table, user.toJson(), where: "id = ?", whereArgs: [user.id]);
  }
}
