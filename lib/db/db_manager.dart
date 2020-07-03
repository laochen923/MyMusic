import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBManager {
  static const _VERSION = 1;

  static const _NAME = "mymusic.db";

  static Database _database;

  static String path;

  ///初始化
  static init() async {
    var databasesPath = await getDatabasesPath();

    path = join(databasesPath, _NAME);

    _database = await openDatabase(
      path,
      version: _VERSION,
      onCreate: (Database db, int version) async {
        // 表格创建等初始化操作

      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        // 数据库升级
      },
    );
  }

  ///判断表是否存在
  static isTableExits(String tableName) async {
    await getCurrentDatabase();
    var res = await _database.rawQuery(
        "select * from Sqlite_master where type = 'table' and name = '$tableName'");
    return res != null && res.length > 0;
  }

  ///获取当前数据库对象
  static Future<Database> getCurrentDatabase() async {
    if (_database == null) {
      await init();
    }
    return _database;
  }

  ///关闭
  static close() {
    _database?.close();
  }

  ///关闭
  static delete() {
    deleteDatabase(path);
    _database = null;
  }
}
