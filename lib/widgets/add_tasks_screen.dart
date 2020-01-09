import 'package:flutter/material.dart';

class AddTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 45.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Text(
                'Add Task',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),
            TextField(
              autofocus: true,
              decoration: InputDecoration(focusColor: Colors.lightBlueAccent),
              onChanged: null,
            ),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
              color: Colors.lightBlueAccent,
              child: Text(
                'ADD',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                 
              },
            ),
          ],
        ),
      ),
    );
  }
}
