import 'package:flutter/material.dart';
import 'task.dart';
import 'package:todoey/models/database.dart';

class TaskData extends ChangeNotifier {
  Future<int> taskCount() async {
    List<Task> tasksList = await tasks;
    print(tasksList.length);
    return tasksList.length;
  }

  get taskkk {

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

  Future<void> deleteTask(BuildContext context, int id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('Delete Task?')),
          content: Text('Are you sure you want to delete this task?'),
          actions: <Widget>[
            FlatButton(
              child: Text('No'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                SQLiteProvider.db.deleteTask(id);
                notifyListeners();
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
