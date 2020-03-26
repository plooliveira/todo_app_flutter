import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoapp/models/task_data.dart';
import 'package:provider/provider.dart';

class TaskList extends StatefulWidget {

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: Provider.of<TaskData>(context).taskName(index),
          isChecked: Provider.of<TaskData>(context).taskCheck(index),
          taskIndex: index,
          checkBoxCallback: (checkBoxState){
            Provider.of<TaskData>(context, listen: false).toggleDone(index);
          }
        );
      },
      itemCount: Provider.of<TaskData>(context).taskCount,
    );
  }
}
