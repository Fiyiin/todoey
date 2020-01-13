import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/dark_theme.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/screens/tasks_screen.dart';

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
        )
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
