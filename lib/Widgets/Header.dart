import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Providers/TasksProvider.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TasksProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: 15, right: 0, bottom: 33, left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.list,
              color: Colors.blueAccent,
              size: 40,
            ),
          ),
          Text(
            'Todoey',
            style: TextStyle(
              fontSize: 50,
              color: Colors.white,
            ),
          ),
          Text(
            '${taskProvider.tasks.length} tasks',
            style: TextStyle(color: Colors.white, fontSize: 20),
          )
        ],
      ),
    );
  }
}
