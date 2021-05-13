import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Models/Task.dart';
import 'package:todo_app/Providers/TasksProvider.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasksProvider = Provider.of<TasksProvider>(context);
    final textEditingController = TextEditingController();
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
              controller: textEditingController,
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
              if(newTask == '' || newTask == null){
                _showAlert(context);
                textEditingController.clear();
              }else{
                
                final newTaskObject = Task(toDo: newTask);
                tasksProvider.addTaks(newTaskObject);
                textEditingController.clear();
                Navigator.pop(context);
              }
              
            },
          )
        ],
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          title: Center(child: Text('Add some values, please.')),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              }, 
              child: Text('Got it!')
            )
          ],
        );
      }
    );
  }
}
