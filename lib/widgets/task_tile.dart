import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/ui/edit_task_screen.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkBoxCallback;
  final int taskIndex;

  TaskTile({this.isChecked, this.taskTitle, this.taskIndex, this.checkBoxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: GestureDetector(
        onTap: (){
          print('hello');
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: EditTaskScreen(taskText: taskTitle, index: taskIndex,),
                    )));
//

        },
        child: Container(
          child: Text(
            taskTitle,
            style: TextStyle(
              decoration: isChecked? TextDecoration.lineThrough: null
            ),
          ),
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.deepPurpleAccent,
        value: isChecked,
        onChanged: checkBoxCallback,
      ),
    );
  }
}
