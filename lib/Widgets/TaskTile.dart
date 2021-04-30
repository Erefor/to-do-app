import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String toDo;
  final bool isDone;
  final Function toggleIsDone;
  final Function killTask;
  TaskTile({this.toDo, this.isDone, this.toggleIsDone, this.killTask});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        toDo,
        style: TextStyle(
          fontSize: 25,
          decoration: isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isDone,
        onChanged: toggleIsDone,
      ),
      onLongPress: killTask,
    );
  }
}
