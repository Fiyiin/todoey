import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/dark_theme.dart';
import 'package:todoey/models/task.dart';

class AddTasksScreen extends StatelessWidget {
  AddTasksScreen({Key key, this.addTask}) : super(key: key);
  final Function addTask;
  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<DarkThemeData>(context);
    String newTask;
    return Container(
      decoration: BoxDecoration(
        color: themeData.darkTheme ? Colors.black : (0xff757575),
        border: Border(
          top: BorderSide(
            width: 0,
            color: themeData.darkTheme ? Colors.black : (0xff757575),
          ),
        ),
      ),
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
              key: Key('task_text_field'),
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
              key: Key('add_task_button'),
              color: Colors.lightBlueAccent,
              child: Text(
                'ADD',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                if (newTask != null) {
                  addTask(Task(name: newTask));
                }

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
