import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todoey/models/task.dart';

class SQLiteProvider {
  SQLiteProvider._();
  static final SQLiteProvider db = SQLiteProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'task_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE tasks(id INTEGER PRIMARY KEY, name TEXT, completed INTEGER)",
        );
      },
      version: 1,
    );
  }

  Future<void> createTask(Task task) async {
    final Database db = await database;

    await db.insert('tasks', task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Task>> getTasks() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('tasks');

    return List.generate(maps.length, (i) {
      return Task(
        id: maps[i]['id'],
        name: maps[i]['name'],
        isDone: maps[i]['completed'] == 0 ? false : true,
      );
    });
  }

  Future<void> updateTask(Task task) async {
    final Database db = await database;

    await db
        .update('tasks', task.toMap(), where: "id =  ?", whereArgs: [task.id]);
  }

  Future<void> deleteTask(int id) async {
    final Database db = await database;

    await db.delete('tasks', where: "id = ?", whereArgs: [id]);
  }
}
