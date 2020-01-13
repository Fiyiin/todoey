import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/dark_theme.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/screens/tasks_screen.dart';

void main() {
  testWidgets('finds TaskScreen()', (WidgetTester tester) async {
    final homeWidget = TasksScreen();

    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskData>(
          create: (builder) => TaskData(),
        ),
        ChangeNotifierProvider(
          create: (context) => DarkThemeData(),
        ),
      ],
      child: MaterialApp(
        home: homeWidget,
      ),
    ));

    expect(find.byWidget(homeWidget), findsOneWidget);
  });
}
