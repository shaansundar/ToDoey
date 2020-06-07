import 'package:flutter/material.dart';
import 'package:todoeyv2/widgets/tasks_list.dart';
//import 'package:todoeyv2/widgets/task_tile.dart';
import 'package:todoeyv2/screens/addTaskScreen.dart';
import 'package:todoeyv2/model/task.dart';
import 'package:provider/provider.dart';
import 'package:todoeyv2/model/task_data.dart';

class TasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddTaskScreen((newTaskTitle) {
//                        setState(() {
//                          tasks.add(Task(name: newTaskTitle));
//                        });
                        Navigator.pop(context);
                      }),
                    ),
                  ),
              isScrollControlled: true);
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 60, left: 30.0, right: 30, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ToDoey',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${Provider.of<TaskData>(context).taskCount} Tasks',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Long Press on tasks to delete them',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: TasksList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
