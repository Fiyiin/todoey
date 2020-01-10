import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/widgets/tasks_list.dart';

class AddTasksScreen extends StatelessWidget {
  AddTasksScreen({this.addTask, this.tasks});
  final Function addTask;
  final List<Task> tasks;
  @override
  Widget build(BuildContext context) {
    String newTask;
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 45.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Text(
                'Add Task',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),
            TextField(
              autofocus: true,
              decoration: InputDecoration(focusColor: Colors.lightBlueAccent),
              onChanged: (value) {
                newTask = value;
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
              color: Colors.lightBlueAccent,
              child: Text(
                'ADD',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                addTask(Task(name: newTask));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
