import 'package:flutter/material.dart';
import 'task.dart';
import 'package:todoey/models/database.dart';

class TaskData extends ChangeNotifier {
  Future<int> taskCount() async {
    List<Task> tasksList = await tasks;
    return tasksList?.length ?? 0;
  }

  Future<List<Task>> get tasks async {
    return await SQLiteProvider.db.getTasks();
  }

  void addTask(Task newTask) async {
    await SQLiteProvider.db.createTask(newTask);
    notifyListeners();
  }

  void updateTask(Task task) async {
    task.toggleDone();
    SQLiteProvider.db.updateTask(task);
    notifyListeners();
  }

  void deleteTask(BuildContext context, int id) {
    SQLiteProvider.db.deleteTask(id);
    notifyListeners();
  }
}
