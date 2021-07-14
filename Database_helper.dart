
import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {

  static final _databaseName = "customer_info.db";
  static final _databaseVersion = 1;

  static final table = 'signup_table';
  static final table_login = "log_table";

  static final columnId = '_id';
  static final firstName = 'firstname';
  static final lastName = 'lastname';
  static final userName = 'username';
  static final mobNum = "mobile";
  static final password ="password";

  @override
  int get schemaVersion => 2;
  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database ?_database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $firstName TEXT NOT NULL,
            $lastName TEXT NOT NULL,
            $userName TEXT NOT NULL,
            $mobNum TEXT NOT NULL,
            $password TEXT NOT NULL
          )
          ''');
    await db.execute('''
    CREATE TABLE $table_login (
    $columnId INTEGER PRIMARY KEY,
    $userName TEXT NOT NULL,
    $password TEXT NOT NULL   )
    
    ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert_data(String table, Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(table, row);
  }


  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await instance.database;
    return await db!.query(table);
  }
  Future<int> update(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    int id = row[columnId];
    return await db!.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database? db = await instance.database;
    return await db!.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

// All of the methods (insert, query, update, delete) can also be done using
// raw SQL commands. This method uses a raw query to give the row count.
  Future checkLogin(String username, String passwd) async {
    Database? db = await instance.database;
    var res = await db!.rawQuery("select * from $table where $userName = '$username' and $password = '$passwd' ");
    return res;
  }
}
