import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier{
  List<Task> _tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Eggs'),
    Task(name: 'Call X'),
  ];
  int get taskCount{
    return _tasks.length;
  }


  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newtaskTitle){
    final task=Task(name: newtaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void popTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }

}