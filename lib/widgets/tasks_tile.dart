import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile({this.isChecked, this.title, this.onChanged});
  final bool isChecked;
  final String title;
  final Function onChanged;

  // void onChanged(newValue) {
  //   setState(() {
  //     isChecked = newValue;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(value: isChecked, onChanged: onChanged),
    );
  }
}
