import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String taskName;

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 55.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                'Add Task', style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent
              ),
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value){

                if (value != null) {
                  taskName = value;
                }
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            ButtonTheme(
              height: 50.0,
              child: RaisedButton(
                onPressed: (){
                  if (taskName != null) {
                    Provider.of<TaskData>(context, listen: false).addTask(taskName);
                  }
                  Navigator.pop(context);
                },
                child: Text('add task', style: TextStyle(color: Colors.white),),
                color: Colors.deepPurpleAccent,

              ),
            )
          ],
        ),
      ),
    );
  }
}
