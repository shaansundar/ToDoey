import 'package:flutter/material.dart';
import 'package:todoeyv2/model/task.dart';
import 'package:todoeyv2/model/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {

  final Function addTaskCallBack;
  AddTaskScreen(this.addTaskCallBack);

  @override
  Widget build(BuildContext context) {
    String newTaskTitle;

    return Consumer<TaskData>(
      builder: (context, taskData, child){
        return Container(
//      height: 900,
          decoration: BoxDecoration(
            color: Color(0xFF757575),
          ),
          child: Container(
//        height: 900,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20), topLeft: Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10,),
                TextField(
                  autofocus: true,
                  textAlign: TextAlign.center,
                  onChanged: (newText){
                    newTaskTitle=newText;
                  },
                ),
                SizedBox(height: 20,),
                FlatButton(
                  color: Colors.lightBlueAccent,
                  onPressed: (){
                    taskData.addTask(newTaskTitle);
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Text('Add',style: TextStyle(color: Colors.white),),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),

                  ),
                )
              ],
            ),
          ),
        );
      }
       ,
    );
  }
}
