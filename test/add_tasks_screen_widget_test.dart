import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/dark_theme.dart';
import 'package:todoey/widgets/add_tasks_screen.dart';

void main() {
  testWidgets('AddTasksSreen', (WidgetTester tester) async {
    final addTaskKey = Key('add_task_button');
    final addTaskTextField = Key('task_text_field');

    await tester.pumpWidget(
      ChangeNotifierProvider<DarkThemeData>(
        create: (builder) => DarkThemeData(),
        child: MaterialApp(
          home: Scaffold(
            body: AddTasksScreen(),
          ),
        ),
      ),
    );

    expect(find.text('Add Task'), findsOneWidget);
    expect(find.byKey(addTaskTextField), findsOneWidget);
    expect(find.byKey(addTaskKey), findsOneWidget);
  });
}
