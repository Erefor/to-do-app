import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/Models/Task.dart';

class DbProvider {
  static Database _dataBase;
  static final DbProvider db = DbProvider._();
  DbProvider._();

  Future<Database> get dataBase async {
    if (_dataBase == null) {
      return _dataBase = await initDB();
    } else {
      return _dataBase;
    }
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'Tasks.db');
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE Tasks(
            id INTEGER PRIMARY KEY,
            task TEXT
          )
        ''');
      },
    );
  }

  Future<List> getTasks() async {
    final db = await dataBase;
    final response = await db.query('Tasks');
    if (response.isEmpty) {
      return null;
    } else {
      return response.map((task) => Task.fromJson(task)).toList();
    }
  }

  newRawTask(Task task) async {
    final db = await dataBase;
    await db.rawInsert('''
      INSERT INTO Tasks(id,task)
        VALUES(${task.id},'${task.toDo}')
    ''');
  }

  Future<int> newTask(Task task) async {
    final db = await dataBase;
    final res = await db.insert('Tasks', task.toJson());
    return res;
  }

  Future<int> deleteScan(int id) async {
    final db = await dataBase;
    final res = await db.delete('Tasks', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  void killAllTasks()async{
    final db = await dataBase;
    db.delete('Tasks');
  }
}
