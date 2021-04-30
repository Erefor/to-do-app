import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Providers/TasksProvider.dart';
import 'TaskTile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(
      builder: (context, taskList, wid) {
        return ListView.builder(
          itemCount: taskList.tasks.length,
          itemBuilder: (context, index) {
            return TaskTile(
              toDo: taskList.tasks[index].toDo,
              isDone: taskList.tasks[index].isDone,
              toggleIsDone: (checkBoxState) {
                taskList.updateTask(taskList.tasks[index]);
              },
              killTask: () {
                taskList.killTask(taskList.tasks[index]);
              },
            );
          },
        );
      },
    );
  }
}
