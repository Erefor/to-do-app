import 'package:flutter/cupertino.dart';
import 'package:todo_app/Models/Task.dart';
import 'package:todo_app/Providers/DbProvider.dart';

class TasksProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTaks(Task task) async {
    final newTask = Task(toDo: task.toDo);
    final id = await DbProvider.db.newTask(newTask);
    newTask.id = id;
    _tasks.add(task);
    DbProvider.db.newTask(task);
    notifyListeners();
  }

  void killTask(Task task) {
    _tasks.remove(task);
    DbProvider.db.deleteScan(task.id);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleIsDone();
    notifyListeners();
  }

  loadTasks() async {
    final tasks = await DbProvider.db.getTasks();
    this._tasks = tasks;
    notifyListeners();
  }
}
