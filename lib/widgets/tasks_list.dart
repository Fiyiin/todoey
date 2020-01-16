import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/widgets/tasks_tile.dart';

class TasksList extends StatelessWidget {
  TasksList({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Task> loader = [Task(name:'  ')];
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return FutureBuilder<List<Task>>(
            future: taskData.tasks,
            initialData: loader,
            builder:
                (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
              List<Task> tasks = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return TaskTile(
                    title: task.name,
                    isChecked: task.isDone,
                    onChanged: (newValue) {
                      taskData.updateTask(task);
                    },
                    longPress: () {
                      taskData.deleteTask(context, task.id);
                    },
                  );
                },
                itemCount: tasks.length ?? 0,
              );
            });
      },
    );
  }
}
