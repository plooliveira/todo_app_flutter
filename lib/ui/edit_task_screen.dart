import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/task_data.dart';

class EditTaskScreen extends StatefulWidget {
  final String taskText;
  final int index;

  EditTaskScreen({this.taskText, this.index});

  @override
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
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
                'Edit Task', style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent
              ),
              ),
            ),
            //selection: new TextSelection.collapsed(offset: _username.length-1)
            TextField(
              controller: TextEditingController.fromValue(TextEditingValue(text: widget.taskText, selection: TextSelection.collapsed(offset: widget.taskText.length ) )),
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
                  if (taskName != null && taskName != widget.taskText) {
                    Provider.of<TaskData>(context, listen: false).editTask(index: widget.index, newValue: taskName);
                  }
                  Navigator.pop(context);
                },
                child: Text('Save edition', style: TextStyle(color: Colors.white),),
                color: Colors.deepPurpleAccent,

              ),
            )
          ],
        ),
      ),
    );
  }
}
