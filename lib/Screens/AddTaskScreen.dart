import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Models/Task.dart';
import 'package:todo_app/Providers/TasksProvider.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasksProvider = Provider.of<TasksProvider>(context);
    String newTask;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          Text(
            'Add task',
            style: TextStyle(fontSize: 50, color: Colors.blueAccent),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            child: TextField(
              onChanged: (value) {
                newTask = value;
              },
              autofocus: true,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 4),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 4),
                ),
              ),
            ),
          ),
          MaterialButton(
            color: Colors.blueAccent,
            minWidth: 300,
            height: 50,
            child: Text('Add'),
            textColor: Colors.white,
            onPressed: () {
              final newTaskObject = Task(toDo: newTask);
              tasksProvider.addTaks(newTaskObject);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
