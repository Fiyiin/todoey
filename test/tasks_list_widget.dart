import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/tasks_list.dart';

void main() {
  testWidgets('TasksList Widget', (WidgetTester tester) async {
    // await tester.longPress(finder)
    await tester.pumpWidget(
        ChangeNotifierProvider<TaskData>(
          create: (builder) => TaskData(),
          child: MaterialApp(
            home: Scaffold(
              body: TasksList(),
            ),
          ),
        ),
      );
  });
}

