//https://www.youtube.com/watch?v=lUgJQoMsIUY
import 'package:eitango_kun/source/repositories/database_connection.dart';
import 'package:sqflite/sqflite.dart';

class Repository{
  DatabaseConnection? _databaseConnection;

  Repository(){
    _databaseConnection = DatabaseConnection();
  }

  static Database? _database;

  Future<Database> get database async{
    if(_database != null) return _database!;
    _database = await _databaseConnection!.setDatabase();
    return _database!;
  }

  insertData(table,data)async{
    var connection = await database;
    return await connection.insert(table, data);
  }

  readData(table) async{
    var connection = await database;
    return await connection.query(table);
  }

  readDataByID(table,id) async{
    var connection = await database;
    return await connection.query(table,where: 'id=?',whereArgs: [id]);
  }

  updateData(table,data) async{
    var connection = await database;
    return await connection.update(table, data,where: 'id=?',whereArgs: [data['id']]);
  }
}