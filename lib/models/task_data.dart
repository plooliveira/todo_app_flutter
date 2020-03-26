import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todoapp/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  void addTask(newTask) {
    _tasks.add(Task(name: newTask));
    notifyListeners();
  }

  void editTask({index, newValue}){
    _tasks[index] = Task(name: newValue, isDone: false);
    notifyListeners();

  }

  String taskName(index){
    return _tasks[index].name;
  }

  bool taskCheck(index){
    return _tasks[index].isDone;
  }

  void toggleDone(index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  int get taskCount{
    return _tasks.length;
  }

  void deleteCompletedTasks() {
    for (int i = 0; i < _tasks.length; i++) {
      if (_tasks[i].isDone == true) {
        _tasks.removeAt(i);
        i--;
      }
      notifyListeners();
    }
  }
}
