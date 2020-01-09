import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  void onChanged(newValue) {
    setState(() {
      isChecked = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'My task',
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: TaskCheckbox(isChecked: isChecked, onChanged: onChanged),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  const TaskCheckbox({
    @required this.isChecked,
    @required this.onChanged,
  });

  final bool isChecked;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(value: isChecked, onChanged: onChanged);
  }
}
