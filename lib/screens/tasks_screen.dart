import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/dark_theme.dart';
import 'package:todoey/widgets/add_tasks_screen.dart';
import 'package:todoey/widgets/tasks_list.dart';
import 'package:todoey/models/task_data.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<DarkThemeData>(context);
    return Scaffold(
      backgroundColor:
          themeData.darkTheme ? Colors.black : Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 20.0, bottom: 30.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 25.0,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.list,
                              color: Colors.lightBlueAccent,
                              size: 25.0,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Todoey',
                            style: TextStyle(
                              fontSize: 45.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Dark mode',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Switch(
                            activeColor: Colors.lightBlueAccent,
                            activeTrackColor: Colors.white,
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: Colors.white,
                            value: themeData.darkTheme,
                            onChanged: (value) {
                              themeData.darkTheme = value;
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                  child: FutureBuilder(
                    future: Provider.of<TaskData>(context).taskCount(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return Text(
                        '${snapshot.data ?? 0 } Tasks',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: themeData.darkTheme ? Colors.black : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Builder(
                builder: (BuildContext context) {
                  return FutureBuilder(
                    future: Provider.of<TaskData>(context).taskCount(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data == 0) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 80.0),
                            child: Text(
                              'No tasks here yet...',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: themeData.darkTheme
                                    ? Colors.white
                                    : Colors.black38,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return TasksList();
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        key: Key('FAB'),
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: Colors.white,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTasksScreen(
              key: Key('add_tasks_screen'),
              addTask: Provider.of<TaskData>(context).addTask,
            ),
          );
        },
      ),
    );
  }
}
