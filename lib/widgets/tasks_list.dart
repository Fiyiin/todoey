import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/tasks_tile.dart';

class TasksList extends StatelessWidget {
  TasksList({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              title: task.name,
              isChecked: task.isDone,
              onChanged: (newValue) {
                taskData.updateTask(task);
              },
              longPress: () {
                taskData.deleteTask(context, index);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
