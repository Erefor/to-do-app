import 'package:flutter/material.dart';

class Task with ChangeNotifier {
  final String toDo;
  bool isDone;
  Task({this.toDo, this.isDone = false});
  void toggleIsDone() {
    this.isDone = !this.isDone;
    notifyListeners();
  }
}
