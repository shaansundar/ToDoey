import 'package:flutter/material.dart';
import 'package:todoeyv2/model/task_data.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String title;
  final Function checkboxCallback;
  final Function longPressCallBack;


  TaskTile({this.isChecked,this.title,this.checkboxCallback,this.longPressCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          decoration: isChecked?TextDecoration.lineThrough:null,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
        onChanged: checkboxCallback,
      ),
        onLongPress:longPressCallBack,
    );
  }
}
//

