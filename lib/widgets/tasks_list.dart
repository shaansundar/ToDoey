import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoeyv2/model/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child){
        return ListView.builder(itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TaskTile(
            title: task.name,
            isChecked: task.isDone,
            checkboxCallback:(bool checkboxState) {
              taskData.updateTask(task);
            },
              longPressCallBack:(){
                taskData.popTask(task);
              },
          );
        },itemCount: taskData.taskCount,);
      },
    );
  }
}
