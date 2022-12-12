import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection{
  setDatabase() async{
    var directory = await getApplicationDocumentsDirectory();
    print(directory);
    var path = join(directory.path,'norhum_eitango');
    var database = await openDatabase(path,version: 1,onCreate: (Database db,int version) async{
      db.execute('CREATE TABLE eitango (id INTEGER PRIMARY KEY AUTOINCREMENT,english_word TEXT,japanese_word TEXT)');
    });

    return database;
  }
}