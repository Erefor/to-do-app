import 'package:flutter/cupertino.dart';
import 'package:todo_app/Models/Task.dart';

class TasksProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTaks(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void killTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleIsDone();
    notifyListeners();
  }
}
