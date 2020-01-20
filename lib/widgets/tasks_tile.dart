import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/dark_theme.dart';

class TaskTile extends StatelessWidget {
  TaskTile({this.isChecked, this.title, this.onChanged, this.dismiss, Key key})
      : super(key: key);

  final bool isChecked;
  final String title;
  final Function onChanged;
  final Function dismiss;

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<DarkThemeData>(context);
    return Dismissible(
      key: UniqueKey(),
      background: stackBehindDismiss(),
      child: ListTile(
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
      ),
      onDismissed: dismiss,
      direction: DismissDirection.startToEnd,
    );
  }

  Container stackBehindDismiss() {
    return Container(
      padding: EdgeInsets.only(left: 20.0),
      color: Colors.red,
      child: Row(
        children: <Widget>[
          Icon(
            Icons.delete,
            color: Colors.white,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            'Delete',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.0),
          ),
        ],
      ),
    );
  }
}
