import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/dark_theme.dart';

class TaskTile extends StatelessWidget {
  TaskTile({this.isChecked, this.title, this.onChanged, this.longPress});
  final bool isChecked;
  final String title;
  final Function onChanged;
  final Function longPress;

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<DarkThemeData>(context);
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: themeData.darkTheme ? Colors.white : Colors.black,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Theme(
        data: ThemeData(
          unselectedWidgetColor:
              themeData.darkTheme ? Colors.white : Colors.black45,
        ),
        child: Checkbox(
          focusColor: Colors.black,
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: onChanged,
        ),
      ),
      onLongPress: longPress,
    );
  }
}
