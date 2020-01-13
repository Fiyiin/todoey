import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/dark_theme.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/screens/tasks_screen.dart';

void main() {
  group('TasksScreen', () {
    Future<void> _buildTasksScreen(WidgetTester tester) {
      return tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<TaskData>(
              create: (builder) => TaskData(),
            ),
            ChangeNotifierProvider<DarkThemeData>(
              create: (context) => DarkThemeData(),
            ),
          ],
          child: MaterialApp(
            home: TasksScreen(),
          ),
        ),
      );
    }

    testWidgets('finds widget that displays app title',
        (WidgetTester tester) async {
      await _buildTasksScreen(tester);

      Builder(builder: (BuildContext context) {
        expect(find.text('Todoey'), findsOneWidget);
        expect(
            find.text(
              '${Provider.of<TaskData>(context).taskCount} Tasks',
            ),
            findsOneWidget);
        return Placeholder();
      });
    });

    testWidgets('finds widget that displays number of tasks',
        (WidgetTester tester) async {
      await _buildTasksScreen(tester);

      Builder(builder: (BuildContext context) {
        expect(
            find.text(
              '${Provider.of<TaskData>(context).taskCount} Tasks',
            ),
            findsOneWidget);
        return Placeholder();
      });
    });

    testWidgets('finds a specific instance of TaskList',
        (WidgetTester tester) async {
      final testKey = Key('task_list');

      await _buildTasksScreen(tester);

      expect(find.byKey(testKey), findsOneWidget);
    });

    testWidgets('finds FloatinActionButton', (WidgetTester tester) async {
      await _buildTasksScreen(tester);

      expect(find.byType(FloatingActionButton), findsOneWidget);
    });
  });
}
