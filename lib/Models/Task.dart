import 'package:flutter/material.dart';

class Task with ChangeNotifier {
  int id;
  final String toDo;
  bool isDone;
  Task({this.id, @required this.toDo, this.isDone = false});
  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        toDo: json["task"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "task": toDo,
      };
  void toggleIsDone() {
    this.isDone = !this.isDone;
    notifyListeners();
  }
}
