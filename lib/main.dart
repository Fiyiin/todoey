import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/dark_theme.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/screens/tasks_screen.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> database;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeData themeChangeData = DarkThemeData();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeData.darkTheme =
        await themeChangeData.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DarkThemeData(),
        ),
        ChangeNotifierProvider<TaskData>(
          create: (context) => TaskData(),
        ),
        FutureProvider<int>(
          create: (context) => TaskData().taskCount(),
          updateShouldNotify: (t, f) => t != f,
        ),
      ],
      child: Consumer<DarkThemeData>(
        builder: (BuildContext context, value, Widget child) {
          return MaterialApp(
            home: TasksScreen(),
          );
        },
      ),
    );
  }
}
